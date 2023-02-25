// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract FactoryProxy {
    // 0x00     owner
    // 0xa4dbc2ea4e0c916dab703fd999a50f7a4a9c768025afa47088dada2561eb7afe keccak256("GAS")
    // 0x8ae85d849167ff996c04040c44924fd364217285e4cad818292c7ac37c0a345b keccak256("ERC20")
    // 0x7de123e9171e34bc63bbe13af473fa2f468c8ca4d92d344acf9e2f11c7cac896 keccak256("ERC20_Reflection")
    // 0x73ad2146b3d3a286642c794379d750360a2d53a3459a11b3e5d6cc900f55f44a keccak256("ERC721")
    // 0xf4a95f267dda2e03ea0cce7a870aa6b12d18ae61bdc8094d432384d7fb523ef3 keccak256("ERC721A")
    // 0x1111000000000000000000000000000000000000000000000000000000000000
    
    // 0x0000   current version
    // 0x0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF nonce
    /// @notice Return address of current contract
    /// @dev Revert the stored data to retrieve the contract address of the current version
    /// @param hash_ value of where the addresses of where this type of contract is stored
    function CurrentContract(uint256 hash_) external view {
        assembly {
            let version := and(sload(hash_), 0xFFFF000000000000000000000000000000000000000000000000000000000000)
            if iszero(version) { revert(add(hash_, 0x04), 0x14) }
            revert(add(hash_, mul(version, 0x14)), 0x14)
        }
    }

    /// @notice Return version of current most contract
    /// @dev Revert the stored data to retrieve the current version
    /// @param hash_ value of where the addresses of where this type of contract is stored
    function CurrentVersion(uint256 hash_) external view {
        assembly {
            revert(sload(hash_), 0x04)
        }
    }

    /// @notice Return nonce of current most nonce
    /// @dev Revert the stored data to retrieve the current nonce
    /// @param hash_ value of where the addresses of where this type of contract is stored
    function CurrentNonce(uint256 hash_) external view {
        assembly {
            revert(and(sload(hash_), 0x0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF), 0x20)
        }
    }

    /// @notice Return the operator set gas price
    /// @dev Revert the stored data to retrieve the gas to be used for external processing
    function Gas() external view {
        assembly {
            revert(sload(0xa4dbc2ea4e0c916dab703fd999a50f7a4a9c768025afa47088dada2561eb7afe), 0x20)
        }
    }
    // 0x1111000000000000000000000000000000000000000000000000000000000000
    
    //  1 0x1111222222222222222222222222222222222222222200000000000000000000
    //  2 0x1111000000000000000000000000000000000000000022222222222222222222
    //  2 0x2222222222222222222200000000000000000000000000000000000000000000
    //  3 0x0000000000000000000022222222222222222222222222222222222222220000
    //  4 0x0000000000000000000000000000000000000000000000000000000000002222
    //  4 0x2222222222222222222222222222222222220000000000000000000000000000
    //  5 0x0000000000000000000000000000000000002222222222222222222222222222
    //  5 0x2222222222220000000000000000000000000000000000000000000000000000
    //  6 0x0000000000002222222222222222222222222222222222222222000000000000
    //  7 0x0000000000000000000000000000000000000000000000000000222222222222
    //  8 0x2222222222222222222222222222000000000000000000000000000000000000
    //  9 0x0000000000000000000000000000222222222222222222222222222222222222
    //  9 0x2222000000000000000000000000000000000000000000000000000000000000

    /// @notice Admin updates the version (this will later shift to concensus)
    /// @dev Increment the current version and add the address of the current most version
    ///      to the packed version data.
    ///      This allows developers to view, test, or use specific versions.
    /// @param hash_ value of where the addresses of where this type of contract is stored
    /// @param new_ address of newest version being appended
    function UpdateVersion(uint256 hash_, address new_) external payable {
        assembly {
            // needs to check for admin role keccak256("ADMIN_ROLE")
            sstore(hash_, add(sload(hash_), 0x0001000000000000000000000000000000000000000000000000000000000000))
            let version := and(sload(hash_), 0xFFFF000000000000000000000000000000000000000000000000000000000000)
            sstore(add(add(hash_, 0x04), mul(version, 0x14)), new_)
        }
    }

    // needs exitcodecopy
    // then verify the length
    // needs someway to determine if this the function is enabled
    function deployContract(uint256 hash_) external payable {
        let addr := create2(
                callvalue(), // wei sent with current call
                // Actual code starts after skipping the first 32 bytes
                add(bytecode, 0x20),
                mload(bytecode), // Load the size of code contained in the first 32 bytes
                _salt // Salt from function arguments
            )
        // initalize
    }
}