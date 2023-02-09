In-line assembly automation with (and without runs) is approximately three times more effecient for basic operations.

From the contract below, simply deploy twice to follow along (refered to as A and B):

```
//SPDX-Liscense-Identifier: MIT
pragma solidity ^0.8.17;
import "hardhat/console.sol";

contract gassy {
    uint256 public i;

    function called(uint256 gas) public {
        uint256 gasUsed = 0;
    	uint256 gasLeft = gasleft();
        uint256 i_old = i;
        //uint256 iterations = 0;
        while(gasUsed < gas) {
            i_old++;
            uint256 newGasLeft = gasleft();
    		if(gasLeft > newGasLeft) { gasUsed = gasUsed + gasLeft - newGasLeft;}
    		gasLeft = newGasLeft;
        }
        i = i_old;
    }

    function called2(uint256 gas_) public {
        assembly {
            let i_old := sload(i.slot)
            let iter := mload(0x40)
            let gasLeft := gas()
            let gasUsed // save extra gas to set i
            let newGasLeft
            
            for {} lt(gasUsed, gas_) {} {
                i_old := add(i_old, 1)
                newGasLeft := gas()
                if gt(gasLeft, newGasLeft) { gasUsed := sub(add(gasUsed, gasLeft), newGasLeft) }
                gasLeft := newGasLeft
            }
            sstore(i.slot, i_old)
        }
    }

    function call(address a) public {console.log("gasleft:", gasleft());
        bytes memory payload = abi.encodeWithSignature("called(uint256)",20000);
        (bool success,) = a.call{gas: 100000}(payload);
        console.log("success:", success);
        
        console.log("balance:", address(this).balance);
        //selfdestruct(payable(msg.sender));
    }

    function call2(address a) public {console.log("gasleft:", gasleft());
        bytes memory payload = abi.encodeWithSignature("called2(uint256)",20000);
        (bool success,) = a.call{gas: 100000}(payload);
        console.log("success:", success);
        
        console.log("balance:", address(this).balance);
        //selfdestruct(payable(msg.sender));
    }

    receive() external payable{
        console.log("iter");
    }
    fallback() external {
        console.log("iter");
    }
}
```

The structure of the deployment is such that B calls A and the public function `i()` is called to return the number of iterations.

When calling `call(address)` the result is a processing 31 iterations (59 using runs).

When calling `call2(address)` the result is a processing 180 iterations (180 still using runs).

This means that there is a minimum of at least three times the efficency of utilizing in-line assembly.

When performing an external call there is an imediate loss of 6000 gas but the remain gas can still be of use. By iterating through a list of operations we can potentially save a cursor of what was last processed. If instead of direct manipulation of data, events are triggered, a continuous relay of information can be processed within an automation schema of a protocol. Potentially even decentralized order books of funding (given a network like Canto that can payout gas).
