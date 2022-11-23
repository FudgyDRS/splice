// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {MockERC721} from "./MockERC721.sol";

contract MockERC721Sale {

  constructor() {
    feeReceiver = msg.sender;
  }


  uint256 _fee = 7000;
  address feeReceiver;

  struct activeSale {
    uint256 amount;
    uint256 fee; // 10000 = 10%
    address seller;
    address owner;
    bool active;
  }

  mapping(address => mapping(uint256 => activeSale)) public sale;

  error NotForSale();
  error InsufficentPayment();
  error InsufficentLiquidity();
  error SameOwner();
  error NotOwner();
  
  /**
    * @notice seller must accept approve all (this is typically saved as EIP712)
    */
  function sellToken(address _contract, uint256 tokenId, uint256 _value) public {
    if(MockERC721(_contract).ownerOf(tokenId) != msg.sender) revert NotOwner();
    activeSale storage _sale = sale[_contract][tokenId];

    _sale.amount = _value;
    _sale.fee = 7000;
    _sale.seller = msg.sender;
    _sale.owner = feeReceiver;
    _sale.active = true;
  }

  function buyToken(address _contract, uint256 tokenId) public payable {
    activeSale storage _sale = sale[_contract][tokenId];
    if(!_sale.active) revert NotForSale();
    if(_sale.amount > msg.value) revert InsufficentPayment();
    if(_sale.seller == msg.sender) revert SameOwner();
    _sale.active = false;

    uint256 toContract = msg.value * 7 / 100;
    uint256 toSeller = msg.value - toContract;
    bool success;

    MockERC721(_contract).transferFrom(_sale.seller, address(this), tokenId);

    (success,) = _contract.call{value: toContract}("");
    if(!success) revert InsufficentLiquidity();
    (success,) = _sale.seller.call{value: toSeller}("");
    if(!success) revert InsufficentLiquidity();

    MockERC721(_contract).transferFrom(address(this), msg.sender, tokenId);
  }

  function cancelToken(address _contract, uint256 tokenId) public {
    MockERC721(_contract).setApprovalForAll(address(this), true);
    activeSale storage _sale = sale[_contract][tokenId];

    _sale.active = false;
  }
}
