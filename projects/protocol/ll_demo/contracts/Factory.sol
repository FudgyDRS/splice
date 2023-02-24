// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/** Factory functions:
  *   - create state contracts
  *   - initalize state contracts
  *   - determine deployment gas delegation
  *   - store referances to all current bytecode state contracts
  */

contract Factory {
  function CurrentContract(uint256 hash_) public view returns(address address_) {
    assembly {
      let success := delegatecall(
          gas(),
          contract_,
          data_,
          0x04,
          0x20,
          0x20
      )
    }
  }
  function DetermineGas() payable public returns(uint256,uint256) {}
  function Processing(uint256) payable public returns(bool) {}
  function Deployment(uint256) payable public returns(bool) {}
  function FactoryDelegation() internal returns(address) {}
}
