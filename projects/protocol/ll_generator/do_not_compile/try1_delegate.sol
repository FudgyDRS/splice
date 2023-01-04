//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract try1_delegate {
    uint256 public name;
    address public package;
    address proxy = 0x9D7f74d0C41E726EC95884E0e97Fa6129e3b5E99;
    
    function setName1(uint256 input) external payable { name = input; }
    //function setName(uint256 input) external payable {
    //    proxy.delegatecall(abi.encodeWithSelector(0x950319ac, input));
    //    //proxy.delegatecall{gas: 6000}(abi.encodeWithSelector(msg.sig, input));
    //    //proxy.delegatecall(msg.data);
    //    //delegatecall(g, a, in, insize, out, outsize)
    //    //assembly {
    //    //    mstore(0x40, 0)
    //    //    mstore(0x40, 0x950319ac)
    //    //    mstore(0x44, input)
    //    //    let success := delegatecall(
    //    //        gas(), //6000 for default
    //    //        sload(proxy.slot),
    //    //        mload(0x40),
    //    //        0x24,
    //    //        0,
    //    //        0
    //    //    )
    //    //}
    //}
    function setName(uint256 input) external payable {
        assembly {
            //thing := calldatasize()
            calldatacopy(0x40, 0, 0x24)
            pop(delegatecall(
                gas(),
                sload(proxy.slot),
                0x40,
                0x24,
                0,
                0
            ))
        }
    }
    //function setName() external payable {
    //    assembly {
    //        calldatacopy(0x40, 0, calldatasize())
    //        pop(delegatecall(
    //            gas(),
    //            sload(proxy.slot),
    //            0x40,
    //            calldatasize(),
    //            0,
    //            0
    //        ))
    //    }
    //}

    function setName() external payable {
        assembly {
            calldatacopy(0x40, 0, calldatasize())
            pop(delegatecall(
                gas(),
                sload(proxy.slot),
                0x40,
                calldatasize(),
                0,
                0
            ))
        }
    }
    function setName3(uint256 input) external payable {
        (bool success, bytes memory result) = proxy.staticcall(abi.encodeWithSelector(0x6b8ff574, input));
        name = abi.decode(result, (uint256));
    }
    function setName5(uint256 input) external payable {
        assembly {
            sstore(0, input)
        }
    }
    //function setName3() external {
    //    (bool success, bytes32 result) = EXAMPLE.staticcall(abi.encodeWithSelector(SIGNATURE));
    //        require(success);
    //        assembly {
    //            a := mload(add(result, 32))
    //            b := mload(add(result, 64))
    //        }
    //}

    receive() external payable {}
    fallback() external {}
}
/*
//actually correct
bytes memory payload = abi.encodeWithSelector(0x950319ac, 23546345623543262356565346);
assembly {
    let data2 := delegatecall(
        gas(), //6000 for default
        sload(proxy.slot),
        add(payload, 0x20),
        mload(payload),
        0,
        0
    )
}

//call with input calldata
assembly {
    assembly {
        calldatacopy(0x40, 0, calldatasize())
        pop(delegatecall(
            gas(),
            sload(proxy.slot),
            0x40,
            calldatasize(),
            0,
            0
        ))
    }
}

//call with raw calldata
fallback() external {}
assembly {
    calldatacopy(0x40, 0, calldatasize())
    pop(delegatecall(
        gas(),
        sload(proxy.slot),
        0x40,
        calldatasize(),
        0,
        0
    ))
}

sstore
gas	30862 gas
transaction cost	26836 gas 
execution cost	26836 gas 

normal
gas	30604 gas
transaction cost	26612 gas 
execution cost	26612 gas 


gas	37576 gas
transaction cost	32674 gas 
execution cost	32674 gas
gas	37548 gas
transaction cost	32650 gas 
execution cost	32650 gas
gas	37534 gas
transaction cost	32638 gas 
execution cost	32638 gas 
gas	37516 gas
transaction cost	32622 gas 
execution cost	32622 gas 
gas	37493 gas
transaction cost	32602 gas 
execution cost	32602 gas 
gas	30485 gas
transaction cost	26508 gas 
execution cost	26508 gas 


control
gas	50140 gas
transaction cost	43600 gas 
execution cost	43600 gas 

non assembly abi.encodewithslector delegatecall
gas	56428 gas
transaction cost	49067 gas 
execution cost	49067 gas 

non assembly delegatecall
gas	56057 gas
transaction cost	48745 gas 
execution cost	48745 gas 

pure assembly delegatecall
gas	55882 gas
transaction cost	48593 gas 
execution cost	48593 gas 





default set
gas	3504460 gas
transaction cost	3047356 gas 
execution cost	3047356 gas 

gas	38178 gas
transaction cost	33198 gas 
execution cost	33198 gas 
gas	38151 gas
transaction cost	33174 gas 
execution cost	33174 gas 

gas	57843 gas
transaction cost	50298 gas 
execution cost	50298 gas 
*/