// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
pragma abicoder v2;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract GLDToken is ERC20 {

  address taxWallet;
  uint256 taxPercent; // of 10000
  uint256 taxDivisor = 10000; 
  constructor(uint256 initialSupply, address _taxWallet) ERC20("Gold", "GLD") {
    taxWallet = _taxWallet;
    _mint(msg.sender, initialSupply);
  }

  function setTaxPercent(uint256 _value) public onlyOwner {
    taxPercent = _value;
  }

  function setTaxDivisor(uint256 _value) public onlyOwner {
    taxDivisor = _value;
  }

  function approve(address spender, uint256 amount) public virtual override returns (bool) {
    uint256 tax = amount - amount * taxPercent / taxDivisor;
    transferFrom(msg.sender, _taxWallet, tax);

    return super.approve(spender, amount - tax);
  }
}
