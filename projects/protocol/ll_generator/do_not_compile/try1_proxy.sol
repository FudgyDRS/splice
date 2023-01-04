//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract try1_proxy {
    uint256 public name;
    // SIGNATURE = 0x950319ac
    //function setName(uint256 name_) external payable { name = name_; }
    function setName(uint256 name_) external payable { assembly { sstore(0, name_) } }

    // SIGNATURE = 0x2bf0f81c
    //function setName() external payable { 
    //    assembly { 
    //        switch eq(calldatasize(), 0)
    //        case 1 {
    //            calldatacopy(0x40, 0, calldatasize())
    //            sstore(0, 0x40)
    //        }
    //        default {
    //            revert(0,0)
    //        }
    //    }
    //}
    
    //function setName() external payable { 
    //    assembly { 
    //        calldatacopy(0x40, 0, calldatasize())
    //        sstore(0, 0x40)
    //    }
    //}

    function setName() external payable returns(bytes memory) { 
        return msg.data;
    }
//2bf0f81c0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000954657374204e616d650000000000000000000000000000000000000000000000
//
//0000000000000000000000000000000000000000000000000000000000000020
//0000000000000000000000000000000000000000000000000000000000000009
//54657374204e616d650000000000000000000000000000000000000000000000
//1234567890123456789012345678901234567890123456789012345678901234
    // SIGNATURE = 0x6b8ff574
    function getName(uint256 name_) external pure returns(uint256) { return name_; }

    function setName_() public pure returns(bytes4 data) {
        data = bytes4(keccak256("setName(uint256)"));
        //assembly { data := 0x950319ac5e9b02c46a95195f26ed6042613cef291d44d1e7b696585e81c2cde0 }
    }

    function setName_2() public pure returns(bytes4 data) {
        data = bytes4(keccak256("setName()"));
        //assembly { data := 0x950319ac5e9b02c46a95195f26ed6042613cef291d44d1e7b696585e81c2cde0 }
    }

    function getName_() public pure returns(bytes4 data) { data = bytes4(keccak256("getName(uint256)")); }

    function uint2str(uint _i) internal pure returns (string memory _uintAsString) {
        //if (_i == 0) {
        //    return "0";
        //}
        //uint j = _i;
        //uint len;
        //while (j != 0) {
        //    len++;
        //    j /= 10;
        //}
        //bytes memory bstr = new bytes(len);
        //uint k = len;
        //while (_i != 0) {
        //    k = k-1;
        //    uint8 temp = (48 + uint8(_i - _i / 10 * 10));
        //    bytes1 b1 = bytes1(temp);
        //    bstr[k] = b1;
        //    _i /= 10;
        //}
        //return string(bstr);
        assembly {
            if iszero(_i) { }
            //
            let j := _i
            let len
            for {} gt(j, 0) {} {
                len := add(len, 1)
                j := div(j, 10)
            }
            let k := len
            for {} gt(_i, 0) {} {
                let temp := add(48, sub(_i, mul(div(_i, 10), 10)))
            }
        }
        function toString(uint256 value) internal pure returns (string memory) {
        unchecked {
            uint256 length = Math.log10(value) + 1;
            string memory buffer = new string(length);
            uint256 ptr;
            /// @solidity memory-safe-assembly
            assembly {
                ptr := add(buffer, add(32, length))
            }
            while (true) {
                ptr--;
                /// @solidity memory-safe-assembly
                assembly {
                    mstore8(ptr, byte(mod(value, 10), _SYMBOLS))
                }
                value /= 10;
                if (value == 0) break;
            }
            return buffer;
        }
    }
    }

    function a() public view returns(bytes memory) { return abi.encodeWithSelector(0x950319ac, 12345); }
    function b() public view returns(bytes memory) { return abi.encodeWithSelector(0x950319ac, 23546345623543262356565346); }
    function c() public view returns(bytes memory) { return abi.encodeWithSelector(0x2bf0f81c, 23546345623543262356565346); }
    function d() public view returns(bytes memory) { return abi.encodeWithSelector(0x2bf0f81c, "Test Name"); }

    receive() external payable {}
    fallback() external {}
    /*
    0x2bf0f81c0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000954657374204e616d650000000000000000000000000000000000000000000000
    */
}