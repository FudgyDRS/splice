// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract ContractState {
    // 0x00     initalized
    // 0x01     owner
    // 0x01     library
    // 0x02     contract type

    function initalize(uint256 library_, uint256 type_) external {
        assembly {
            if sload(0x00) { revert(0,0) }
            sstore(0x00, 1)
            sstore(0x01, caller())
            sstore(0x02, library_)
            sstore(0x03, type_)
        }
    }
    /// @notice Get contract version
    /// @dev Revert the stored data to retrieve the contract address of the current version
    /// @param Documents a parameter just like in doxygen (must be followed by parameter name)
}