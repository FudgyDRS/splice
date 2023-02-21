// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
// if external call reverts with error message, does it count as an event on the external contract
// can you get a revert event on an external contract without reverting the origin transaction

/*
contracts A and B

A calls B
  B reverts with special error (with data)
  A completes execution
*/

/**
  * VARS:
  *   0x00    deployer
  *   0x01    initialized
  *   0x02    owner
  *   0x03    admin dynamic (TBA)
  *   0x04    system job gas
  *   0x05    paid job gas
  *   0x06    free job gas
  *   0x07    system job dynamic
  *   0x08    paid job dynamic
  *     0xe33c290272880447f00f1a5b33f9e077b5cb5c8c71b08c563e83761acb70e8d1
  *     keccak256(0x08):            Jobs size
  *     add(keccak256(0x08), 0x20): Last processed
  *   0x09    free job dynamic
  */

contract Jobs {
  constructor() payable {
    assembly {
      sstore(0x00, caller())
    }
  }
  function initalize() external payable {
    assembly {
      if iszero(eq(caller(), sload(0x00))) { revert(0,0) } // needs a proper error msg
    }
  }
  function createSystemJob() external payable {
    assembly {
      if iszero(eq(caller(), sload(0x02))) { revert(0,0) } // needs a proper error msg
    }
  }

  function processPaidJobs() external payable {


  /**
    * Possible update (not nesicary for MVP demo): option for multiple selectors
    * OLD
    * 0xAddress                                 Gas             Selector
    * 0x1111111111111111111111111111111111111111000000000000000000000000
    * 0x0000000000000000000000000000000000000000111111111111111100000000
    * 0x0000000000000000000000000000000000000000000000000000000011111111
    * 
    * NEW
    * 0xAddress                                 Gas1Gas2Select 1Select 2
    * 0x1111111111111111111111111111111111111111000000000000000000000000
    * 0x0000000000000000000000000000000000000000111100000000000000000000
    * 0x0000000000000000000000000000000000000000000011110000000000000000
    * 0x0000000000000000000000000000000000000000000000001111111100000000
    * 0x0000000000000000000000000000000000000000000000000000000011111111
    * 
    * Max gas for 2 bytes is 16^4-1=65535 gwei
    */

  }

  /**
    * @notice
    * Paid jobs:
    * Motive: Paid jobs are a medium priority protocol operations
    *         These jobs are paid in some medium of token/liquidity/currency to
    *         perform automation tasks on their own contracts.
    *
    *         The constraint of these paid jobs is that these jobs ONLY supply gas, 
    *         not calldata. This is enforced by only accepting the first four bytes 
    *         of calldata at location 0x64 (first four bytes of data_).
    *
    * Execution: Jobs need an execution limit and need to be rewritten in yul
    *            (built-in automatation can be better regulated by internal standards)
    *
    * 0x1234567890123456789012345678901234567890123456789012345678901234
    * 0xAddress                                 Gas             Selector
    * Because addresses are stored big endian and numbers are stored little endian,
    * we can more efficently combine the parts into a single 256 number.
    * 
    * In this instance counting in big endian (left to right):
    * @param contract_  0x00 ~ 0x13: Address target for the paid job
    * @param gas_       0x13 ~ 0x1B: Gas limit for the operation
    * @param data_      0x1C ~ 0x1F: Function selector to be executed
    */
  
  //possible update
  //function createPaidJob(address contract_, bytes8 gas_, bytes8 data_) external payable {
  function createPaidJob(address contract_, uint256 gas_, bytes4 data_) external payable {
    assembly {
      if gt(gas_, sload(0x06)) { revert(0,0) } // needs a proper error msg
      let success := call(
          gas_,
          contract_,
          0,
          data_,
          0x04,
          0x20,
          0x20
      )
      switch success
        case 0 {
          // bytes4(keccak256("Failed to run automation"))
          mstore(0, 0x0800e4b1635f) // This is likely bad code or insufficent gas for contract_
          revert(0, 0x40)
        }
        default {
          let job_ := and(contract_, and(shl(gas_, 0x04), data_))
          let jobs_ := 0xe33c290272880447f00f1a5b33f9e077b5cb5c8c71b08c563e83761acb70e8d1
          let size_ := sload(jobs_)
          sstore(jobs_, add(size_, 1))
          sstore(add(jobs_, mul(size_, 0x20)), job_)
          log1(0, 0, 0) // need to log added job
        }

      if iszero(eq(caller(), sload(0x02))) { revert(0,0) } // needs a proper error msg
    }
  }

  // Needs work, store large executable data is unpractical but could done via emit
  function createPaidJob_unlimited(address contract_, uint256 gas_, bytes calldata) external payable {
    assembly {
      if gt(gas_, sload(0x06)) { revert(0,0) } // needs a proper error msg
      let ptr := mload(0x40)
      let call_size := sub(calldatasize(), 0x34)
      calldatacopy(ptr, 0x34, call_size)
      let success := call(
          gas_,
          contract_,
          0,
          ptr,
          call_size,
          0x20,
          0x20
      )
      switch success
        case 0 {
          mstore(0, 0x0800e4b1635f) // This is likely bad code or insufficent gas for contract_
          revert(0, 0x40)
        }
        default {
          log1(0, 0, 0) // need to log added job
                        // This will likely be a 'logi' event
        }

      if iszero(eq(caller(), sload(0x02))) { revert(0,0) } // needs a proper error msg
    }
  }

  /**
    * @notice
    * System jobs:
    * Motive: System jobs are a high priority protocol operations
    *         These jobs can live on a timer, like scheduled updates, without 
    *         reliance on external systems.
    *         Additionally, concesus mechanisms can be delegated through these jobs
    *
    * Execution: Jobs need an execution limit and need to be rewritten in yul
    *            (built-in automatation can be better regulated by internal standards)
    */
  function systemJob() external {
    assembly {
      if iszero(eq(caller(), sload(0x00))) { revert(0,0) } // needs a proper error msg
      calldatacopy(0x40, 0x04, 0x20) // only variable is gas 
                                     // this command to get gas variable must be double checked

      // how to use gas, need to extract gas limit from calldata
      //let i_old := sload(i.slot) // examaple arbitrary execution entry point
      let i_old
      let gasLeft := gas()
      let gasUsed // save extra gas to set i
      let newGasLeft
      let gas_ := mload(0x40)
      
      for {} lt(gasUsed, gas_) {} {
          i_old := add(i_old, 1) // example of actual execution
          newGasLeft := gas()
          if gt(gasLeft, newGasLeft) { gasUsed := sub(add(gasUsed, gasLeft), newGasLeft) }
          gasLeft := newGasLeft
      }
      //sstore(i.slot, i_old)
    }
  }
}