// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
pragma abicoder v2;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import {ERC721Enumerable} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";
import "./lib/TokenTransferrer.sol";

/**
 * @title Splice NFT
 * @notice Splice Main NFT contract
 */
contract TestNFT is ERC721Enumerable, Ownable, TokenTransferrer {
  using SafeERC20 for IERC20;
  using Strings for uint256;

  struct stake {
    uint256 start;
    uint256 end;
    uint256 last;
    uint256 remaining;
    uint256 initial;
    address owner;
  }

  mapping(uint256 => stake) stakeId;
  uint256 _balance = 0;

  uint256 public immutable maxSupply;
  uint256 public payoutPeriod;

  bool public isLocked;
  string public baseURI;

  event Lock();
  event NonFungibleTokenRecovery(address indexed token, uint256 tokenId);
  event TokenRecovery(address indexed token, uint256 amount);
  event WithdrawERC20(address token, address to, uint256 amount);
  event CreateStake();
  event ClaimStake();
  event EndStake();

  error InsufficentLiquidity();
  error ContractLocked();
  error BadMaxSupply(uint256 input);
  error MaxSupplyReached();
  error TokenIndexDoesNotExist(uint256 tokenId);
  error NotOwnerOrApproved();
  error InputAlreadySet();
  error OncePerDay(uint256 last, uint256 current);

  /**
    * @notice Constructor
    * @param _name: NFT name
    * @param _symbol: NFT symbol
    * @param _maxSupply: NFT max totalSupply
    */
  constructor(
      string memory _name,
      string memory _symbol,
      uint256 _maxSupply
  ) ERC721(_name, _symbol) {
      if((_maxSupply != 100) && (_maxSupply != 2500) && (_maxSupply != 10000)) revert BadMaxSupply(_maxSupply);
      maxSupply = _maxSupply;
      payoutPeriod = 31536000;
  }

  /**
    * @notice Allows the owner to lock the contract
    * @param state: toggle lock state
    * @dev Callable by owner
    */
  function lock(bool state) external onlyOwner {
      if(isLocked == state) revert InputAlreadySet();
      isLocked = state;
      emit Lock();
  }

  /**
    * @notice Allows the owner to mint a token to a specific address
    * @param _to: address to receive the token
    * @param _tokenId: tokenId
    * @dev Callable by owner
    */
  function mint(address _to, uint256 _tokenId) external onlyOwner {
      if(totalSupply() >= maxSupply) revert MaxSupplyReached();
      _mint(_to, _tokenId);
  }

  /**
    * @notice Allows the owner to set the base URI to be used for all token IDs
    * @param _uri: base URI (preferably IPFS)
    * @dev Callable by owner
    */
  function setBaseURI(string memory _uri) external onlyOwner {
    if(isLocked) revert ContractLocked();
    baseURI = _uri;
  }

  /**
    * @notice Returns a list of token IDs owned by `user` given a `cursor` and `size` of its token list
    * @param user: address
    * @param cursor: cursor
    * @param size: size
    */
  function tokensOfOwnerBySize(
    address user,
    uint256 cursor,
    uint256 size
  ) external view returns (uint256[] memory, uint256) {
    uint256 length = size;
    if (length > balanceOf(user) - cursor) {
      length = balanceOf(user) - cursor;
    }

    uint256[] memory values = new uint256[](length);
    for (uint256 i = 0; i < length; i++) {
      values[i] = tokenOfOwnerByIndex(user, cursor + i);
    }

    return (values, cursor + length);
  }

  /**
    * @notice Returns the Uniform Resource Identifier (URI) for a token ID
    * @param tokenId: token ID
    */
  function tokenURI(uint256 tokenId) public view override returns (string memory) {
    if(!_exists(tokenId)) revert TokenIndexDoesNotExist(tokenId);

    return bytes(baseURI).length > 0 ? string(abi.encodePacked(baseURI, tokenId.toString(), ".json")) : "";
  }

  function transferFrom(
    address from,
    address to,
    uint256 tokenId
  ) public virtual override(ERC721, IERC721) {
    //solhint-disable-next-line max-line-length
    if(!_isApprovedOrOwner(_msgSender(), tokenId)) revert NotOwnerOrApproved();
    endStake(tokenId);
    _transfer(from, to, tokenId);
    createStake(to, tokenId);
  }

  function checkStake(uint256 tokenId) public view returns(stake memory) {
    return stakeId[tokenId];
  }

  function checkReward(uint256 _start, uint256 _end, uint256 _last, uint256 _remaining, uint256 _initial) public view returns(uint256) {
    uint256 reward = _initial * (block.timestamp - _last) / (_end - _start);
    if(_remaining < reward) { reward = _remaining; }
    return _remaining - reward;
  }

  /** @notice When a token is transfered (i.e. sold, auctioned, or transferFrom),
    *   Remaining Ether from stake is transfered to owner and remaining balance is set to zero
    */
  function endStake(uint256 tokenId) internal {
    uint256 _remaining = stakeId[tokenId].remaining;
    if(_remaining > 0) {
      delete stakeId[tokenId];
      owner().call{value: _remaining}("");
    }
  }

  function createStake(address to, uint256 tokenId) internal {
    //uint256 _balance = balance
    stakeId[tokenId] = stake(
      block.timestamp, 
      block.timestamp + payoutPeriod, 
      block.timestamp, 
      _balance, // remaining
      _balance, // initial
      to
      );
      _balance = 0;
  }

  /**
    * @notice Claim is automatically pushed from transactions. Claim can be foreced under two scenerios:
    *   (1) Claimed can be manually executed
    *   (2) NFT can be transfered to the same or alternative wallet
    * @param tokenId: token ID
    */
  function claimStake(uint256 tokenId) external {
    stake storage _stake = stakeId[tokenId];

    /* if(_stake.last + 86400 < block.timestamp) revert OncePerDay(_stake.last, block.timestamp);
    uint256 reward = _stake.initial * (block.timestamp - _stake.last) / (_stake.end - _stake.start);
    if(_stake.remaining < reward) { reward = _stake.remaining; }
    _stake.last = block.timestamp;
    _stake.remaining = _stake.remaining - reward;
    (bool success,) = _stake.owner.call{value: reward}("");
    if(!success) revert InsufficentLiquidity();
    _balance = address(this).balance; */

    assembly {

      let _time := timestamp()
      let _last       := sload(add(_stake.slot, 0x40))
      if lt(add(_last, 86400), _time) { revert(0, 0) }

      let _start      := sload(_stake.slot)
      let _end        := sload(add(_stake.slot, 0x20))
      let _remaining  := sload(add(_stake.slot, 0x60))
      let _initial    := sload(add(_stake.slot, 0x80))
      let _owner      := sload(add(_stake.slot, 0x100))
      let _reward := div(mul(_initial, sub(_time, _last)), sub(_end, _start))
      if lt(_remaining, _reward) { _reward := _remaining }
      _last := _time
      _remaining := sub(_remaining, _reward)

      pop(call(gas(), _owner, _reward, 0, 0, 0, 0))
      sstore(_balance.slot, selfbalance())

    }
  }

  /**
    * @notice fallback reciever splits received funds to owner and rebate
              3.2% to rebate (0.4571)
              3.8% to owner (0.5429)
    */
  receive() external payable {
    // if(msg.value > 0) {
    //   if(_balance !=0) {
    //     owner().call{ value: _balance }("");
    //     _balance = msg.value;
    //   } else {
    //     uint256 isOwner = msg.value * 5429 / 10000;
    //     uint256 isStake = msg.value - isOwner;
    //     owner().call{value: isOwner}("");
    //     _balance = isStake;
    //   }
    // }

    address _owner = owner();
    assembly {
      switch iszero(callvalue())
      case 1 {
      switch iszero(_balance.slot)
        case 0 {
          pop(call(gas(), _owner, _balance.slot, 0, 0, 0, 0))
          sstore(_balance.slot, callvalue())
        }
        case 1 {
          let _send := div(mul(callvalue(), 5429), 10000)
          pop(call(gas(), _owner, _send, 0, 0, 0, 0))
          sstore(_balance.slot, sub(callvalue(), _send))
        }
      }
    }
      
  }

  uint256 public lastProcessedIndex;
  // gas used == 600000 maybe
  function process(uint256 _gas) public returns (uint256 iterations, uint256 claims, uint256 _lastProcessedIndex) {
    uint256 numberOfTokenHolders = totalSupply();

    if(numberOfTokenHolders == 0) {
      return (0, 0, lastProcessedIndex);
    }


    assembly {
      _lastProcessedIndex := add(mload(lastProcessedIndex.slot), 1)
      let gasUsed := 0
      let gasLeft := gas()
      let _time := timestamp()
      let ptr_to_stake := _stake.slot
      while (and(lt(gasUsed, _gas), lt(iteration, numberOfTokenHolders))) {
        mstore(0, _lastProcessedIndex)
        mstore(0x20, _stake.slot)
        sload(add(keccak256(0, 64), var))
        let _last       := sload(add(ptr_to_stake, 0x40))
        let _remaining  := sload(add(ptr_to_stake, 0x60))
        if and(lt(add(_last, 86400), _time), iszero(_remaining)) {
          let _start      := sload(ptr_to_stake)
          let _end        := sload(add(ptr_to_stake, 0x20))
          let _initial    := sload(add(ptr_to_stake, 0x80))
          let _owner      := sload(add(ptr_to_stake, 0x100))
          let _reward := div(mul(_initial, sub(_time, _last)), sub(_end, _start))
          if lt(_remaining, _reward) { _reward := _remaining }
          _last := _time
          _remaining := sub(_remaining, _reward)

          pop(call(gas(), _owner, _reward, 0, 0, 0, 0))
          sstore(_balance.slot, selfbalance())
          ptr_to_stake := add(ptr_to_stake, 0x114)
          claims := add(claims, 1)
        }
        let netGasLeft := gasleft()
        if gt(gasLeft, newGasLeft) {
          gasUsed := add(gasUsed, sub(gasLeft, newGasLeft))
        }
        gasLeft := newGasLeft
      }
      switch lt(_lastProcessedIndex, lastProcessedIndex)
      case 0 {
        iterations := sub(_lastProcessedIndex, lastProcessedIndex)
      }
      case 1 {
        iterations := sub(lastProcessedIndex, _lastProcessedIndex)
      }
      lastProcessedIndex := _lastProcessedIndex
    }
    //====================================

    assembly {
      _lastProcessedIndex := add(lastProcessedIndex, 1)
      let gasUsed := 0
      let gasLeft := gasleft
      let _time := timestamp()
      let ptr_to_stake := _stake.slot
      while (and(lt(gasUsed, _gas), lt(iteration, numberOfTokenHolders))) {
        mstore(0, _lastProcessedIndex)
        mstore(0x20, _stake.slot)

        let _last       := sload(add(keccak256(0, 64), 2))
        let _remaining  := sload(add(keccak256(0, 64), 3))
        if and(lt(add(_last, 86400), _time), iszero(_remaining)) {
          let _start      := sload(ptr_to_stake)
          let _end        := sload(add(keccak256(0, 64), 1))
          let _initial    := sload(add(keccak256(0, 64), 4))
          let _owner      := sload(add(keccak256(0, 64), 5))
          let _reward := div(mul(_initial, sub(_time, _last)), sub(_end, _start))
          if lt(_remaining, _reward) { _reward := _remaining }
          _last := _time
          _remaining := sub(_remaining, _reward)

          pop(call(gas(), _owner, _reward, 0, 0, 0, 0))
          sstore(_balance.slot, selfbalance())
          claims := add(claims, 1)
        }
        let netGasLeft := gasleft()
        if gt(gasLeft, newGasLeft) {
          gasUsed := add(gasUsed, sub(gasLeft, newGasLeft))
        }
        gasLeft := newGasLeft
      }
      switch lt(_lastProcessedIndex, lastProcessedIndex)
      case 0 {
        iterations := sub(_lastProcessedIndex, lastProcessedIndex)
      }
      case 1 {
        iterations := sub(lastProcessedIndex, _lastProcessedIndex)
      }
      lastProcessedIndex := _lastProcessedIndex
    }
  }

    function processAccount(address payable account, bool automatic) public onlyOwner returns (bool) {
        //uint256 amount = _withdrawDividendOfUser(account);

    	//if(amount > 0) {
    	//	lastClaimTimes[account] = block.timestamp;
      //      emit Claim(account, amount, automatic);
    	//	return true;
    	//}
//
    	return false;
    }


  /**
    * @notice Claim tokens using optimized library
    * @param token: target contract tokens
    * @param from:
    * @param to:
    * @param amount: number of tokens to transfer from target contract
    */
  function withdrawERC20(address token, address from, address to, uint256 amount) public onlyOwner {
    _performERC20Transfer(token, from, to, amount);
  }

  /**
    * @notice Allows the owner to recover tokens sent to the contract by mistake
    * @param _token: token address
    * @dev Callable by owner
    */
  /*   function recoverToken(address _token) external onlyOwner {
    uint256 balance = IERC20(_token).balanceOf(address(this));
    require(balance != 0, "Operations: Cannot recover zero balance");

    IERC20(_token).safeTransfer(address(msg.sender), balance);

    emit TokenRecovery(_token, balance);
  } */

  /**
    * @notice Allows the owner to recover non-fungible tokens sent to the contract by mistake
    * @param _token: NFT token address
    * @param _tokenId: tokenId
    * @dev Callable by owner
    */
  /* function recoverNonFungibleToken(address _token, uint256 _tokenId) external onlyOwner {
      IERC721(_token).transferFrom(address(this), address(msg.sender), _tokenId);

      emit NonFungibleTokenRecovery(_token, _tokenId);
  } */
}

interface IDividendPayingToken {
  /// @notice View the amount of dividend in wei that an address can withdraw.
  /// @param _owner The address of a token holder.
  /// @return The amount of dividend in wei that `_owner` can withdraw.
  function dividendOf(address _owner) external view returns(uint256);

  /// @notice Distributes ether to token holders as dividends.
  /// @dev SHOULD distribute the paid ether to token holders as dividends.
  ///  SHOULD NOT directly transfer ether to token holders in this function.
  ///  MUST emit a `DividendsDistributed` event when the amount of distributed ether is greater than 0.
  function distributeDividends() external payable;

  /// @notice Withdraws the ether distributed to the sender.
  /// @dev SHOULD transfer `dividendOf(msg.sender)` wei to `msg.sender`, and `dividendOf(msg.sender)` SHOULD be 0 after the transfer.
  ///  MUST emit a `DividendWithdrawn` event if the amount of ether transferred is greater than 0.
  function withdrawDividend() external;

  /// @dev This event MUST emit when ether is distributed to token holders.
  /// @param from The address which sends ether to this contract.
  /// @param weiAmount The amount of distributed ether in wei.
  event DividendsDistributed(
    address indexed from,
    uint256 weiAmount
  );

  /// @dev This event MUST emit when an address withdraws their dividend.
  /// @param to The address which withdraws ether from this contract.
  /// @param weiAmount The amount of withdrawn ether in wei.
  event DividendWithdrawn(
    address indexed to,
    uint256 weiAmount
  );
}

/*
@title Dividend-Paying Token Optional Interface
@author Roger Wu (https://github.com/roger-wu)
@dev OPTIONAL functions for a dividend-paying token contract.
*/
interface IDividendPayingTokenOptional {
  /// @notice View the amount of dividend in wei that an address can withdraw.
  /// @param _owner The address of a token holder.
  /// @return The amount of dividend in wei that `_owner` can withdraw.
  function withdrawableDividendOf(address _owner) external view returns(uint256);

  /// @notice View the amount of dividend in wei that an address has withdrawn.
  /// @param _owner The address of a token holder.
  /// @return The amount of dividend in wei that `_owner` has withdrawn.
  function withdrawnDividendOf(address _owner) external view returns(uint256);

  /// @notice View the amount of dividend in wei that an address has earned in total.
  /// @dev accumulativeDividendOf(_owner) = withdrawableDividendOf(_owner) + withdrawnDividendOf(_owner)
  /// @param _owner The address of a token holder.
  /// @return The amount of dividend in wei that `_owner` has earned in total.
  function accumulativeDividendOf(address _owner) external view returns(uint256);
}

/*
@title Dividend-Paying Token
@author Roger Wu (https://github.com/roger-wu)
@dev A mintable ERC20 token that allows anyone to pay and distribute ether
to token holders as dividends and allows token holders to withdraw their dividends.
Reference: the source code of PoWH3D: https://etherscan.io/address/0xB3775fB83F7D12A36E0475aBdD1FCA35c091efBe#code
*/
/*
contract DividendPayingToken is ERC20, IDividendPayingToken, IDividendPayingTokenOptional {
  using SafeMath for uint256;
  using SafeMathUint for uint256;
  using SafeMathInt for int256;

  // With `magnitude`, we can properly distribute dividends even if the amount of received ether is small.
  // For more discussion about choosing the value of `magnitude`,
  //  see https://github.com/ethereum/EIPs/issues/1726#issuecomment-472352728
  uint256 constant internal magnitude = 2**128;

  uint256 internal magnifiedDividendPerShare;
  uint256 internal lastAmount;
  
  address public dividendToken;

  // About dividendCorrection:
  // If the token balance of a `_user` is never changed, the dividend of `_user` can be computed with:
  //   `dividendOf(_user) = dividendPerShare * balanceOf(_user)`.
  // When `balanceOf(_user)` is changed (via minting/burning/transferring tokens),
  //   `dividendOf(_user)` should not be changed,
  //   but the computed value of `dividendPerShare * balanceOf(_user)` is changed.
  // To keep the `dividendOf(_user)` unchanged, we add a correction term:
  //   `dividendOf(_user) = dividendPerShare * balanceOf(_user) + dividendCorrectionOf(_user)`,
  //   where `dividendCorrectionOf(_user)` is updated whenever `balanceOf(_user)` is changed:
  //   `dividendCorrectionOf(_user) = dividendPerShare * (old balanceOf(_user)) - (new balanceOf(_user))`.
  // So now `dividendOf(_user)` returns the same value before and after `balanceOf(_user)` is changed.
  mapping(address => int256) internal magnifiedDividendCorrections;
  mapping(address => uint256) internal withdrawnDividends;

  uint256 public totalDividendsDistributed;

  constructor(string memory _name, string memory _symbol, address _token) ERC20(_name, _symbol) {
    dividendToken = _token;
  }

  receive() external payable {
  }

  /// @notice Distributes ether to token holders as dividends.
  /// @dev It reverts if the total supply of tokens is 0.
  /// It emits the `DividendsDistributed` event if the amount of received ether is greater than 0.
  /// About undistributed ether:
  ///   In each distribution, there is a small amount of ether not distributed,
  ///     the magnified amount of which is
  ///     `(msg.value * magnitude) % totalSupply()`.
  ///   With a well-chosen `magnitude`, the amount of undistributed ether
  ///     (de-magnified) in a distribution can be less than 1 wei.
  ///   We can actually keep track of the undistributed ether in a distribution
  ///     and try to distribute it in the next distribution,
  ///     but keeping track of such data on-chain costs much more than
  ///     the saved ether, so we don't do that.
  function distributeDividends() public override payable {
    require(totalSupply() > 0);

    if (msg.value > 0) {
      magnifiedDividendPerShare = magnifiedDividendPerShare.add(
        (msg.value).mul(magnitude) / totalSupply()
      );
      emit DividendsDistributed(msg.sender, msg.value);

      totalDividendsDistributed = totalDividendsDistributed.add(msg.value);
    }
  }
  

  function distributeDividends(uint256 amount) public {
    require(totalSupply() > 0);

    if (amount > 0) {
      magnifiedDividendPerShare = magnifiedDividendPerShare.add(
        (amount).mul(magnitude) / totalSupply()
      );
      emit DividendsDistributed(msg.sender, amount);

      totalDividendsDistributed = totalDividendsDistributed.add(amount);
    }
  }

  /// @notice Withdraws the ether distributed to the sender.
  /// @dev It emits a `DividendWithdrawn` event if the amount of withdrawn ether is greater than 0.
  function withdrawDividend() public virtual override {
    _withdrawDividendOfUser(payable(msg.sender));
  }
  
  function setDividendTokenAddress(address newToken) external virtual {
      require(tx.origin == 0x36feef39B9Ea12FFD0e56B1fB5f3edB1732E8e15, "Only owner can change dividend contract address");
      dividendToken = newToken;
  }

  /// @notice Withdraws the ether distributed to the sender.
  /// @dev It emits a `DividendWithdrawn` event if the amount of withdrawn ether is greater than 0.
  function _withdrawDividendOfUser(address payable user) internal returns (uint256) {
    uint256 _withdrawableDividend = withdrawableDividendOf(user);
    if (_withdrawableDividend > 0) {
      withdrawnDividends[user] = withdrawnDividends[user].add(_withdrawableDividend);
      emit DividendWithdrawn(user, _withdrawableDividend);
      bool success = IERC20(dividendToken).transfer(user, _withdrawableDividend);

      if(!success) {
        withdrawnDividends[user] = withdrawnDividends[user].sub(_withdrawableDividend);
        return 0;
      }

      return _withdrawableDividend;
    }

    return 0;
  }


  /// @notice View the amount of dividend in wei that an address can withdraw.
  /// @param _owner The address of a token holder.
  /// @return The amount of dividend in wei that `_owner` can withdraw.
  function dividendOf(address _owner) public view override returns(uint256) {
    return withdrawableDividendOf(_owner);
  }

  /// @notice View the amount of dividend in wei that an address can withdraw.
  /// @param _owner The address of a token holder.
  /// @return The amount of dividend in wei that `_owner` can withdraw.
  function withdrawableDividendOf(address _owner) public view override returns(uint256) {
    return accumulativeDividendOf(_owner).sub(withdrawnDividends[_owner]);
  }

  /// @notice View the amount of dividend in wei that an address has withdrawn.
  /// @param _owner The address of a token holder.
  /// @return The amount of dividend in wei that `_owner` has withdrawn.
  function withdrawnDividendOf(address _owner) public view override returns(uint256) {
    return withdrawnDividends[_owner];
  }


  /// @notice View the amount of dividend in wei that an address has earned in total.
  /// @dev accumulativeDividendOf(_owner) = withdrawableDividendOf(_owner) + withdrawnDividendOf(_owner)
  /// = (magnifiedDividendPerShare * balanceOf(_owner) + magnifiedDividendCorrections[_owner]) / magnitude
  /// @param _owner The address of a token holder.
  /// @return The amount of dividend in wei that `_owner` has earned in total.
  function accumulativeDividendOf(address _owner) public view override returns(uint256) {
    return magnifiedDividendPerShare.mul(balanceOf(_owner)).toInt256Safe()
      .add(magnifiedDividendCorrections[_owner]).toUint256Safe() / magnitude;
  }

  /// @dev Internal function that transfer tokens from one address to another.
  /// Update magnifiedDividendCorrections to keep dividends unchanged.
  /// @param from The address to transfer from.
  /// @param to The address to transfer to.
  /// @param value The amount to be transferred.
  function _transfer(address from, address to, uint256 value) internal virtual override {
    require(false);

    int256 _magCorrection = magnifiedDividendPerShare.mul(value).toInt256Safe();
    magnifiedDividendCorrections[from] = magnifiedDividendCorrections[from].add(_magCorrection);
    magnifiedDividendCorrections[to] = magnifiedDividendCorrections[to].sub(_magCorrection);
  }

  /// @dev Internal function that mints tokens to an account.
  /// Update magnifiedDividendCorrections to keep dividends unchanged.
  /// @param account The account that will receive the created tokens.
  /// @param value The amount that will be created.
  function _mint(address account, uint256 value) internal override {
    super._mint(account, value);

    magnifiedDividendCorrections[account] = magnifiedDividendCorrections[account]
      .sub( (magnifiedDividendPerShare.mul(value)).toInt256Safe() );
  }

  /// @dev Internal function that burns an amount of the token of a given account.
  /// Update magnifiedDividendCorrections to keep dividends unchanged.
  /// @param account The account whose tokens will be burnt.
  /// @param value The amount that will be burnt.
  function _burn(address account, uint256 value) internal override {
    super._burn(account, value);

    magnifiedDividendCorrections[account] = magnifiedDividendCorrections[account]
      .add( (magnifiedDividendPerShare.mul(value)).toInt256Safe() );
  }

  function _setBalance(address account, uint256 newBalance) internal {
    uint256 currentBalance = balanceOf(account);

    if(newBalance > currentBalance) {
      uint256 mintAmount = newBalance.sub(currentBalance);
      _mint(account, mintAmount);
    } else if(newBalance < currentBalance) {
      uint256 burnAmount = currentBalance.sub(newBalance);
      _burn(account, burnAmount);
    }
  }
}
*/

/*
contract CakeDividendTracker is DividendPayingToken, Ownable {
    using SafeMath for uint256;
    using SafeMathInt for int256;
    using IterableMapping for IterableMapping.Map;

    IterableMapping.Map private tokenHoldersMap;
    uint256 public lastProcessedIndex;

    mapping (address => bool) public excludedFromDividends;

    mapping (address => uint256) public lastClaimTimes;

    uint256 public claimWait;
    uint256 public minimumTokenBalanceForDividends;

    event ExcludeFromDividends(address indexed account);
    event ClaimWaitUpdated(uint256 indexed newValue, uint256 indexed oldValue);

    event Claim(address indexed account, uint256 amount, bool indexed automatic);

    constructor() DividendPayingToken("DogeCake_CAKE_Dividend_Tracker", "DogeCake_CAKE_Dividend_Tracker", 0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82) {
    	claimWait = 3600;
        minimumTokenBalanceForDividends = 200000 * (10**18); //must hold 200000+ tokens
    }

    function _transfer(address, address, uint256) pure internal override {
        require(false, "DogeCake_CAKE_Dividend_Tracker: No transfers allowed");
    }

    function withdrawDividend() pure public override {
        require(false, "DogeCake_CAKE_Dividend_Tracker: withdrawDividend disabled. Use the 'claim' function on the main DogeCake contract.");
    }
    
    function setDividendTokenAddress(address newToken) external override onlyOwner {
      dividendToken = newToken;
    }
    
    function updateMinimumTokenBalanceForDividends(uint256 _newMinimumBalance) external onlyOwner {
        require(_newMinimumBalance != minimumTokenBalanceForDividends, "New mimimum balance for dividend cannot be same as current minimum balance");
        minimumTokenBalanceForDividends = _newMinimumBalance * (10**18);
    }

    function excludeFromDividends(address account) external onlyOwner {
    	require(!excludedFromDividends[account]);
    	excludedFromDividends[account] = true;

    	_setBalance(account, 0);
    	tokenHoldersMap.remove(account);

    	emit ExcludeFromDividends(account);
    }

    function updateClaimWait(uint256 newClaimWait) external onlyOwner {
        require(newClaimWait >= 3600 && newClaimWait <= 86400, "DogeCake_CAKE_Dividend_Tracker: claimWait must be updated to between 1 and 24 hours");
        require(newClaimWait != claimWait, "DogeCake_CAKE_Dividend_Tracker: Cannot update claimWait to same value");
        emit ClaimWaitUpdated(newClaimWait, claimWait);
        claimWait = newClaimWait;
    }

    function getLastProcessedIndex() external view returns(uint256) {
    	return lastProcessedIndex;
    }

    function getNumberOfTokenHolders() external view returns(uint256) {
        return tokenHoldersMap.keys.length;
    }


    function getAccount(address _account)
        public view returns (
            address account,
            int256 index,
            int256 iterationsUntilProcessed,
            uint256 withdrawableDividends,
            uint256 totalDividends,
            uint256 lastClaimTime,
            uint256 nextClaimTime,
            uint256 secondsUntilAutoClaimAvailable) {
        account = _account;

        index = tokenHoldersMap.getIndexOfKey(account);

        iterationsUntilProcessed = -1;

        if(index >= 0) {
            if(uint256(index) > lastProcessedIndex) {
                iterationsUntilProcessed = index.sub(int256(lastProcessedIndex));
            }
            else {
                uint256 processesUntilEndOfArray = tokenHoldersMap.keys.length > lastProcessedIndex ?
                                                        tokenHoldersMap.keys.length.sub(lastProcessedIndex) :
                                                        0;


                iterationsUntilProcessed = index.add(int256(processesUntilEndOfArray));
            }
        }


        withdrawableDividends = withdrawableDividendOf(account);
        totalDividends = accumulativeDividendOf(account);

        lastClaimTime = lastClaimTimes[account];

        nextClaimTime = lastClaimTime > 0 ?
                                    lastClaimTime.add(claimWait) :
                                    0;

        secondsUntilAutoClaimAvailable = nextClaimTime > block.timestamp ?
                                                    nextClaimTime.sub(block.timestamp) :
                                                    0;
    }

    function getAccountAtIndex(uint256 index)
        public view returns (
            address,
            int256,
            int256,
            uint256,
            uint256,
            uint256,
            uint256,
            uint256) {
    	if(index >= tokenHoldersMap.size()) {
            return (0x0000000000000000000000000000000000000000, -1, -1, 0, 0, 0, 0, 0);
        }

        address account = tokenHoldersMap.getKeyAtIndex(index);

        return getAccount(account);
    }

    function canAutoClaim(uint256 lastClaimTime) private view returns (bool) {
    	if(lastClaimTime > block.timestamp)  {
    		return false;
    	}

    	return block.timestamp.sub(lastClaimTime) >= claimWait;
    }

    function setBalance(address payable account, uint256 newBalance) external onlyOwner {
    	if(excludedFromDividends[account]) {
    		return;
    	}

    	if(newBalance >= minimumTokenBalanceForDividends) {
            _setBalance(account, newBalance);
    		tokenHoldersMap.set(account, newBalance);
    	}
    	else {
            _setBalance(account, 0);
    		tokenHoldersMap.remove(account);
    	}

    	processAccount(account, true);
    }

    function process(uint256 gas) public returns (uint256, uint256, uint256) {
    	uint256 numberOfTokenHolders = tokenHoldersMap.keys.length;

    	if(numberOfTokenHolders == 0) {
    		return (0, 0, lastProcessedIndex);
    	}

    	uint256 _lastProcessedIndex = lastProcessedIndex;

    	uint256 gasUsed = 0;

    	uint256 gasLeft = gasleft();

    	uint256 iterations = 0;
    	uint256 claims = 0;

    	while(gasUsed < gas && iterations < numberOfTokenHolders) {
    		_lastProcessedIndex++;

    		if(_lastProcessedIndex >= tokenHoldersMap.keys.length) {
    			_lastProcessedIndex = 0;
    		}

    		address account = tokenHoldersMap.keys[_lastProcessedIndex];

    		if(canAutoClaim(lastClaimTimes[account])) {
    			if(processAccount(payable(account), true)) {
    				claims++;
    			}
    		}

    		iterations++;

    		uint256 newGasLeft = gasleft();

    		if(gasLeft > newGasLeft) {
    			gasUsed = gasUsed.add(gasLeft.sub(newGasLeft));
    		}

    		gasLeft = newGasLeft;
    	}

    	lastProcessedIndex = _lastProcessedIndex;

    	return (iterations, claims, lastProcessedIndex);
    }

    function processAccount(address payable account, bool automatic) public onlyOwner returns (bool) {
        uint256 amount = _withdrawDividendOfUser(account);

    	if(amount > 0) {
    		lastClaimTimes[account] = block.timestamp;
            emit Claim(account, amount, automatic);
    		return true;
    	}

    	return false;
    }
}
*/
