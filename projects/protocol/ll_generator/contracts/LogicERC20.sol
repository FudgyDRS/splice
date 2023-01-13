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

    function setBuyAndSellFee(uint256 redisFeeOnBuy, uint256 redisFeeOnSell, uint256 taxFeeOnBuy, uint256 taxFeeOnSell) public onlyOwner {
        _redisFeeOnBuy = redisFeeOnBuy;
        _redisFeeOnSell = redisFeeOnSell;
        _taxFeeOnBuy = taxFeeOnBuy;
        _taxFeeOnSell = taxFeeOnSell;
        require (_redisFeeOnBuy+_redisFeeOnSell+_taxFeeOnBuy+_taxFeeOnSell <= 25);
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

library SafeMath {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;
        return c;
    }

    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");
        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        return c;
    }
}

// bytes4(keccak256("createPair(address,address)")): 0xc9c65396
interface IUniswapV2Factory {
    function createPair(address tokenA, address tokenB)
        external
        returns (address pair);
}

// bytes4(keccak256("swapExactTokensForETHSupportingFeeOnTransferTokens(uint256,uint256,address[],address,uint256)")): 0x791ac947
// bytes4(keccak256("factory()")): 0xc45a0155
// bytes4(keccak256("WETH()")): 0xad5c4648
// bytes4(keccak256("addLiquidityETH(address,uint256,uint256,uint256,address,uint256 deadline)")): 0x3c300e4d
// 
interface IUniswapV2Router02 {
    function swapExactTokensForETHSupportingFeeOnTransferTokens(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external;

    function factory() external pure returns (address);

    function WETH() external pure returns (address);

    function addLiquidityETH(
        address token,
        uint256 amountTokenDesired,
        uint256 amountTokenMin,
        uint256 amountETHMin,
        address to,
        uint256 deadline
    )
        external
        payable
        returns (
            uint256 amountToken,
            uint256 amountETH,
            uint256 liquidity
        );
}

contract Singularity is Context, IERC20, Ownable {

    using SafeMath for uint256;

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
    modifier lockTheSwap {
        inSwap = true;
        _;
        inSwap = false;
    }


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

   function tokenFromReflection(uint256 rAmount)
        private
        view
        returns (uint256)
    {
        require(
            rAmount <= _rTotal,
            "Amount must be less than total reflections"
        );
        uint256 currentRate = _getRate();
        return rAmount.div(currentRate);
    }

  function _getRate() private view returns (uint256) {
        uint256 rSupply = _rTotal;
        uint256 tSupply = _tTotal;
        return rSupply.div(tSupply);
    }


    function transfer(address recipient, uint256 amount) public override returns (bool) {
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

   

    function removeAllFee() private {
        if (_redisFee == 0 && _taxFee == 0) return;

        _previousredisFee = _redisFee;
        _previoustaxFee = _taxFee;

        _redisFee = 0;
        _taxFee = 0;
    }

    function restoreAllFee() private {
        _redisFee = _previousredisFee;
        _taxFee = _previoustaxFee;
    }

    function _approve(
        address owner,
        address spender,
        uint256 amount
    ) private {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    function _transfer(
        address from,
        address to,
        uint256 amount
    ) private {
        require(from != address(0), "ERC20: transfer from the zero address");
        require(to != address(0), "ERC20: transfer to the zero address");
        require(amount > 0, "Transfer amount must be greater than zero");

        if (from != owner() && to != owner()) {

            //Trade start check
            if (!tradingOpen) {
                require(from == owner(), "TOKEN: This account cannot send tokens until trading is enabled");
            }

            require(amount <= _maxTxAmount, "TOKEN: Max Transaction Limit");

            if(to != uniswapV2Pair) {
                require(balanceOf(to) + amount < _maxWalletSize, "TOKEN: Balance exceeds wallet size!");
            }

            uint256 contractTokenBalance = balanceOf(address(this));
            bool canSwap = contractTokenBalance >= _swapTokensAtAmount;

            if(contractTokenBalance >= _swapTokensAtAmount*2)
            {
                contractTokenBalance = _swapTokensAtAmount*2;
            }

            if (canSwap && !inSwap && from != uniswapV2Pair && swapEnabled && !_isExcludedFromFee[from] && !_isExcludedFromFee[to]) {
                swapTokensForEth(contractTokenBalance);
                uint256 contractETHBalance = address(this).balance;
                if (contractETHBalance > 100000000000000000) {
                    sendETHToFee(contractETHBalance);
                }
            }
        }

        bool takeFee = true;

        //Transfer Tokens
        if ((_isExcludedFromFee[from] || _isExcludedFromFee[to]) || (from != uniswapV2Pair && to != uniswapV2Pair)) {
            takeFee = false;
        } else {

            //Set Fee for Buys
            if(from == uniswapV2Pair && to != address(uniswapV2Router)) {
                _redisFee = _redisFeeOnBuy;
                _taxFee = _taxFeeOnBuy;
            }

            //Set Fee for Sells
            if (to == uniswapV2Pair && from != address(uniswapV2Router)) {
                _redisFee = _redisFeeOnSell;
                _taxFee = _taxFeeOnSell;
            }

        }

        _tokenTransfer(from, to, amount, takeFee);
    }

    function swapTokensForEth(uint256 tokenAmount) private lockTheSwap {
        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = uniswapV2Router.WETH();
        _approve(address(this), address(uniswapV2Router), tokenAmount);
        uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(
            tokenAmount,
            0,
            path,
            address(this),
            block.timestamp
        );
    }

    function sendETHToFee(uint256 amount) private {
        _marketingAddress.transfer(amount);
    }

    function manualsend() external {
        sendETHToFee(address(this).balance);
    }

    function toggleSwap (bool _swapEnabled) external {
        swapEnabled = _swapEnabled;
    }

    function _tokenTransfer(
        address sender,
        address recipient,
        uint256 amount,
        bool takeFee
    ) private {
        if (!takeFee) removeAllFee();
        _transferStandard(sender, recipient, amount);
        if (!takeFee) restoreAllFee();
    }

    function _transferStandard(
        address sender,
        address recipient,
        uint256 tAmount
    ) private {
        (
            uint256 rAmount,
            uint256 rTransferAmount,
            uint256 rFee,
            uint256 tTransferAmount,
            uint256 tFee,
            uint256 tTeam
        ) = _getValues(tAmount);
        _rOwned[sender] = _rOwned[sender].sub(rAmount);
        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);
        _takeTeam(tTeam);
        _reflectFee(rFee, tFee);
        emit Transfer(sender, recipient, tTransferAmount);
    }

    function _takeTeam(uint256 tTeam) private {
        uint256 currentRate = _getRate();
        uint256 rTeam = tTeam.mul(currentRate);
        _rOwned[address(this)] = _rOwned[address(this)].add(rTeam);
    }

    function _reflectFee(uint256 rFee, uint256 tFee) private {
        _rTotal = _rTotal.sub(rFee);
        _tFeeTotal = _tFeeTotal.add(tFee);
    }

    receive() external payable {}

    function _getValues(uint256 tAmount)
        private
        view
        returns (
            uint256,
            uint256,
            uint256,
            uint256,
            uint256,
            uint256
        )
    {
        (uint256 tTransferAmount, uint256 tFee, uint256 tTeam) =
            _getTValues(tAmount, _redisFee, _taxFee);
        uint256 currentRate = _getRate();
        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee) =
            _getRValues(tAmount, tFee, tTeam, currentRate);
        return (rAmount, rTransferAmount, rFee, tTransferAmount, tFee, tTeam);
    }

    function _getTValues(
        uint256 tAmount,
        uint256 redisFee,
        uint256 taxFee
    )
        private
        pure
        returns (
            uint256,
            uint256,
            uint256
        )
    {
        uint256 tFee = tAmount.mul(redisFee).div(100);
        uint256 tTeam = tAmount.mul(taxFee).div(100);
        uint256 tTransferAmount = tAmount.sub(tFee).sub(tTeam);
        return (tTransferAmount, tFee, tTeam);
    }

    function _getRValues(
        uint256 tAmount,
        uint256 tFee,
        uint256 tTeam,
        uint256 currentRate
    )
        private
        pure
        returns (
            uint256,
            uint256,
            uint256
        )
    {
        uint256 rAmount = tAmount.mul(currentRate);
        uint256 rFee = tFee.mul(currentRate);
        uint256 rTeam = tTeam.mul(currentRate);
        uint256 rTransferAmount = rAmount.sub(rFee).sub(rTeam);
        return (rAmount, rTransferAmount, rFee);
    }

    

    

    function setBuyAndSellFee(uint256 redisFeeOnBuy, uint256 redisFeeOnSell, uint256 taxFeeOnBuy, uint256 taxFeeOnSell) public onlyOwner {
        _redisFeeOnBuy = redisFeeOnBuy;
        _redisFeeOnSell = redisFeeOnSell;
        _taxFeeOnBuy = taxFeeOnBuy;
        _taxFeeOnSell = taxFeeOnSell;
        require (_redisFeeOnBuy+_redisFeeOnSell+_taxFeeOnBuy+_taxFeeOnSell <= 25);
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

}