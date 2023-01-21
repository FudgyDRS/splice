// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.9;

contract asdfa {
  function transfer(address recipient, uint256 amount) public returns (bool success) {
    assembly {
      let excludedFromFeeFrom
      let excludedFromFeeTo
      let toNotUniswapV2Pair
      let fromNotUniswapV2Pair
      let uniswapV2Router
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
        toNotUniswapV2Pair := xor(mload(recipient), sload(0x16))
        if toNotUniswapV2Pair {
          if not(lt(add(balanceOf(recipient), mload(amount)), sload(0x1A))) { revert(0,0) }
        }

        let contractTokenBalance := balanceOf(address())
        let _swapTokensAtAmount := sload(0x1C)
        let canSwap := not(lt(contractTokenBalance, _swapTokensAtAmount))
        if gt(shl(_swapTokensAtAmount, 1), contractTokenBalance) {
          contractTokenBalance := shl(_swapTokensAtAmount, 1)
          }

        // if (canSwap && !inSwap 
        // && from != uniswapV2Pair 
        // && swapEnabled 
        // && !_isExcludedFromFee[from] 
        // && !_isExcludedFromFee[to]) {
        fromNotUniswapV2Pair := xor(caller(), sload(0x16))
        mstore(0x00, caller())
        mstore(0x20, 0x06)
        excludedFromFeeFrom := sload(keccak256(0x00, 0x20))
        mstore(0x00, mload(recipient))
        excludedFromFeeTo := sload(keccak256(0x00, 0x20))
        uniswapV2Router := sload(0x15)
        if iszero(
          add(
            add(
              add(
                add(
                  add(not(canSwap), sload(0x18)), 
                  fromNotUniswapV2Pair
                ), not(sload(0x19))
              ), excludedFromFeeFrom
            ), excludedFromFeeTo)) {
              // swapTokensForEth(contractTokenBalance);
          mstore(0x00, 0xAD5C4648)
          pop(staticcall(
            gas(),
            uniswapV2Router,
            0,
            0x04,
            0x64,
            0x20
          ))

          // in theroy maybe but mstore does not work on 0x40
          // swapTokensForEth(contractTokenBalance);
          mstore(0x40, 0x791AC947)
          mstore(0x44, contractTokenBalance)
          mstore(0x64, 0)
          mstore(0x84, address())
          mstore(0xA4, mload(0x00))
          mstore(0xC4, address())
          mstore(0xE4, timestamp())
          pop(call(
            gas(),
            sload(0x15),
            0,
            0x40,
            0xC4,
            0x40,
            0x20
          ))

          // needs success require revert: return data of call stored in m0x40

          // sendETHToFee(contractETHBalance);
          if gt(selfbalance(), 0x16345785D8A0000) {
            pop(call(
              sload(0x14),
              gas(),
              selfbalance(),
              0,
              0,
              0,
              0
            ))
          }
        }
      }

      // _tokenTransfer(from, to, amount, takeFee);
      // if ((_isExcludedFromFee[from] || _isExcludedFromFee[to]) || (from != uniswapV2Pair && to != uniswapV2Pair)) {
      let takeFee := true
      switch or(
        or(excludedFromFeeFrom, excludedFromFeeTo), 
        add(toNotUniswapV2Pair, fromNotUniswapV2Pair)
      )
      case 1 {
        takeFee := false
      }
      default {
        if add(iszero(toNotUniswapV2Pair), iszero(iszero(xor(mload(recipient), uniswapV2Router)))) {
          sstore(0x0F, sload(0x0B))
          sstore(0x10, sload(0x0C))
        }

        if add(iszero(fromNotUniswapV2Pair), iszero(iszero(xor(caller(), uniswapV2Router)))) {
          sstore(0x0F, sload(0x0D))
          sstore(0x10, sload(0x0E))
        }
      }
      if iszero(mload(takeFee)) {
        if iszero(and(sload(0x11), sload(0x12))) { return(0, 0) }
        sstore(0x11, sload(0x0F))
        sstore(0x12, sload(0x10))
        sstore(0x0F, 0)
        sstore(0x10, 0)
      }

      // _transferStandard(sender, recipient, amount);
      let tFee            := div(mul(mload(amount), sload(0x0F)), 100)
      let tTeam           := div(mul(mload(amount), sload(0x10)), 100)
      let tTransferAmount := sub(amount, add(tFee, tTeam))
      let currentRate     := div(sload(0x09), sload(0x08))
      let rAmount := mul(mload(amount), mload(currentRate))
      let rFee := mul(mload(tFee), mload(currentRate))
      let rTransferAmount := sub(
        rAmount, 
        add(
          mload(rFee), 
          mul(mload(tTeam), mload(currentRate)))
      )

      // _rOwned[sender] = _rOwned[sender].sub(rAmount);
      mstore(0x00, mload(caller()))
      mstore(0x20, 0x03)
      let _rOwned := keccak256(0x00, 0x20)
      sstore(_rOwned, sub(sload(_rOwned), mload(rAmount)))

      // _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);
      mstore(0x00, mload(recipient))
      _rOwned := keccak256(0x00, 0x20)
      sstore(_rOwned, add(sload(_rOwned), mload(rTransferAmount)))

      // _takeTeam(tTeam);
      let rTeam := mul(mload(tTeam), div(sload(0x09), sload(0x08)))
      mstore(0x00, address())
      mstore(0x20, 0x03)
      _rOwned := keccak256(0x00, 0x20)
      sstore(_rOwned, add(sload(_rOwned), mload(rTeam)))

      // _reflectFee(rFee, tFee);
      sstore(0x09, sub(sload(0x09), mload(rFee)))
      sstore(0x0A, add(sload(0x0A), mload(tFee)))

      // if (!takeFee) restoreAllFee();
      if iszero(mload(takeFee)) {
        sstore(0x0F, sload(0x11))
        sstore(0x10, sload(0x12))
      }
      mstore(success, 1)
    }
  }
}