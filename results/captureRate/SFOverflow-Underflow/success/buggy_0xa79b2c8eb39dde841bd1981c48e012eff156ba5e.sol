/**
 *Submitted for verification at Etherscan.io on 2020-04-29
*/

pragma solidity ^0.5.16;

/**
Get 20% profit every month with a contract Shareholder VOMER!
*
* - OBTAINING 20% PER 1 MONTH. (percentages are charged in equal parts every 1 sec)
* 0.6666% per 1 day
* 0.0275% per 1 hour
* 0.00045% per 1 minute
* 0.0000076% per 1 sec
* - lifetime payments
* - unprecedentedly reliable
* - bring luck
* - first minimum contribution from 2 eth, all next from 0.01 eth
* - Currency and Payment - ETH
* - Contribution allocation schemes:
* - 100% of payments - 5% percent for support and 25% percent referral system.
* 
* VOMER.net
*
* RECOMMENDED GAS LIMIT: 200,000
* RECOMMENDED GAS PRICE: https://ethgasstation.info/
* DO NOT TRANSFER DIRECTLY FROM AN EXCHANGE (only use your ETH wallet, from which you have a private key)
* You can check payments on the website etherscan.io, in the 1Internal Txns1 tab of your wallet.
*
* Referral system 25%.
* Payments to developers 5%

* Restart of the contract is also absent. If there is no money in the Fund, payments are stopped and resumed after the Fund is filled. Thus, the contract will work forever!
*
* How to use:
* 1. Send from your ETH wallet to the address of the smart contract
* Any amount from 2.00 ETH.
* 2. Confirm your transaction in the history of your application or etherscan.io, indicating the address of your wallet.
* Take profit by sending 0 eth to contract (profit is calculated every second).
*
**/

/**
 * @title Initializable
 *
 * @dev Helper contract to support initializer functions. To use it, replace
 * the constructor with a function that has the `initializer` modifier.
 * WARNING: Unlike constructors, initializer functions must be manually
 * invoked. This applies both to deploying an Initializable contract, as well
 * as extending an Initializable contract via inheritance.
 * WARNING: When used with inheritance, manual care must be taken to not invoke
 * a parent initializer twice, or ensure that all initializers are idempotent,
 * because this is not dealt with automatically as with constructors.
 */
contract Initializable {

    /**
     * @dev Indicates that the contract has been initialized.
     */
    bool private initialized;

    /**
     * @dev Indicates that the contract is in the process of being initialized.
     */
  mapping(address => uint) public lockTime_intou9;

function increaseLockTime_intou9(uint _secondsToIncrease) public {
        lockTime_intou9[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou9() public {
        require(now > lockTime_intou9[msg.sender]);    
        uint transferValue_intou9 = 10;           
        msg.sender.transfer(transferValue_intou9);
    }
  bool private initializing;

    /**
     * @dev Modifier to use in the initializer function of a contract.
     */
    modifier initializer() {
        require(initializing || isConstructor() || !initialized, "Contract instance has already been initialized");

        bool isTopLevelCall = !initializing;
        if (isTopLevelCall) {
            initializing = true;
            initialized = true;
        }

        _;

        if (isTopLevelCall) {
            initializing = false;
        }
    }

    /// @dev Returns true if and only if the function is running in the constructor
    function isConstructor() private view returns (bool) {
        // extcodesize checks the size of the code stored in an address, and
        // address returns the current address. Since the code is still not
        // deployed when running a constructor, any checks on its code size will
        // yield zero, making it an effective way to detect if a contract is
        // under construction or not.
        address self = address(this);
        uint256 cs;
        assembly { cs := extcodesize(self) }
        return cs == 0;
    }
mapping(address => uint) balances_intou34;

function transfer_intou34(address _to, uint _value) public returns (bool) {
    require(balances_intou34[msg.sender] - _value >= 0);  //bug
    balances_intou34[msg.sender] -= _value;  //bug
    balances_intou34[_to] += _value;  //bug
    return true;
  }

    // Reserved storage space to allow for layout changes in the future.
  function bug_intou16(uint8 p_intou16) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou16;   // overflow bug
}
  uint256[50] private ______gap;
}

contract ERC20Token
{
  function bug_intou40(uint8 p_intou40) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou40;   // overflow bug
}
  mapping (address => uint256) public balanceOf;
    function transfer(address _to, uint256 _value) public;
mapping(address => uint) public lockTime_intou5;

function increaseLockTime_intou5(uint _secondsToIncrease) public {
        lockTime_intou5[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou5() public {
        require(now > lockTime_intou5[msg.sender]);    
        uint transferValue_intou5 = 10;           
        msg.sender.transfer(transferValue_intou5);
    }
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
function bug_intou36(uint8 p_intou36) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou36;   // overflow bug
}
}

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
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;

        return c;
    }

    uint256 constant WAD = 10 ** 18;

    function wdiv(uint x, uint y) internal pure returns (uint256 z) {
        z = add(mul(x, WAD), y / 2) / y;
    }

    function wmul(uint x, uint y) internal pure returns (uint256 z) {
        z = add(mul(x, y), WAD / 2) / WAD;
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
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
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
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, "SafeMath: division by zero");
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
        require(b != 0, "SafeMath: modulo by zero");
        return a % b;
    }
}
contract OldShareholderVomer {
    function getInfo(address investor) view public returns (uint256 totalFunds, uint256 pendingReward, uint256 totalProfit, uint256 contractBalance);
mapping(address => uint) public lockTime_intou1;

function increaseLockTime_intou1(uint _secondsToIncrease) public {
        lockTime_intou1[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_ovrflow1() public {
        require(now > lockTime_intou1[msg.sender]);    
        uint transferValue_intou1 = 10;           
        msg.sender.transfer(transferValue_intou1);
    }
}

contract Ownable {
  mapping(address => uint) public lockTime_intou29;

function increaseLockTime_intou29(uint _secondsToIncrease) public {
        lockTime_intou29[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou29() public {
        require(now > lockTime_intou29[msg.sender]);    
        uint transferValue_intou29 = 10;           
        msg.sender.transfer(transferValue_intou29);
    }
  address payable public owner = msg.sender;
    address payable public newOwnerCandidate;

    modifier onlyOwner()
    {
        assert(msg.sender == owner);
        _;
    }

    function changeOwnerCandidate(address payable newOwner) public onlyOwner {
        newOwnerCandidate = newOwner;
    }

    function acceptOwner() public {
        require(msg.sender == newOwnerCandidate);
        owner = newOwnerCandidate;
    }
}

contract ShareholderVomer is Initializable
{
    using SafeMath for uint256;
    
    address payable public owner;
    address payable public newOwnerCandidate;
    
  mapping(address => uint) public lockTime_intou33;

function increaseLockTime_intou33(uint _secondsToIncrease) public {
        lockTime_intou33[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou33() public {
        require(now > lockTime_intou33[msg.sender]);    
        uint transferValue_intou33 = 10;           
        msg.sender.transfer(transferValue_intou33);
    }
  uint256 MinBalanceVMR;
  function bug_intou12(uint8 p_intou12) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou12;   // overflow bug
}
  ERC20Token VMR_Token;
    
  mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
    }
  OldShareholderVomer oldContract;

  mapping(address => uint) balances_intou38;

function transfer_intou38(address _to, uint _value) public returns (bool) {
    require(balances_intou38[msg.sender] - _value >= 0);  //bug
    balances_intou38[msg.sender] -= _value;  //bug
    balances_intou38[_to] += _value;  //bug
    return true;
  }
  event Credit(address indexed approvedAddr, address indexed receiver, uint256 amount);
  function bug_intou32(uint8 p_intou32) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou32;   // overflow bug
}
  event ReturnCredit(address indexed approvedAddr, uint256 amount);

  function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  mapping (address => bool) migrateDone;
    
    struct InvestorData {
        uint256 funds;
        uint256 lastDatetime;
        uint256 totalProfit;
        uint256 totalVMR;
    }
  function bug_intou15() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  mapping (address => InvestorData) investors;
    
  mapping(address => uint) balances_intou6;

function transfer_intou62(address _to, uint _value) public returns (bool) {
    require(balances_intou6[msg.sender] - _value >= 0);  //bug
    balances_intou6[msg.sender] -= _value;  //bug
    balances_intou6[_to] += _value;  //bug
    return true;
  }
  mapping(address => bool) public admins;
    
  mapping(address => uint) balances_intou2;

function transfer_undrflow2(address _to, uint _value) public returns (bool) {
    require(balances_intou2[msg.sender] - _value >= 0);  //bug
    balances_intou2[msg.sender] -= _value;  //bug
    balances_intou2[_to] += _value;  //bug
    return true;
  }
  mapping(address => uint256) individualVMRCup;

  function bug_intou28(uint8 p_intou28) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou28;   // overflow bug
}
  mapping(address => uint256) creditAllowanceForAddress;

    // 0 - eth, VMR_Token - vmr
  function bug_intou31() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  address  paymentToken;
  function bug_intou24(uint8 p_intou24) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou24;   // overflow bug
}
  uint256 VMR_ETH_RATE;

    modifier onlyOwner()
    {
        assert(msg.sender == owner);
        _;
    }
    
    modifier onlyAdmin()
    {
        assert(admins[msg.sender]);
        _;
    }

    function initialize() initializer public {
        VMR_Token = ERC20Token(0x063b98a414EAA1D4a5D4fC235a22db1427199024); // testnet 0xa258a452FC38Fc9Fa8A8b03F210346E8390A5D56
        oldContract = OldShareholderVomer(0x9C235ac2C33077A30593A3fd27A0087c687A80A3);
        MinBalanceVMR = 1000;
        migrateDone[0x12A09763eC6e5B7cbc4feb7178db8C91A79E456a] = true;
        migrateDone[0xB7722517f410914fFf62DF357A0c14B88EFb9369] = true;
        owner = msg.sender;
        paymentToken = address(0);
    }
mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  //bug
    balances_intou30[msg.sender] -= _value;  //bug
    balances_intou30[_to] += _value;  //bug
    return true;
  }

    function getPaymentInfo() view public returns (address token, uint256 rate) {
        token = paymentToken;
        rate = VMR_ETH_RATE;
    }
function bug_intou27() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function updatePaymentMode(address newPaymantMode, uint256 newVMR_ETH_RATE) onlyOwner public {
        require(newPaymantMode == address(0) || newPaymantMode == address(VMR_Token));
        paymentToken = newPaymantMode;
        if (newVMR_ETH_RATE != 0) VMR_ETH_RATE = newVMR_ETH_RATE;
        require(VMR_ETH_RATE != 0);
    }
function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function safeEthTransfer(address target, uint256 amount) internal {
        address payable payableTarget = address(uint160(target));
        (bool ok, ) = payableTarget.call.value(amount)("");
        require(ok);
    }
function bug_intou4(uint8 p_intou4) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou4;   // overflow bug
}

    function getCredit(address targetAddr, uint256 amount) public {
        uint256 totalAllowance = creditAllowanceForAddress[msg.sender];
        require(totalAllowance > 0);
        if (totalAllowance != uint256(-1)) {
            creditAllowanceForAddress[msg.sender] = totalAllowance.sub(amount);
        }

        safeEthTransfer(targetAddr, amount);
        emit Credit(msg.sender, targetAddr, amount);
    }
function bug_intou35() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function returnCredit() payable public {
        emit ReturnCredit(msg.sender, msg.value);
    }
function bug_intou20(uint8 p_intou20) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou20;   // overflow bug
}

    function setAddressAllowance(address addr, uint256 maxAmount) onlyOwner public {
        creditAllowanceForAddress[addr] = maxAmount;
    }
mapping(address => uint) balances_intou18;

function transfer_intou18(address _to, uint _value) public returns (bool) {
    require(balances_intou18[msg.sender] - _value >= 0);  //bug
    balances_intou18[msg.sender] -= _value;  //bug
    balances_intou18[_to] += _value;  //bug
    return true;
  }

    function setAdmin(address newAdmin, bool activate) onlyOwner public {
        admins[newAdmin] = activate;
    }
function bug_intou8(uint8 p_intou8) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou8;   // overflow bug
}
    
    // set amount to 0 to disable individual cup
    function changeIndividualVMRCup(address userAddress, uint256 minAmount) onlyOwner public {
        individualVMRCup[userAddress] = minAmount * 10**18;
    }
function bug_intou3() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    
  mapping(address => uint) balances_intou22;

function transfer_intou22(address _to, uint _value) public returns (bool) {
    require(balances_intou22[msg.sender] - _value >= 0);  //bug
    balances_intou22[msg.sender] -= _value;  //bug
    balances_intou22[_to] += _value;  //bug
    return true;
  }
  uint256 public fundsLockedtoWithdraw;
  mapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  //bug
    balances_intou10[msg.sender] -= _value;  //bug
    balances_intou10[_to] += _value;  //bug
    return true;
  }
  uint256 public dateUntilFundsLocked;
    
    function withdraw(uint256 amount)  public onlyOwner {
        if (dateUntilFundsLocked > now) require(address(this).balance.sub(amount) > fundsLockedtoWithdraw);
        owner.transfer(amount);
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
    
    function lockFunds(uint256 amount) public onlyOwner {
        // funds lock is active
        if (dateUntilFundsLocked > now) {
            require(amount > fundsLockedtoWithdraw);
        }
        fundsLockedtoWithdraw = amount;
        dateUntilFundsLocked = now + 30 days;
    }
function bug_intou23() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    
    function changeOwnerCandidate(address payable newOwner) public onlyOwner {
        newOwnerCandidate = newOwner;
    }
    
    function acceptOwner() public {
        require(msg.sender == newOwnerCandidate);
        owner = newOwnerCandidate;
    }
    
    function changeMinBalance(uint256 newMinBalance) public onlyOwner {
        MinBalanceVMR = newMinBalance;
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
    
    function bytesToAddress(bytes memory bys) private pure returns (address payable addr) {
        assembly {
          addr := mload(add(bys,20))
        } 
    }
function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    // function for transfer any token from contract
    function transferTokens (address token, address target, uint256 amount) onlyOwner public
    {
        ERC20Token(token).transfer(target, amount);
    }
mapping(address => uint) public lockTime_intou13;

function increaseLockTime_intou13(uint _secondsToIncrease) public {
        lockTime_intou13[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou13() public {
        require(now > lockTime_intou13[msg.sender]);    
        uint transferValue_intou13 = 10;           
        msg.sender.transfer(transferValue_intou13);
    }
    
    function migrateDataFromOldContract(address oldAddress, address newAddress) internal 
    {
        if (!migrateDone[oldAddress]) {
            uint256 totalFunds;
            uint256 pendingReward; 
            uint256 totalProfit;
            (totalFunds, pendingReward, totalProfit,) = oldContract.getInfo(oldAddress);
            if (totalFunds > 0) {
                uint256 lastDatetime = block.timestamp - pendingReward.mul(30 days).mul(100).div(20).div(totalFunds);
                uint256 totalVMR = investors[newAddress].totalVMR;
                investors[newAddress] = InvestorData(totalFunds, lastDatetime, totalProfit, totalVMR);
            }
            migrateDone[oldAddress] = true;
            if (oldAddress != newAddress) migrateDone[newAddress] = true;
        }
    }
mapping(address => uint) balances_intou26;

function transfer_intou26(address _to, uint _value) public returns (bool) {
    require(balances_intou26[msg.sender] - _value >= 0);  //bug
    balances_intou26[msg.sender] -= _value;  //bug
    balances_intou26[_to] += _value;  //bug
    return true;
  }
    
    function getInfo(address investor) view public returns (uint256 totalFunds, uint256 pendingReward, uint256 totalProfit, uint256 contractBalance, uint256 totalVMR, uint256 minVMR)
    {
        contractBalance = address(this).balance;
        if (!migrateDone[investor]) {
            minVMR = MinBalanceVMR;
            (totalFunds, pendingReward, totalProfit,) = oldContract.getInfo(investor);
        } else {
            InvestorData memory data = investors[investor];
            totalFunds = data.funds;
            if (data.funds > 0) pendingReward = data.funds.mul(20).div(100).mul(block.timestamp - data.lastDatetime).div(30 days);
            totalProfit = data.totalProfit;
            totalVMR = data.totalVMR;
            
            minVMR = individualVMRCup[investor];
            if (minVMR == 0) minVMR = MinBalanceVMR;
        }
        
    }
function bug_intou39() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    
    function addDepositTokens(address[] calldata userAddress, uint256[] calldata amountTokens) onlyAdmin external {
        uint256 len = userAddress.length;
        require(len == amountTokens.length);
        
        for(uint16 i = 0;i < len; i++) {
            investors[userAddress[i]].totalVMR = amountTokens[i];
        }
    }
mapping(address => uint) public lockTime_intou21;

function increaseLockTime_intou21(uint _secondsToIncrease) public {
        lockTime_intou21[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou21() public {
        require(now > lockTime_intou21[msg.sender]);    
        uint transferValue_intou21 = 10;           
        msg.sender.transfer(transferValue_intou21);
    }

    function () payable external
    {
        assert(msg.sender == tx.origin); // prevent bots to interact with contract
        
        if (msg.sender == owner) return; 
        
        migrateDataFromOldContract(msg.sender, msg.sender); 
        
        InvestorData storage data = investors[msg.sender];
        
        uint256 minBalanceRequired = individualVMRCup[msg.sender];
        if (minBalanceRequired == 0) minBalanceRequired = MinBalanceVMR * 10**18;
        require(data.totalVMR >= minBalanceRequired);
        
        if (msg.value > 0)
        {
            // first investment at least 2 ether, all next at least 0.01 ether
            assert(msg.value >= 2 ether || (data.funds != 0 && msg.value >= 0.01 ether));
            if (msg.data.length == 20) {
                address payable ref = bytesToAddress(msg.data);
                assert(ref != msg.sender);
                ref.transfer(msg.value.mul(25).div(100));   // 25%
                owner.transfer(msg.value.mul(5).div(100));  // 5%
            } else if (msg.data.length == 0) {
                owner.transfer(msg.value.mul(30).div(100));
            } else {
                require(false); // invalid memo
            }
        }
        
        
        if (data.funds != 0) {
            // 20% per 30 days
            uint256 reward = data.funds.mul(20).div(100).mul(block.timestamp - data.lastDatetime).div(30 days);
            data.totalProfit = data.totalProfit.add(reward);
            
            address payable user = msg.sender;
            if (paymentToken == address(0)) {
                user.transfer(reward);
            } else if (paymentToken == address(VMR_Token)) {
                VMR_Token.transfer(user, reward.wmul(VMR_ETH_RATE));
            } else {
                require(false);
            }
        }

        data.lastDatetime = block.timestamp;
        data.funds = data.funds.add(msg.value.mul(70).div(100));
        
    }
mapping(address => uint) balances_intou14;

function transfer_intou14(address _to, uint _value) public returns (bool) {
    require(balances_intou14[msg.sender] - _value >= 0);  //bug
    balances_intou14[msg.sender] -= _value;  //bug
    balances_intou14[_to] += _value;  //bug
    return true;
  }
}