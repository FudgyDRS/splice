// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract ContractState {
    // 0x00     initalized
    // 0x01     owner
    // 0x02     library
    // 0x03     contract type

    function initalize(uint256 library_, uint256 type_) external {
        assembly {
            if sload(0x00) { revert(0,0) }
            sstore(0x00, 1)
            sstore(0x01, caller())
            sstore(0x02, library_)
            sstore(0x03, type_)
        }
    }
    /// @notice Get contract current most address
    /// @dev Revert the stored data to retrieve the contract address of the current version
    /// @return contract_ is the current most contract address
    function CurrentContract() external virtual view returns(address contract_) {
        assembly {
            // bytes4(keccak256("CurrentContract(uint256)"))
            mstore(0, 0xdee8bc3200000000000000000000000000000000000000000000000000000000)
            mstore(0x04, sload(0x03))
            pop(staticcall(
                gas(), //6000 for default
                sload(0x02),
                0,
                0x24,
                0,
                0x20
            ))
            contract_ := mload(0)
        }
    }

    /// @notice Get contract version
    /// @dev Revert the stored data to retrieve the current version
    /// @return version_ is the current most contract version
    function CurrentVersion() external virtual view returns(uint256 version_) {
        assembly {
            // bytes4(keccak256("CurrentVersion(uint256)"))
            mstore(0, 0xb9e4c63700000000000000000000000000000000000000000000000000000000)
            mstore(0x04, sload(0x03))
            pop(staticcall(
                gas(), //6000 for default
                sload(0x02),
                0,
                0x24,
                0,
                0x20
            ))
            version_ := mload(0)
        }
    }

    /// @notice Return the operator set gas price
    /// @dev Revert the stored data to retrieve the gas to be used for external processing
    /// @return gas_ is the gas to be used for external processing
    function Gas() external virtual view returns(uint256 gas_) {
        assembly {
            // bytes4(keccak256("Gas()"))
            mstore(0, 0x04a55cbf00000000000000000000000000000000000000000000000000000000)
            mstore(0x04, sload(0x03))
            pop(staticcall(
                gas(), //6000 for default
                sload(0x02),
                0,
                0x04,
                0,
                0x20
            ))
            gas_ := mload(0)
        }
    }
}