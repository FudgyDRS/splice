Thought for another whitelist method:

We can determine the number of hashes required until an arbitrary number is reached, saving that plus a few bits of the original address should provide sufficient entropy.

We can assign the mapping to said whitelists to be true in the instance of whitelists as well, thus we can solve the gas minting issue. Additionally, we can offset the final mapping value when a transfer occurs to set the "true" position as other contracts traditionally use.

EX:
```
// Input: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
// Result: 24 (0x18)
function k() public view returns(uint256) {
    bool t = true;
    uint256 i;
    bytes32 hash = keccak256(abi.encodePacked(msg.sender));
    bytes1 hidden = 0x9A;
    while(t) {
        if(bytes1(hash) == hidden) t = false;
        hash = keccak256(abi.encodePacked(hash));
        i++;
    }
    return i;
}
```

Assumptions:

    Arbitrary value: 0x9A
    Caller: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4

By running this function, we get the value 24 (0x18). We can then composite our value (in this example using the last 3 bytes) 0x18BEDDC4.

Extrapolating further, we can pack a total of 8 values in a memory slot or more compactly store via the offset of values and an iterator.

EX:

    add(keccak256(18), n*3)

Through this method, we can receive our value and minimize the required search power. We search for slot 18 and iterate by offsets of 3 bytes. This compacts further by sacrificing bytes.

    0xAAABBB CCCCCC DDDDDD EEEEEEE FFFFFF GGGGGG HHHHHH IIIIII JJJJJJ LLLLLL MMMMMM

A is the index value for the number of hashes to match, the max value in this instance is 16^3-1 = 4095

B is the size of the array, also in this instance has a max value of 16^3-1 = 4095

C~G are example sizes of 3 byte secondary verifications (nearly 9 packed per memory address)