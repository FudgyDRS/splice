General assesment of optimizations for contracts

Avoid setting values to zero for balances or assignment of variables
```
function somethinga(int x) public {
    assembly {
        sstore(0x333, 555)
        sstore(0x333, 0)
    }
}
function somethingb(int x) public {
    assembly {
        sstore(0x333, 0)
    }
}
zero:
gas	27390 gas
transaction cost	23817 gas 
execution cost	2613 gas 
gas	27166 gas
transaction cost	23622 gas 
execution cost	2418 gas 

set:
gas	50299 gas
transaction cost	43738 gas 
execution cost	22534 gas 
gas	50075 gas
transaction cost	43543 gas 
execution cost	22339 gas 

zero out:
gas	36130 gas
transaction cost	21817 gas 
execution cost	5413 gas 
gas	35906 gas
transaction cost	21622 gas 
execution cost	5218 gas 

second set:
gas	50299 gas
transaction cost	43738 gas 
execution cost	22534 gas 
gas	50075 gas
transaction cost	43543 gas 
execution cost	22339 gas 
```

Use revert messages whenever possible where data <= 256 bits
```
function somethinga() external {
        assembly {
            mstore(0, sload(owner.slot))
            revert(0, 32)
        }
    }
    function somethingb(address a) public view returns(address data) {
        assembly {
            // mstore(0, 0xB0BC2C0800000000000000000000000000000000000000000000000000000000) // bytes4(keccak256(somethinga()))
            mstore(0, 0x8da5cb5b00000000000000000000000000000000000000000000000000000000) // bytes4(keccak256(owner()))
            //data := 0x20
            pop(staticcall(
                gas(), //6000 for default
                a,
                0,
                0x04,
                0,
                0x20
            ))
            data := mload(0)
        }
    } // 	return address: 5539 gas (Cost only applies when called by a contract)
      // 	return uint256: 5507 gas (Cost only applies when called by a contract)
      //        predeclare 0x0: 5502 gas (Cost only applies when called by a contract)
      //    revert bytes32: 5359 gas (Cost only applies when called by a contract)
      //    builtin public: 5512 gas (Cost only applies when called by a contract)
```


call to the get the current logic contract
delegatecall logic contract

