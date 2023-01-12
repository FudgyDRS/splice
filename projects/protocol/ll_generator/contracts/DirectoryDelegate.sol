//SPDX-License-Identifier: MIT

/**
  * Version 0.0.1
  * keccak256("Version 0.0.1") = 0x0a76669a4f36db2f2c3e4b147c4fc34966b259255516172eb048cfd631eb6e9d
  * This contract acts as delegate to versioning the directory proxy
  creation:
  call dir_del -> calls create2 and initialization
 */
pragma solidity 0.8.14;

contract DirectoryDelegate {
  address admin;
  //address proxy;

  constructor(address proxy, bytes32 version) payable {
    assembly {
      sstore(0, origin())
      sstore(1, mload(proxy))
      switch iszero(version)
        case 1: {
          d
        }
      }
    }
  }

  function delegate() payable external returns(address implementation) {
    assembly {
      calldatacopy(0x40, 0, calldatasize())
      pop(staticcall(
          gas(),
          sload(proxy.slot),
          0x40,
          calldatasize(),
          0x40,
          0x40
      ))
      implementation := mload(0x40)
    }
  }

  receive() external payable {}
  fallback() external {}
}