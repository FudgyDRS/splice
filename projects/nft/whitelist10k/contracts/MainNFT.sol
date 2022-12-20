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
//import "./lib/TokenTransferrer.sol";

contract TestNFT is ERC721Enumerable, Ownable/* , TokenTransferrer */ {

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
      //if((_maxSupply != 100) && (_maxSupply != 2500) && (_maxSupply != 10000)) revert BadMaxSupply(_maxSupply);
      //maxSupply = _maxSupply;
      //payoutPeriod = 31536000;
  }

  function storeBitwiseWhitelist(uint256[] calldata list) public {
    //
    assembly {
      let ptr
      //let len := mload(list)
      //while (iszero(sub(len, ptr))) {
        calldatacopy(0, list.offset, list.length)
        //keccak256()
        ptr := add(ptr, 1)
      //}
      //while (mod(ptr, len)) {}
      //sstore()
    }
  }
}
