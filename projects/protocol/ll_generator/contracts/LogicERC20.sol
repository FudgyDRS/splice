/**
 *Submitted for verification at Etherscan.io on 2023-01-12
*/

/**
Singularity (SGL)

t.me/singularityERC

twitter.com/singularity_erc

https://medium.com/@singularity_ERC

*/
// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.9;

abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }
}
/*
function owner() public view returns (address) {
        return _owner;
    }

function renounceOwnership() public virtual onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }

function name() public pure returns (string memory) {
        return _name;
    }

    function symbol() public pure returns (string memory) {
        return _symbol;
    }

    function decimals() public pure returns (uint8) {
        return _decimals;
    }

    function totalSupply() public pure override returns (uint256) {
        return _tTotal;
    }

    function balanceOf(address account) public view override returns (uint256) {
        return tokenFromReflection(_rOwned[account]);
    }

    function transfer(address recipient, uint256 amount)
        public
        override
        returns (bool)
    {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    function allowance(address owner, address spender)
        public
        view
        override
        returns (uint256)
    {
        return _allowances[owner][spender];
    }

    function approve(address spender, uint256 amount)
        public
        override
        returns (bool)
    {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) public override returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(
            sender,
            _msgSender(),
            _allowances[sender][_msgSender()].sub(
                amount,
                "ERC20: transfer amount exceeds allowance"
            )
        );
        return true;
    }

  function manualsend() external {
        sendETHToFee(address(this).balance);
    }

    function toggleSwap (bool _swapEnabled) external {
        swapEnabled = _swapEnabled;
    }

    //Set maximum transaction
    function setMaxTransactionAmount(uint256 maxTxAmount) public onlyOwner {
        _maxTxAmount = _tTotal*maxTxAmount/100;
        require (_maxTxAmount >= _tTotal/100);
    }

    function setMaxWalletLimit(uint256 maxWalletSize) public onlyOwner {
        _maxWalletSize = _tTotal*maxWalletSize/100;
         require (_maxWalletSize >= _tTotal/100);
    }
*/

contract Ownable is Context {
    address private _owner;
    address private _previousOwner;
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );

    constructor() {
        address msgSender = _msgSender();
        _owner = msgSender;
        emit OwnershipTransferred(address(0), msgSender);
    }

    function owner() public view returns (address) {
        return _owner;
    }

    modifier onlyOwner() {
        require(_owner == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    function renounceOwnership() public virtual onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }

}


// bytes4(keccak256("createPair(address,address)")): 0xc9c65396
// bytes4(keccak256("swapExactTokensForETHSupportingFeeOnTransferTokens(uint256,uint256,address[],address,uint256)")): 0x791ac947
// bytes4(keccak256("factory()")): 0xc45a0155
// bytes4(keccak256("WETH()")): 0xad5c4648
// bytes4(keccak256("addLiquidityETH(address,uint256,uint256,uint256,address,uint256 deadline)")): 0x3c300e4d
// 

contract Singularity is Context, Ownable {

  // string private constant _name = "Singularity";                                                       // slot   0x00
  // string private constant _symbol = "SGL";                                                             // slot   0x01
  // uint8 private constant _decimals = 9;                                                                // slot   0x02

  // mapping(address => uint256) private _rOwned;                                                         // slot   0x03
  // mapping(address => uint256) private _tOwned;                                                         // slot   0x04
  // mapping(address => mapping(address => uint256)) private _allowances;                                 // slot   0x05
  // mapping(address => bool) private _isExcludedFromFee;                                                 // slot   0x06
  // uint256 private constant MAX = ~uint256(0);                                                          // slot   0x07
  // uint256 private constant _tTotal = 1000000000 * 10**9;                                               // slot   0x08
  // uint256 private _rTotal = (MAX - (MAX % _tTotal));                                                   // slot   0x09
  // uint256 private _tFeeTotal;                                                                          // slot   0x0A
  // uint256 private _redisFeeOnBuy = 0;                                                                  // slot   0x0B
  // uint256 private _taxFeeOnBuy = 10;                                                                   // slot   0x0C
  // uint256 private _redisFeeOnSell = 0;                                                                 // slot   0x0D
  // uint256 private _taxFeeOnSell = 40;                                                                  // slot   0x0E

  //Original Fee
  // uint256 private _redisFee = _redisFeeOnSell;                                                         // slot   0x0F
  // uint256 private _taxFee = _taxFeeOnSell;                                                             // slot   0x10

  // uint256 private _previousredisFee = _redisFee;                                                       // slot   0x11
  // uint256 private _previoustaxFee = _taxFee;                                                           // slot   0x12

  // address payable private _developmentAddress = payable(0xcE5b611530313ec3c8a6dF585D0206C8721bbaa9);   // slot   0x13
  // address payable private _marketingAddress = payable(0xcE5b611530313ec3c8a6dF585D0206C8721bbaa9);     // slot   0x14

  // IUniswapV2Router02 public uniswapV2Router;                                                           // slot   0x15
  // address public uniswapV2Pair;                                                                        // slot   0x16

  // bool private tradingOpen = true;                                                                     // slot   0x17
  // bool private inSwap = false;                                                                         // slot   0x18
  // bool private swapEnabled = true;                                                                     // slot   0x19

  // uint256 public _maxTxAmount = _tTotal;                                                               // slot   0x1A
  // uint256 public _maxWalletSize = _tTotal*2/100;                                                       // slot   0x1B
  // uint256 public _swapTokensAtAmount = _tTotal*4/1000;                                                 // slot   0x1C

  // address private _owner;                                                                              // slot   0x1D
  // address private _previousOwner;                                                                      // slot   0x1E

  event MaxTxAmountUpdated(uint256 _maxTxAmount);


// IUniswapV2Factory
// bytes4(keccak256("createPair(address,address)")): 0xc9c65396

// IUniswapV2Router02
// bytes4(keccak256("swapExactTokensForETHSupportingFeeOnTransferTokens(uint256,uint256,address[],address,uint256)")): 0x791ac947
// bytes4(keccak256("factory()")): 0xC45A0155
// bytes4(keccak256("WETH()")): 0xAD5C4648
// bytes4(keccak256("addLiquidityETH(address,uint256,uint256,uint256,address,uint256 deadline)")): 0x3c300e4d
  function intialize() external payable {
    assembly {
      sstore(0x00, 0x53696e67756c6172697479000000000000000000000000000000000000000000) // name
      sstore(0x01, 0x53544c0000000000000000000000000000000000000000000000000000000000) // symbol
      sstore(0x02, 0x0000000000000000000000000000000000000000000000000000000000000009) // decimals

      sstore(0x08, 0x0000000000000000000000000000000000000000000000000DE0B6B3A7640000) // _tTotal
      sstore(0x09, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7E52FE5AFE40000) // _rTotal

      sstore(0x0C, 0x000000000000000000000000000000000000000000000000000000000000000A) // _taxFeeOnBuy
      sstore(0x0E, 0x0000000000000000000000000000000000000000000000000000000000000028) // _taxFeeOnSell

      sstore(0x10, 0x0000000000000000000000000000000000000000000000000000000000000028) // _taxFee

      sstore(0x13, 0xCE5B611530313EC3C8A6DF585D0206C8721BBAA9000000000000000000000000) // _developmentAddress
      sstore(0x14, 0xCE5B611530313EC3C8A6DF585D0206C8721BBAA9000000000000000000000000) // _marketingAddress

      sstore(0x15, 0x7A250D5630B4CF539739DF2C5DACB4C659F2488D000000000000000000000000) // uniswapV2Router

      sstore(0x17, 0x0000000000000000000000000000000000000000000000000000000000000001) // tradingOpen
      sstore(0x18, 0x0000000000000000000000000000000000000000000000000000000000000000) // inSwap
      sstore(0x19, 0x0000000000000000000000000000000000000000000000000000000000000001) // swapEnabled

      sstore(0x1A, 0x0000000000000000000000000000000000000000000000000DE0B6B3A7640000) // _maxTxAmount
      sstore(0x1B, 0x00000000000000000000000000000000000000000000000000470DE4DF820000) // _maxWalletSize
      sstore(0x1C, 0x000000000000000000000000000000000000000000000000000E35FA931A0000) // _swapTokensAtAmount

      sstore(0x1D, caller())                                                           // _owner

      // _rOwned[_msgSender()] = _rTotal;
      mstore(0x00, caller())
      mstore(0x20, 0x3)
      sstore(keccak256(0x00, 0x20), sload(0x09))

      // _uniswapV2Router.factory()
      mstore(0x00, 0xC45A0155)
      pop(staticcall(
          gas(),
          sload(0x15),
          0,
          0x04,
          0x40,
          0x20
      ))

      // _uniswapV2Router.WETH()
      mstore(0x00, 0xAD5C4648)
      pop(staticcall(
          gas(),
          sload(0x15),
          0,
          0x04,
          0x00,
          0x20
      ))

      // IUniswapV2Factory(_uniswapV2Router.factory()).createPair(address(this), _uniswapV2Router.WETH());
      mstore(0x00, 0xC45A0155)
      mstore(add(0x00,0x04), address())
      mstore(add(0x00,0x18), mload(0x00))
      pop(call(
          gas(),
          mload(0x40),
          0,
          0x2C,
          0,
          0x20
      ))

      sstore(0x16, mload(0x00))

      // _isExcludedFromFee[owner()] = true;
      mstore(0x00, caller())
      mstore(0x20, 0x06)
      sstore(keccak256(0x00, 0x20), 0x0000000000000000000000000000000000000000000000000000000000000001)

      // _isExcludedFromFee[address(this)] = true;
      mstore(0x00, address())
      sstore(keccak256(0x00, 0x20), 0x0000000000000000000000000000000000000000000000000000000000000001)

      // _isExcludedFromFee[_marketingAddress] = true;
      mstore(0x00, sload(0x14))
      sstore(keccak256(0x00, 0x20), 0x0000000000000000000000000000000000000000000000000000000000000001)
    }

    emit Transfer(address(0), _msgSender(), _tTotal);
  }

  function name() public pure returns (string memory _name) {
    assembly {
      _name := sload(0x00)
    }
  }

  function symbol() public pure returns (string memory _symbol) {
    assembly {
      _symbol := sload(0x01)
    }
  }

  function decimals() public pure returns (uint256 _decimals) {
    assembly {
      _decimals := sload(0x03)
    }
  }

  function totalSupply() public pure returns (uint256 _tTotal) {
    assembly {
      _tTotal := sload(0x08)
    }
  }

  function balanceOf(address account) public pure returns (uint256 _balance) {
    assembly {
      mstore(0x00, mload(account))
      mstore(0x20, 0x03)
      let rAmount := sload(keccak256(0x00, 0x20))
      if gt(rAmount, sload(0x09)) { revert(0,0) }
      _balance := div(rAmount, div(sload(0x09), sload(0x08)))
    }
  }

  function _getRate() private view returns (uint256 rate) {
    assembly {
      rate := div(sload(0x09), sload(0x08))
    }
  }

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

  function allowance(address owner, address spender) public view override returns (uint256 _allowance) {
    assembly {
      mstore(0x00, mload(owner))
      mstore(0x20, 0x5)
      mstore(0x20, keccak256(0x00, 0x40))
      mstore(0x00, mload(spender))
      _allowance := mload(0x00)
    }
  }

  // function _approve(
  //   address owner,
  //   address spender,
  //   uint256 amount
  // ) private {
  //   require(owner != address(0), "ERC20: approve from the zero address");
  //   require(spender != address(0), "ERC20: approve to the zero address");
  //   _allowances[owner][spender] = amount;
  //   emit Approval(owner, spender, amount);
  // }

  function _approve(
    address owner,
    address spender,
    uint256 amount
  ) private {
    assembly {
      if iszero(add(mload(owner), mload(spender))) { revert(0,0) }
      mstore(0x00, mload(owner))
      mstore(0x20, 0x5)
      mstore(0x20, keccak256(0x00, 0x40))
      mstore(0x00, mload(spender))
      sstore(keccak256(0x00, 0x40), mload(amount))
    }
  }

  function approve(address spender, uint256 amount)
    public
    override
    returns (bool)
  {
    _approve(_msgSender(), spender, amount);
    return true;
  }

  function transferFrom(
      address sender,
      address recipient,
      uint256 amount
  ) public override returns (bool) {
    _transfer(sender, recipient, amount);
    _approve(
      sender,
      _msgSender(),
      _allowances[sender][_msgSender()].sub(
        amount,
        "ERC20: transfer amount exceeds allowance"
      )
    );
    return true;
  }

  function manualsend() external {
    // sendETHToFee(address(this).balance);
    assembly {
      call(
        sload(0x14),
        gas(),
        selfbalance(),
        0,
        0,
        0,
        0
      )
    }
  }

  function toggleSwap (bool _swapEnabled) external {
    assembly {
      sstore(0x19, mload(_swapEnabled))
    }
  }

  receive() external payable {}

  function setBuyAndSellFee(uint256 redisFeeOnBuy, uint256 redisFeeOnSell, uint256 taxFeeOnBuy, uint256 taxFeeOnSell) public onlyOwner {
    assembly {
      if gt(add(add(add(mload(redisFeeOnBuy), mload(redisFeeOnSell)), mload(taxFeeOnBuy)), mload(taxFeeOnSell)), 25) { revert(0,0) }
      sstore(0x0B, mload(redisFeeOnBuy))
      sstore(0x0D, mload(redisFeeOnSell))
      sstore(0x0C, mload(taxFeeOnBuy))
      sstore(0x0E, mload(taxFeeOnSell))
    }
  }

  function setMaxTransactionAmount(uint256 maxTxAmount) public onlyOwner {
    assembly {
      if iszero(mload(maxTxAmount)) { revert(0,0) }
      sstore(0x1A, div(mul(mload(0x08), mload(maxTxAmount)), 0x64))
    }
  }

  function setMaxWalletLimit(uint256 maxWalletSize) public onlyOwner {
    assembly {
      if iszero(mload(maxWalletSize)) { revert(0,0) }
      sstore(0x1B, div(mul(mload(0x08), mload(maxWalletSize)), 0x64))
    }
  }

}