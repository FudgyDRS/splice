// contracts/GameItems.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract GameItems is ERC1155, AccessControl {
    uint256 public constant GOLD = 0;
    uint256 public constant SILVER = 1;
    uint256 public constant THORS_HAMMER = 2;
    uint256 public constant SWORD = 3;
    uint256 public constant SHIELD = 4;

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

  constructor() payable ERC1155("https://game.example/api/item/{id}.json") {
    _mint(msg.sender, GOLD, 10**18, "");
    _mint(msg.sender, SILVER, 10**27, "");
    _mint(msg.sender, THORS_HAMMER, 1, "");
    _mint(msg.sender, SWORD, 10**9, "");
    _mint(msg.sender, SHIELD, 10**9, "");

    _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
  }

  receive() external payable {}

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

