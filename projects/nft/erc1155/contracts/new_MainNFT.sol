// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/AccessControl.sol";
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC1155/ERC1155.sol";
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Strings.sol";

import "@openzeppelin/contracts-v0.7/access/AccessControl.sol";
import "@openzeppelin/contracts-v0.7/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts-v0.7/utils/Strings.sol";


abstract contract ContextMixin {
    function msgSender()
        internal
        view
        returns (address payable sender)
    {
        if (msg.sender == address(this)) {
            bytes memory array = msg.data;
            uint256 index = msg.data.length;
            assembly {
                // Load the 32 bytes word from memory with the address on the lower 20 bytes, and mask those.
                sender := and(
                    mload(add(array, index)),
                    0xffffffffffffffffffffffffffffffffffffffff
                )
            }
        } else {
            sender = payable(msg.sender);
        }
        return sender;
    }
}

contract Initializable {
    bool inited = false;

    modifier initializer() {
        require(!inited, "already inited");
        _;
        inited = true;
    }
}

contract EIP712Base is Initializable {
    struct EIP712Domain {
        string name;
        string version;
        address verifyingContract;
        bytes32 salt;
    }

    string constant public ERC712_VERSION = "1";

    bytes32 internal constant EIP712_DOMAIN_TYPEHASH = keccak256(
        bytes(
            "EIP712Domain(string name,string version,address verifyingContract,bytes32 salt)"
        )
    );
    bytes32 internal domainSeperator;

    // supposed to be called once while initializing.
    // one of the contracts that inherits this contract follows proxy pattern
    // so it is not possible to do this in a constructor
    function _initializeEIP712(
        string memory name
    )
        internal
        initializer
    {
        _setDomainSeperator(name);
    }

    function _setDomainSeperator(string memory name) internal {
        domainSeperator = keccak256(
            abi.encode(
                EIP712_DOMAIN_TYPEHASH,
                keccak256(bytes(name)),
                keccak256(bytes(ERC712_VERSION)),
                address(this),
                bytes32(getChainId())
            )
        );
    }

    function getDomainSeperator() public view returns (bytes32) {
        return domainSeperator;
    }

    function getChainId() public view returns (uint256) {
        uint256 id;
        assembly {
            id := chainid()
        }
        return id;
    }

    /**
     * Accept message hash and returns hash message in EIP712 compatible form
     * So that it can be used to recover signer from signature signed using EIP712 formatted data
     * https://eips.ethereum.org/EIPS/eip-712
     * "\\x19" makes the encoding deterministic
     * "\\x01" is the version byte to make it compatible to EIP-191
     */
    function toTypedMessageHash(bytes32 messageHash)
        internal
        view
        returns (bytes32)
    {
        return
            keccak256(
                abi.encodePacked("\x19\x01", getDomainSeperator(), messageHash)
            );
    }
}

contract NativeMetaTransaction is EIP712Base {
    bytes32 private constant META_TRANSACTION_TYPEHASH = keccak256(
        bytes(
            "MetaTransaction(uint256 nonce,address from,bytes functionSignature)"
        )
    );
    event MetaTransactionExecuted(
        address userAddress,
        address payable relayerAddress,
        bytes functionSignature
    );
    mapping(address => uint256) nonces;

    /*
     * Meta transaction structure.
     * No point of including value field here as if user is doing value transfer then he has the funds to pay for gas
     * He should call the desired function directly in that case.
     */
    struct MetaTransaction {
        uint256 nonce;
        address from;
        bytes functionSignature;
    }

    function executeMetaTransaction(
        address userAddress,
        bytes memory functionSignature,
        bytes32 sigR,
        bytes32 sigS,
        uint8 sigV
    ) public payable returns (bytes memory) {
        MetaTransaction memory metaTx = MetaTransaction({
            nonce: nonces[userAddress],
            from: userAddress,
            functionSignature: functionSignature
        });

        require(
            verify(userAddress, metaTx, sigR, sigS, sigV),
            "Signer and signature do not match"
        );

        // increase nonce for user (to avoid re-use)
        ++nonces[userAddress];

        emit MetaTransactionExecuted(
            userAddress,
            payable(msg.sender),
            functionSignature
        );

        // Append userAddress and relayer address at the end to extract it from calling context
        (bool success, bytes memory returnData) = address(this).call(
            abi.encodePacked(functionSignature, userAddress)
        );
        require(success, "Function call not successful");

        return returnData;
    }

    function hashMetaTransaction(MetaTransaction memory metaTx)
        internal
        pure
        returns (bytes32)
    {
        return
            keccak256(
                abi.encode(
                    META_TRANSACTION_TYPEHASH,
                    metaTx.nonce,
                    metaTx.from,
                    keccak256(metaTx.functionSignature)
                )
            );
    }

    function getNonce(address user) public view returns (uint256 nonce) {
        nonce = nonces[user];
    }

    function verify(
        address signer,
        MetaTransaction memory metaTx,
        bytes32 sigR,
        bytes32 sigS,
        uint8 sigV
    ) internal view returns (bool) {
        require(signer != address(0), "NativeMetaTransaction: INVALID_SIGNER");
        return
            signer ==
            ecrecover(
                toTypedMessageHash(hashMetaTransaction(metaTx)),
                sigV,
                sigR,
                sigS
            );
    }
}

contract GameItems is ERC1155, AccessControl {
    uint256 baseCost;
    uint256 baseUri;
    mapping(uint256 => mapping(uint256 => uint256)) tokenUri_;
    mapping(uint256 => uint256) tokenCost_;

  error WithdrawFailed();
  error TransferFailed(bytes);

  /**
    * @dev See {IERC165-supportsInterface}.
    */
  function supportsInterface(bytes4 interfaceId) public view virtual override(ERC1155, AccessControl) returns (bool) {
    return
      interfaceId == type(IAccessControl).interfaceId || 
      interfaceId == type(IERC1155).interfaceId ||
      interfaceId == type(IERC1155MetadataURI).interfaceId ||
      super.supportsInterface(interfaceId);
  }

  function withdraw() public payable onlyRole(DEFAULT_ADMIN_ROLE) {
    (bool success, ) = msg.sender.call{value: address(this).balance}("");
    if(!success) { revert WithdrawFailed(); }
  }

  function withdraw(address address_, uint256 amount_) public payable onlyRole(DEFAULT_ADMIN_ROLE) {
    bytes memory payload = abi.encodeWithSignature("transferFrom(address,address,uint256)", address(this), msg.sender, amount_);
    (bool success, bytes memory result) = address_.call(payload);
    if(!success) { revert TransferFailed(result); }
  }

  function withdraw1155(address address_, uint256[] memory ids, uint256[] memory amounts) public payable onlyRole(DEFAULT_ADMIN_ROLE) {
    ERC1155(address_).safeBatchTransferFrom(address(this), msg.sender, ids, amounts, "");
  }
}

contract OwnableDelegateProxy { }

contract ProxyRegistry {
  mapping(address => OwnableDelegateProxy) public proxies;
}

/**
 * @title ERC1155Tradable
 * ERC1155Tradable - ERC1155 contract that whitelists an operator address, has create and mint functionality, and supports useful standards from OpenZeppelin,
  like _exists(), name(), symbol(), and totalSupply()
 */
contract ERC1155Tradable is ContextMixin, ERC1155, NativeMetaTransaction, Ownable {
  using Strings for string;

  address proxyRegistryAddress;
  mapping (uint256 => address) public creators;
  mapping (uint256 => uint256) public tokenSupply;
  mapping (uint256 => string) customUri;
  // Contract name
  string public name;
  // Contract symbol
  string public symbol;

  uint256 public basePrice;
  mapping(uint256 => uint256) public tokenPrice;

  /**
   * @dev Sets the base price to mint for all tokens
   * @param basePrice_ uint256 price in wei for a token
   */
  function setBasePrice(uint256 basePrice_) public onlyOwner {
      basePrice = basePrice_;
  }

  /**
    * @dev Sets the token price to mint given a token ID
    * @param _tokenId uint256 token ID
    * @param tokenPrice_ uint256 price in wei for a token
    */
  function setTokenPrice(uint256 _tokenId, uint256 tokenPrice_) public creatorOnly(_tokenId) {
      tokenPrice[_tokenId] = tokenPrice_;
  }

  receive() external payable {}

  constructor(
    string memory _name,
    string memory _symbol,
    string memory _uri,
    address _proxyRegistryAddress
  ) payable ERC1155(_uri)  {
    name = _name;
    symbol = _symbol;
    proxyRegistryAddress = _proxyRegistryAddress;
    _initializeEIP712(name);
    _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
  }

  function uri(
    uint256 _id
  ) override public view returns (string memory) {
    require(_exists(_id), "ERC1155Tradable#uri: NONEXISTENT_TOKEN");
    // We have to convert string to bytes to check for existence
    bytes memory customUriBytes = bytes(customUri[_id]);
    if (customUriBytes.length > 0) {
        return customUri[_id];
    } else {
        return super.uri(_id);
    }
  }

  /**
    * @dev Returns the total quantity for a token ID
    * @param _id uint256 ID of the token to query
    * @return amount of token in existence
    */
  function totalSupply(
    uint256 _id
  ) public view returns (uint256) {
    return tokenSupply[_id];
  }

  /**
   * @dev Sets a new URI for all token types, by relying on the token type ID
    * substitution mechanism
    * https://eips.ethereum.org/EIPS/eip-1155#metadata[defined in the EIP].
   * @param _newURI New URI for all tokens
   */
  function setURI(
    string memory _newURI
  ) public onlyOwner {
    _setURI(_newURI);
  }

  /**
   * @dev Will update the base URI for the token
   * @param _tokenId The token to update. _msgSender() must be its creator.
   * @param _newURI New URI for the token.
   */
  function setCustomURI(
    uint256 _tokenId,
    string memory _newURI
  ) public creatorOnly(_tokenId) {
    customUri[_tokenId] = _newURI;
    emit URI(_newURI, _tokenId);
  }

  /**
    * @dev Creates a new token type and assigns _initialSupply to an address
    * NOTE: remove onlyOwner if you want third parties to create new tokens on
    *       your contract (which may change your IDs)
    * NOTE: The token id must be passed. This allows lazy creation of tokens or
    *       creating NFTs by setting the id's high bits with the method
    *       described in ERC1155 or to use ids representing values other than
    *       successive small integers. If you wish to create ids as successive
    *       small integers you can either subclass this class to count onchain
    *       or maintain the offchain cache of identifiers recommended in
    *       ERC1155 and calculate successive ids from that.
    * @param _initialOwner address of the first owner of the token
    * @param _id The id of the token to create (must not currenty exist).
    * @param _initialSupply amount to supply the first owner
    * @param _uri Optional URI for this token type
    * @param _data Data to pass if receiver is contract
    * @return The newly created token ID
    */
  function create(
    address _initialOwner,
    uint256 _id,
    uint256 _initialSupply,
    string memory _uri,
    bytes memory _data
  ) public onlyOwner returns (uint256) {
    require(!_exists(_id), "token _id already exists");
    creators[_id] = _msgSender();

    if (bytes(_uri).length > 0) {
      customUri[_id] = _uri;
      emit URI(_uri, _id);
    }

    _mint(_initialOwner, _id, _initialSupply, _data);

    tokenSupply[_id] = _initialSupply;
    return _id;
  }

  /**
    * @dev Mints some amount of tokens to an address
    * @param _to          Address of the future owner of the token
    * @param _id          Token ID to mint
    * @param _quantity    Amount of tokens to mint
    * @param _data        Data to pass if receiver is contract
    */
  function mint(
    address _to,
    uint256 _id,
    uint256 _quantity,
    bytes memory _data
  ) public payable {
    _mint(_to, _id, _quantity, _data);
    tokenSupply[_id] = tokenSupply[_id] + _quantity;
    //check price
  }

  /**
    * @dev Mint tokens for each id in _ids
    * @param _to          The address to mint tokens to
    * @param _ids         Array of ids to mint
    * @param _quantities  Array of amounts of tokens to mint per id
    * @param _data        Data to pass if receiver is contract
    */
  function batchMint(
    address _to,
    uint256[] memory _ids,
    uint256[] memory _quantities,
    bytes memory _data
  ) public payable {
    for (uint256 i = 0; i < _ids.length; i++) {
      uint256 _id = _ids[i];
      require(creators[_id] == _msgSender(), "ERC1155Tradable#batchMint: ONLY_CREATOR_ALLOWED");
      uint256 quantity = _quantities[i];
      tokenSupply[_id] = tokenSupply[_id] + quantity;
    }
    _mintBatch(_to, _ids, _quantities, _data);
  }

  /**
    * @dev Change the creator address for given tokens
    * @param _to   Address of the new creator
    * @param _ids  Array of Token IDs to change creator
    */
  function setCreator(
    address _to,
    uint256[] memory _ids
  ) public {
    require(_to != address(0), "ERC1155Tradable#setCreator: INVALID_ADDRESS.");
    for (uint256 i = 0; i < _ids.length; i++) {
      uint256 id = _ids[i];
      _setCreator(_to, id);
    }
  }

  /**
   * Override isApprovedForAll to whitelist user's OpenSea proxy accounts to enable gas-free listings.
   */
  function isApprovedForAll(
    address _owner,
    address _operator
  ) override public view returns (bool isOperator) {
    // Whitelist OpenSea proxy contract for easy trading.
    ProxyRegistry proxyRegistry = ProxyRegistry(proxyRegistryAddress);
    if (address(proxyRegistry.proxies(_owner)) == _operator) {
      return true;
    }

    return ERC1155.isApprovedForAll(_owner, _operator);
  }

  /**
    * @dev Change the creator address for given token
    * @param _to   Address of the new creator
    * @param _id  Token IDs to change creator of
    */
  function _setCreator(address _to, uint256 _id) internal creatorOnly(_id)
  {
      creators[_id] = _to;
  }

  /**
    * @dev Returns whether the specified token exists by checking to see if it has a creator
    * @param _id uint256 ID of the token to query the existence of
    * @return bool whether the token exists
    */
  function _exists(
    uint256 _id
  ) internal view returns (bool) {
    return creators[_id] != address(0);
  }

  function exists(
    uint256 _id
  ) external view returns (bool) {
    return _exists(_id);
  }

    /**
     * This is used instead of msg.sender as transactions won't be sent by the original token owner, but by OpenSea.
     */
    function _msgSender()
        internal
        override
        view
        returns (address sender)
    {
        return ContextMixin.msgSender();
    }
}
