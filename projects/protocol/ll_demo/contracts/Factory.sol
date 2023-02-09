// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Factory {
  function DetermineGas() payable public returns(uint256,uint256) {}
  function Processing(uint256) payable public returns(bool) {}
  function Deployment(uint256) payable public returns(bool) {}
  function FactoryDelegation() internal returns(address) {}
}
