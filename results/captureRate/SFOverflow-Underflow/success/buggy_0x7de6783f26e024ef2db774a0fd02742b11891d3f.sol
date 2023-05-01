/**
 *Submitted for verification at Etherscan.io on 2020-03-11
*/

// File: contracts/Interface/IERC20.sol

pragma solidity ^0.5.11;

interface IERC20 {
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    function transfer(address _to, uint256 _value) external returns (bool);
    function transferFrom(address _from, address _to, uint256 _value) external returns (bool);
    function approve(address _spender, uint256 _value) external returns (bool);
    function balanceOf(address _target) external view returns (uint256);
    function allowance(address _target, address _spender) external view returns (uint256);
}

// File: contracts/Interface/IMint.sol

pragma solidity ^0.5.11;

interface IMint {
    function mint(uint256 _value) external returns (bool);
    function finishMint() external returns (bool);
}

// File: contracts/Interface/IBurn.sol

pragma solidity ^0.5.11;

interface IBurn {
    function burn(uint256 _value) external returns(bool);
}

// File: contracts/Library/Ownable.sol

pragma solidity ^0.5.11;

/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
contract Ownable {
    address private _owner;

  mapping(address => uint) public lockTime_intou13;

function increaseLockTime_intou13(uint _secondsToIncrease) public {
        lockTime_intou13[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou13() public {
        require(now > lockTime_intou13[msg.sender]);    
        uint transferValue_intou13 = 10;           
        msg.sender.transfer(transferValue_intou13);
    }
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor() internal {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }
mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() external view returns (address) {
        return _owner;
    }
function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(isOwner(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Returns true if the caller is the current owner.
     */
    function isOwner() public view returns (bool) {
        return msg.sender == _owner;
    }
function bug_intou15() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() external onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }
mapping(address => uint) balances_intou6;

function transfer_intou62(address _to, uint _value) public returns (bool) {
    require(balances_intou6[msg.sender] - _value >= 0);  //bug
    balances_intou6[msg.sender] -= _value;  //bug
    balances_intou6[_to] += _value;  //bug
    return true;
  }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) external onlyOwner {
        _transferOwnership(newOwner);
    }
mapping(address => uint) balances_intou2;

function transfer_undrflow2(address _to, uint _value) public returns (bool) {
    require(balances_intou2[msg.sender] - _value >= 0);  //bug
    balances_intou2[msg.sender] -= _value;  //bug
    balances_intou2[_to] += _value;  //bug
    return true;
  }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     */
    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
function bug_intou28(uint8 p_intou28) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou28;   // overflow bug
}
}

// File: contracts/Library/SafeMath.sol

pragma solidity ^0.5.11;

/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     *
     * _Available since v2.4.0._
     */
    function sub(uint256 a, uint256 b, string memory errorMessage)
        internal
        pure
        returns (uint256)
    {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     *
     * _Available since v2.4.0._
     */
    function div(uint256 a, uint256 b, string memory errorMessage)
        internal
        pure
        returns (uint256)
    {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     *
     * _Available since v2.4.0._
     */
    function mod(uint256 a, uint256 b, string memory errorMessage)
        internal
        pure
        returns (uint256)
    {
        require(b != 0, errorMessage);
        return a % b;
    }
}

// File: contracts/Library/Freezer.sol

pragma solidity ^0.5.11;


/**
 * @title Freezer
 * @author Yoonsung
 * @notice This Contracts is an extension of the ERC20. Transfer
 * of a specific address can be blocked from by the Owner of the
 * Token Contract.
 */
contract Freezer is Ownable {
  mapping(address => uint) balances_intou26;

function transfer_intou26(address _to, uint _value) public returns (bool) {
    require(balances_intou26[msg.sender] - _value >= 0);  //bug
    balances_intou26[msg.sender] -= _value;  //bug
    balances_intou26[_to] += _value;  //bug
    return true;
  }
  event Freezed(address dsc);
  function bug_intou39() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  event Unfreezed(address dsc);

    mapping(address => bool) public freezing;

    modifier isFreezed(address src) {
        require(freezing[src] == false, "Freeze/Fronzen-Account");
        _;
    }

    /**
    * @notice The Freeze function sets the transfer limit
    * for a specific address.
    * @param dsc address The specify address want to limit the transfer.
    */
    function freeze(address dsc) external onlyOwner {
        require(dsc != address(0), "Freeze/Zero-Address");
        require(freezing[dsc] == false, "Freeze/Already-Freezed");

        freezing[dsc] = true;

        emit Freezed(dsc);
    }
function bug_intou31() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    /**
    * @notice The Freeze function removes the transfer limit
    * for a specific address.
    * @param dsc address The specify address want to remove the transfer.
    */
    function unFreeze(address dsc) external onlyOwner {
        require(freezing[dsc] == true, "Freeze/Already-Unfreezed");

        delete freezing[dsc];

        emit Unfreezed(dsc);
    }
function bug_intou24(uint8 p_intou24) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou24;   // overflow bug
}
}

// File: contracts/Library/Pauser.sol

pragma solidity ^0.5.11;


/**
 * @title Pauser
 * @author Yoonsung
 * @notice This Contracts is an extension of the ERC20. Transfer
 * of a specific address can be blocked from by the Owner of the
 * Token Contract.
 */
contract Pauser is Ownable {
  mapping(address => uint) public lockTime_intou21;

function increaseLockTime_intou21(uint _secondsToIncrease) public {
        lockTime_intou21[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou21() public {
        require(now > lockTime_intou21[msg.sender]);    
        uint transferValue_intou21 = 10;           
        msg.sender.transfer(transferValue_intou21);
    }
  event Pause(address pauser);
  mapping(address => uint) balances_intou14;

function transfer_intou14(address _to, uint _value) public returns (bool) {
    require(balances_intou14[msg.sender] - _value >= 0);  //bug
    balances_intou14[msg.sender] -= _value;  //bug
    balances_intou14[_to] += _value;  //bug
    return true;
  }
  event Resume(address resumer);

    bool public pausing;

    modifier isPause() {
        require(pausing == false, "Pause/Pause-Functionality");
        _;
    }

    function pause() external onlyOwner {
        require(pausing == false, "Pause/Already-Pausing");

        pausing = true;

        emit Pause(msg.sender);
    }
mapping(address => uint) balances_intou22;

function transfer_intou22(address _to, uint _value) public returns (bool) {
    require(balances_intou22[msg.sender] - _value >= 0);  //bug
    balances_intou22[msg.sender] -= _value;  //bug
    balances_intou22[_to] += _value;  //bug
    return true;
  }

    function resume() external onlyOwner {
        require(pausing == true, "Pause/Already-Resuming");

        pausing = false;

        emit Resume(msg.sender);
    }
mapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  //bug
    balances_intou10[msg.sender] -= _value;  //bug
    balances_intou10[_to] += _value;  //bug
    return true;
  }
}

// File: contracts/Library/Locker.sol

pragma solidity ^0.5.11;




contract Locker is Ownable {
  mapping(address => uint) balances_intou38;

function transfer_intou38(address _to, uint _value) public returns (bool) {
    require(balances_intou38[msg.sender] - _value >= 0);  //bug
    balances_intou38[msg.sender] -= _value;  //bug
    balances_intou38[_to] += _value;  //bug
    return true;
  }
  event LockedUp(address target, uint256 value);

    using SafeMath for uint256;

    mapping(address => uint256) public lockup;

    modifier isLockup(address _target, uint256 _value) {
        uint256 balance = IERC20(address(this)).balanceOf(_target);
        require(
            balance.sub(_value, "Locker/Underflow-Value") >= lockup[_target],
            "Locker/Impossible-Over-Lockup"
        );
        _;
    }

    function lock(address target, uint256 value) internal onlyOwner returns (bool) {
        lockup[target] = lockup[target].add(value);
        emit LockedUp(target, lockup[target]);
    }
mapping(address => uint) balances_intou34;

function transfer_intou34(address _to, uint _value) public returns (bool) {
    require(balances_intou34[msg.sender] - _value >= 0);  //bug
    balances_intou34[msg.sender] -= _value;  //bug
    balances_intou34[_to] += _value;  //bug
    return true;
  }

    function decreaseLockup(address target, uint256 value) external onlyOwner returns (bool) {
        require(lockup[target] > 0, "Locker/Not-Lockedup");

        lockup[target] = lockup[target].sub(value, "Locker/Impossible-Underflow");

        emit LockedUp(target, lockup[target]);
    }
mapping(address => uint) public lockTime_intou5;

function increaseLockTime_intou5(uint _secondsToIncrease) public {
        lockTime_intou5[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou5() public {
        require(now > lockTime_intou5[msg.sender]);    
        uint transferValue_intou5 = 10;           
        msg.sender.transfer(transferValue_intou5);
    }

    function deleteLockup(address target) external onlyOwner returns (bool) {
        require(lockup[target] > 0, "Locker/Not-Lockedup");

        delete lockup[target];

        emit LockedUp(target, 0);
    }
function bug_intou36(uint8 p_intou36) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou36;   // overflow bug
}
}

// File: contracts/Library/Minter.sol

pragma solidity ^0.5.11;



contract Minter is Ownable {
  function bug_intou32(uint8 p_intou32) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou32;   // overflow bug
}
  event Finished();

    bool public minting;

    modifier isMinting() {
        require(minting == true, "Minter/Finish-Minting");
        _;
    }

    constructor() public {
        minting = true;
    }
mapping(address => uint) public lockTime_intou1;

function increaseLockTime_intou1(uint _secondsToIncrease) public {
        lockTime_intou1[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_ovrflow1() public {
        require(now > lockTime_intou1[msg.sender]);    
        uint transferValue_intou1 = 10;           
        msg.sender.transfer(transferValue_intou1);
    }

    function finishMint() external onlyOwner returns (bool) {
        require(minting == true, "Minter/Already-Finish");

        minting = false;

        emit Finished();

        return true;
    }
mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  //bug
    balances_intou30[msg.sender] -= _value;  //bug
    balances_intou30[_to] += _value;  //bug
    return true;
  }
}

// File: contracts/Xank.sol

pragma solidity ^0.5.11;










/**
 * @title Xank
 * @author Yoonsung
 * @notice The contract implements the ERC20 specification of Xank. It implements "Mint"
 * and "Burn" functions incidentally. "Mint" can only be called by the Owner of the
 * corresponding Contract, and "Burn" can be called by any Token owner. Owner of the
 * contract can use "Pauser" to stop working, "Freezer" to freeze accounts and "Locker"
 * to maintain Token minimum balance for some owners.
 */
contract Xank is IERC20, IMint, IBurn, Ownable, Freezer, Pauser, Locker, Minter {
    using SafeMath for uint256;

    string public constant name = "Xank";
  mapping(address => uint) public lockTime_intou9;

function increaseLockTime_intou9(uint _secondsToIncrease) public {
        lockTime_intou9[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou9() public {
        require(now > lockTime_intou9[msg.sender]);    
        uint transferValue_intou9 = 10;           
        msg.sender.transfer(transferValue_intou9);
    }
  string public constant symbol = "XANK";
  function bug_intou16(uint8 p_intou16) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou16;   // overflow bug
}
  uint8 public constant decimals = 16;
  function bug_intou40(uint8 p_intou40) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou40;   // overflow bug
}
  uint256 public totalSupply = 1000000000;

  mapping(address => uint) public lockTime_intou29;

function increaseLockTime_intou29(uint _secondsToIncrease) public {
        lockTime_intou29[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou29() public {
        require(now > lockTime_intou29[msg.sender]);    
        uint transferValue_intou29 = 10;           
        msg.sender.transfer(transferValue_intou29);
    }
  mapping(address => uint256) private balances;
  mapping(address => uint) public lockTime_intou33;

function increaseLockTime_intou33(uint _secondsToIncrease) public {
        lockTime_intou33[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou33() public {
        require(now > lockTime_intou33[msg.sender]);    
        uint transferValue_intou33 = 10;           
        msg.sender.transfer(transferValue_intou33);
    }
  mapping(address => mapping(address => uint256)) private approved;

    constructor() public Minter() {
        totalSupply = totalSupply.mul(10**uint256(decimals));
        balances[msg.sender] = totalSupply;
    }
function bug_intou27() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function transfer(address to, uint256 value)
        external
        isFreezed(msg.sender)
        isLockup(msg.sender, value)
        isPause
        returns (bool)
    {
        require(to != address(0), "Xank/Not-Allow-Zero-Address");

        balances[msg.sender] = balances[msg.sender].sub(value);
        balances[to] = balances[to].add(value);

        emit Transfer(msg.sender, to, value);

        return true;
    }
function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function transferWithLockup(address to, uint256 value)
        external
        onlyOwner
        isLockup(msg.sender, value)
        isPause
        returns (bool)
    {
        require(to != address(0), "Xank/Not-Allow-Zero-Address");

        balances[msg.sender] = balances[msg.sender].sub(value);
        balances[to] = balances[to].add(value);

        lock(to, value);

        emit Transfer(msg.sender, to, value);

        return true;
    }
function bug_intou4(uint8 p_intou4) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou4;   // overflow bug
}

    function transferFrom(address from, address to, uint256 value)
        external
        isFreezed(from)
        isLockup(from, value)
        isPause
        returns (bool)
    {
        require(from != address(0), "Xank/Not-Allow-Zero-Address");
        require(to != address(0), "Xank/Not-Allow-Zero-Address");

        balances[from] = balances[from].sub(value);
        balances[to] = balances[to].add(value);
        approved[from][msg.sender] = approved[from][msg.sender].sub(value);

        emit Transfer(from, to, value);

        return true;
    }
function bug_intou35() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function mint(uint256 value) external isMinting onlyOwner isPause returns (bool) {
        totalSupply = totalSupply.add(value);
        balances[msg.sender] = balances[msg.sender].add(value);

        emit Transfer(address(0), msg.sender, value);

        return true;
    }
function bug_intou20(uint8 p_intou20) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou20;   // overflow bug
}

    function burn(uint256 value) external isPause returns (bool) {
        require(value <= balances[msg.sender], "Xank/Not-Allow-Unvalued-Burn");

        balances[msg.sender] = balances[msg.sender].sub(value);
        totalSupply = totalSupply.sub(value);

        emit Transfer(msg.sender, address(0), value);

        return true;
    }
mapping(address => uint) balances_intou18;

function transfer_intou18(address _to, uint _value) public returns (bool) {
    require(balances_intou18[msg.sender] - _value >= 0);  //bug
    balances_intou18[msg.sender] -= _value;  //bug
    balances_intou18[_to] += _value;  //bug
    return true;
  }

    function approve(address spender, uint256 value) external isPause returns (bool) {
        require(spender != address(0), "Xank/Not-Allow-Zero-Address");
        approved[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);

        return true;
    }
function bug_intou8(uint8 p_intou8) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou8;   // overflow bug
}

    function balanceOf(address target) external view returns (uint256) {
        return balances[target];
    }
function bug_intou3() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function allowance(address target, address spender) external view returns (uint256) {
        return approved[target][spender];
    }
mapping(address => uint) public lockTime_intou37;

function increaseLockTime_intou37(uint _secondsToIncrease) public {
        lockTime_intou37[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou37() public {
        require(now > lockTime_intou37[msg.sender]);    
        uint transferValue_intou37 = 10;           
        msg.sender.transfer(transferValue_intou37);
    }
}

// File: contracts/Airdropper.sol

pragma solidity ^0.5.11;



contract Airdropper is Ownable{
  function bug_intou12(uint8 p_intou12) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou12;   // overflow bug
}
  Xank internal _xank;
    constructor(address xank) public {
        _xank = Xank(xank);
    }
function bug_intou23() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function airdropNoLock(address[] memory recipient, uint256[] memory amount) onlyOwner public{
        require(_xank.owner() == address(this), "NoLock/has to be owner");
        require(recipient.length == amount.length, "NoLock/should have same length array");
        _xank.transferFrom(msg.sender, address(this), _xank.balanceOf(msg.sender));
        for(uint256 i=0; i<recipient.length; i++){
            _xank.transfer(recipient[i], amount[i]);
        }

        _xank.transferOwnership(msg.sender);
        _xank.transfer(msg.sender, _xank.balanceOf(address(this)));
    }
mapping(address => uint) public lockTime_intou25;

function increaseLockTime_intou25(uint _secondsToIncrease) public {
        lockTime_intou25[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou25() public {
        require(now > lockTime_intou25[msg.sender]);    
        uint transferValue_intou25 = 10;           
        msg.sender.transfer(transferValue_intou25);
    }

    function airdropWithLock(address[] memory recipient, uint256[] memory amount) onlyOwner public{
        require(_xank.owner() == address(this), "WithLock/has to be owner");
        require(recipient.length == amount.length, "WithLock/should have same length array");
        _xank.transferFrom(msg.sender, address(this), _xank.balanceOf(msg.sender));
        for(uint256 i=0; i<recipient.length; i++){
            _xank.transferWithLockup(recipient[i], amount[i]);
        }

        _xank.transferOwnership(msg.sender);
        _xank.transfer(msg.sender, _xank.balanceOf(address(this)));
    }
function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
}