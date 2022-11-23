// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
pragma abicoder v2;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import {ERC721Enumerable} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";
import "./lib/TokenTransferrer.sol";

/**
 * @title Splice NFT
 * @notice Splice Main NFT contract
 */
contract TestNFT is ERC721Enumerable, Ownable, TokenTransferrer {
  using SafeERC20 for IERC20;
  using Strings for uint256;

  uint256 public immutable maxSupply;
  uint256 public payoutPeriod;

  bool public isLocked;
  string public baseURI;

  event Lock();
  event NonFungibleTokenRecovery(address indexed token, uint256 tokenId);
  event TokenRecovery(address indexed token, uint256 amount);
  event WithdrawERC20(address token, address to, uint256 amount);
  event CreateStake();
  event ClaimStake();
  event EndStake();

  error InsufficentLiquidity();
  error ContractLocked();
  error BadMaxSupply(uint256 input);
  error MaxSupplyReached();
  error TokenIndexDoesNotExist(uint256 tokenId);
  error NotOwnerOrApproved();
  error InputAlreadySet();

  /**
    * @notice Constructor
    * @param _name: NFT name
    * @param _symbol: NFT symbol
    * @param _maxSupply: NFT max totalSupply
    */
  constructor(
      string memory _name,
      string memory _symbol,
      uint256 _maxSupply
  ) ERC721(_name, _symbol) {
      if((_maxSupply != 100) && (_maxSupply != 2500) && (_maxSupply != 10000)) revert BadMaxSupply(_maxSupply);
      maxSupply = _maxSupply;
      payoutPeriod = 31536000;
  }

  /**
    * @notice Allows the owner to lock the contract
    * @param state: toggle lock state
    * @dev Callable by owner
    */
  function lock(bool state) external onlyOwner {
      if(isLocked == state) revert InputAlreadySet();
      isLocked = state;
      emit Lock();
  }

  /**
    * @notice Allows the owner to mint a token to a specific address
    * @param _to: address to receive the token
    * @param _tokenId: tokenId
    * @dev Callable by owner
    */
  function mint(address _to, uint256 _tokenId) external onlyOwner {
      if(totalSupply() >= maxSupply) revert MaxSupplyReached();
      _mint(_to, _tokenId);
  }

  /**
    * @notice Allows the owner to set the base URI to be used for all token IDs
    * @param _uri: base URI (preferably IPFS)
    * @dev Callable by owner
    */
  function setBaseURI(string memory _uri) external onlyOwner {
    if(isLocked) revert ContractLocked();
    baseURI = _uri;
  }

  /**
    * @notice Returns a list of token IDs owned by `user` given a `cursor` and `size` of its token list
    * @param user: address
    * @param cursor: cursor
    * @param size: size
    */
  function tokensOfOwnerBySize(
    address user,
    uint256 cursor,
    uint256 size
  ) external view returns (uint256[] memory, uint256) {
    uint256 length = size;
    if (length > balanceOf(user) - cursor) {
      length = balanceOf(user) - cursor;
    }

    uint256[] memory values = new uint256[](length);
    for (uint256 i = 0; i < length; i++) {
      values[i] = tokenOfOwnerByIndex(user, cursor + i);
    }

    return (values, cursor + length);
  }

  /**
    * @notice Returns the Uniform Resource Identifier (URI) for a token ID
    * @param tokenId: token ID
    */
  function tokenURI(uint256 tokenId) public view override returns (string memory) {
    if(!_exists(tokenId)) revert TokenIndexDoesNotExist(tokenId);

    return bytes(baseURI).length > 0 ? string(abi.encodePacked(baseURI, tokenId.toString(), ".json")) : "";
  }

  struct stake {
    uint256 start;
    uint256 end;
    uint256 lastClaim;
    uint256 remaining;
    uint256 initial;
    address owner;
  }

  mapping(uint256 => stake) stakeId;
  uint256 balance = 0;

  function transferFrom(
    address from,
    address to,
    uint256 tokenId
  ) public virtual override(ERC721, IERC721) {
    //solhint-disable-next-line max-line-length
    if(!_isApprovedOrOwner(_msgSender(), tokenId)) revert NotOwnerOrApproved();
    endStake(tokenId);
    _transfer(from, to, tokenId);
    createStake(to, tokenId);
  }

  function checkStake(uint256 tokenId) public view returns(stake memory) {
    return stakeId[tokenId];
  }

  /** @notice When a token is transfered (i.e. sold, auctioned, or transferFrom),
    *   Remaining Ether from stake is transfered to owner and remaining balance is set to zero
    */
  function endStake(uint256 tokenId) internal {
    stake storage _stake = stakeId[tokenId];
    if(_stake.remaining > 0) {
      uint256 burned = _stake.remaining;
      _stake.remaining = 0;
      if(burned != 0) {
        owner().call{value: burned}("");
      }
    }
  }

  function createStake(address to, uint256 tokenId) internal {
    //uint256 _balance = balance
    stakeId[tokenId] = stake(
      block.timestamp, 
      block.timestamp + payoutPeriod, 
      block.timestamp, 
      balance, // remaining
      balance, // initial
      to
      );
      balance = 0;
  }

  /**
    * @notice Claim is automatically pushed from transactions. Claim can be foreced under two scenerios:
    *   (1) Claimed can be manually executed
    *   (2) NFT can be transfered to the same or alternative wallet
    * @param tokenId: token ID
    */
  function claimStake(uint256 tokenId) external {
    stake storage _stake = stakeId[tokenId];
    uint256 reward = _stake.initial * (block.timestamp - _stake.lastClaim) / (_stake.end - _stake.start);
    if(_stake.remaining < reward) { reward = _stake.remaining; }
    _stake.lastClaim = block.timestamp;
    _stake.remaining = _stake.remaining - reward;
    (bool success,) = _stake.owner.call{value: reward}("");
    if(!success) revert InsufficentLiquidity();
    balance = address(this).balance;

    // creates st
  }

  /**
    * @notice fallback reciever splits received funds to owner and rebate
              3.2% to rebate (0.4571)
              3.8% to owner (0.5429)
    */
  receive() external payable {
    if(msg.value > 0) {
      if(balance !=0) {
        owner().call{ value: balance }("");
        balance = msg.value;
      } else {
        uint256 isOwner = msg.value * 5429 / 10000;
        uint256 isStake = msg.value - isOwner;
        owner().call{value: isOwner}("");
        balance = isStake;
      }
    }
  }

  /**
    * @notice Claim tokens using optimized library
    * @param token: target contract tokens
    * @param from:
    * @param to:
    * @param amount: number of tokens to transfer from target contract
    */
  function withdrawERC20(address token, address from, address to, uint256 amount) public onlyOwner {
    _performERC20Transfer(token, from, to, amount);
  }

  /**
    * @notice Allows the owner to recover tokens sent to the contract by mistake
    * @param _token: token address
    * @dev Callable by owner
    */
  /*   function recoverToken(address _token) external onlyOwner {
    uint256 balance = IERC20(_token).balanceOf(address(this));
    require(balance != 0, "Operations: Cannot recover zero balance");

    IERC20(_token).safeTransfer(address(msg.sender), balance);

    emit TokenRecovery(_token, balance);
  } */

  /**
    * @notice Allows the owner to recover non-fungible tokens sent to the contract by mistake
    * @param _token: NFT token address
    * @param _tokenId: tokenId
    * @dev Callable by owner
    */
  /* function recoverNonFungibleToken(address _token, uint256 _tokenId) external onlyOwner {
      IERC721(_token).transferFrom(address(this), address(msg.sender), _tokenId);

      emit NonFungibleTokenRecovery(_token, _tokenId);
  } */
}
