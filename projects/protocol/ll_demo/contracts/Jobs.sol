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
  *   0x04    system job dynamic
  *   0x05    paid job dynamic
  *   0x06    free job dynamic
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

  /**
    * System jobs:
    * Motive: System jobs are a high priority protocol operation
    *         These jobs can live on a timer like scheduled updates without 
    *         reliance on external systems.
    *         Additionally, concesus mechanisms can be delgated through these jobs
    *
    * Execution: Jobs need an execution limit and need to be rewritten in yul
    *            (built-in automatation can be better regulated to internal standards)
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