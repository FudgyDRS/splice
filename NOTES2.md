How to perform am inline assembly mapping:

```
assembly {
  // storing memory to mapping
  mstore(0x00, caller())
  mstore(0x20, 0)
  sstore(keccak256(0x00, 0x40), 234545454)
  
  // storing memory to double mapping
  mstore(0x00, caller())
  mstore(0x20, 0x2)
  mstore(0x20, keccak256(0x00, 0x40))
  mstore(0x00, 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2)
  sstore(keccak256(0x00, 0x40), 123454321)
}
```