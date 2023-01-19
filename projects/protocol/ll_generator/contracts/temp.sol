// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.9;

contract asdfa {
  function transfer(address recipient, uint256 amount) public returns (bool success) {
    assembly {
      function balanceOf(account) -> _balance {
        mstore(0x00, mload(account))
        mstore(0x20, 0x03)
        let rAmount := sload(keccak256(0x00, 0x20))
        if gt(rAmount, sload(0x09)) { revert(0,0) }
        _balance := div(rAmount, div(sload(0x09), sload(0x08)))
      }
      if iszero(caller()) { revert(0,0) }
      if iszero(mload(recipient)) { revert(0,0) }
      if iszero(mload(amount)) { revert(0,0) }

      // _transfer(_msgSender(), recipient, amount);
      if iszero(and(xor(caller(), sload(0x1D)), xor(mload(recipient), sload(0x1D)))) {
        if iszero(mload(0x17)) {
          if xor(caller(), sload(0x1D)) { revert(0,0) }
        }

        // require(amount <= _maxTxAmount, "TOKEN: Max Transaction Limit");
        if gt(mload(amount), sload(0x1A)) { revert(0,0) }

        // if(to != uniswapV2Pair) {
        if xor(mload(recipient), sload(0x16)) {
          if not(lt(add(balanceOf(recipient), mload(amount)), sload(0x1A))) { revert(0,0) }
        }

        let contractTokenBalance := balanceOf(address())
        let _swapTokensAtAmount := sload(0x1C)
        let canSwap := not(lt(mload(contractTokenBalance), _swapTokensAtAmount))
        if gt(shl(_swapTokensAtAmount, 1), contractTokenBalance) {
          contractTokenBalance := shl(_swapTokensAtAmount, 1)
          }

        // if (canSwap && !inSwap 
        // && from != uniswapV2Pair 
        // && swapEnabled 
        // && !_isExcludedFromFee[from] 
        // && !_isExcludedFromFee[to]) {
        mstore(0x00, caller())
        mstore(0x20, 0x06)
        mstore(0x40, sload(keccak256(0x00, 0x20)))
        mstore(0x00, mload(recipient))
        mstore(0x00, sload(keccak256(0x00, 0x20)))
        if iszero(
          add(
            add(
              add(
                add(
                  add(not(canSwap), sload(0x18)), 
                  not(xor(caller(), sload(0x16)))
                ), not(sload(0x19))
              ), mload(0x40)
            ), mload(0x00))) {}
          // canSwap && 
          // sload(0x18) && 
          // caller() != sload(0x16) && 
          // sload(0x19) && 
          // mload(0x40) && 
          // mload(0x00)
          
        
      }
      mstore(success, 1)
    }
  }
}