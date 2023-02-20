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

  function processPaidJobs() external payable {}

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
    * System jobs:
    * Motive: System jobs are a high priority protocol operation
    *         These jobs can live on a timer like scheduled updates without 
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