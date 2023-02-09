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
