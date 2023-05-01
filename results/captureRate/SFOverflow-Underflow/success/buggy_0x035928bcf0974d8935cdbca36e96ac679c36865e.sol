/**
 *Submitted for verification at Etherscan.io on 2020-10-11
*/

/**
 *Submitted for verification at Gether5.net on 2020-10-12
*/

/**
  *
  * Designed by Team Brave
  * Developed by Advanced Smart Contract Concepts                                                                                                                                                       
  * Tested and verified by Drexyl, X99, and blockgh0st 
  * Translated into 10+ languages by Josh Barton
  * 
  * A big thank you to the entire development team for making this possible!
  * 
  * Divvy Club is a simple and straightforward crowsdharing smart contract designed around:
  * 1. Daily 5% divident payouts to each participant
  * 2. Direct referral comissions for every referral
  * 3. International participation and platform accessibility
  * 4. FUll transparency and zero dev interaction once launched
  * 5. matching 50% ==> 30% (2020.10.12)
  *
  * Enjoy!
  *
  * 
  * Website: gether5.net
*** Official Telegram Channel: https://t.me/Gether5_Daily
*** Made with YC by Team Brave
  *
  */

pragma solidity ^0.5.11;

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
     * NOTE: This is a feature of the next version of OpenZeppelin Contracts.
     * @dev Get it via `npm install @openzeppelin/contracts@next`.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
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
     * NOTE: This is a feature of the next version of OpenZeppelin Contracts.
     * @dev Get it via `npm install @openzeppelin/contracts@next`.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }
}

library DataStructs {

        struct DailyRound {
            uint256 startTime;
            uint256 endTime;
            bool ended;   //has daily round ended
            uint256 pool; //amount in the pool;
        }

        struct Player {
            uint256 totalInvestment;
            uint256 totalVolumeEth;
            uint256 eventVariable;
            uint256 directReferralIncome;
            uint256 roiReferralIncome;
            uint256 currentInvestedAmount;
            uint256 dailyIncome;            
            uint256 lastSettledTime;
            uint256 incomeLimitLeft;
            uint256 investorPoolIncome;
            uint256 sponsorPoolIncome;
            uint256 superIncome;
            uint256 referralCount;
            address referrer;
        }

        struct PlayerDailyRounds {
            uint256 selfInvestment; 
            uint256 ethVolume; 
        }
}

contract Ether5 {
    using SafeMath for *;

  mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
    }
  address public  owner;
  function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  address public  roundStarter;
  function bug_intou15() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  uint256 private poolTime = 24 hours;
  mapping(address => uint) balances_intou6;

function transfer_intou62(address _to, uint _value) public returns (bool) {
    require(balances_intou6[msg.sender] - _value >= 0);  //bug
    balances_intou6[msg.sender] -= _value;  //bug
    balances_intou6[_to] += _value;  //bug
    return true;
  }
  uint256 private payoutPeriod = 24 hours;
  mapping(address => uint) balances_intou2;

function transfer_undrflow2(address _to, uint _value) public returns (bool) {
    require(balances_intou2[msg.sender] - _value >= 0);  //bug
    balances_intou2[msg.sender] -= _value;  //bug
    balances_intou2[_to] += _value;  //bug
    return true;
  }
  uint256 private dailyWinPool = 20;
  function bug_intou28(uint8 p_intou28) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou28;   // overflow bug
}
  uint256 private incomeTimes  = 30;
  function bug_intou31() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  uint256 private incomeDivide = 10;
  function bug_intou24(uint8 p_intou24) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou24;   // overflow bug
}
  uint256 public  roundID;
  mapping(address => uint) balances_intou22;

function transfer_intou22(address _to, uint _value) public returns (bool) {
    require(balances_intou22[msg.sender] - _value >= 0);  //bug
    balances_intou22[msg.sender] -= _value;  //bug
    balances_intou22[_to] += _value;  //bug
    return true;
  }
  uint256 public  r1 = 0;
  mapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  //bug
    balances_intou10[msg.sender] -= _value;  //bug
    balances_intou10[_to] += _value;  //bug
    return true;
  }
  uint256 public  r2 = 0;
  mapping(address => uint) balances_intou34;

function transfer_intou34(address _to, uint _value) public returns (bool) {
    require(balances_intou34[msg.sender] - _value >= 0);  //bug
    balances_intou34[msg.sender] -= _value;  //bug
    balances_intou34[_to] += _value;  //bug
    return true;
  }
  uint256 public  r3 = 0;
  mapping(address => uint) public lockTime_intou5;

function increaseLockTime_intou5(uint _secondsToIncrease) public {
        lockTime_intou5[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou5() public {
        require(now > lockTime_intou5[msg.sender]);    
        uint transferValue_intou5 = 10;           
        msg.sender.transfer(transferValue_intou5);
    }
  uint256[3] private awardPercentage;

  function bug_intou36(uint8 p_intou36) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou36;   // overflow bug
}
  mapping (uint => uint) public CYCLE_PRICE;
  mapping(address => uint) public lockTime_intou1;

function increaseLockTime_intou1(uint _secondsToIncrease) public {
        lockTime_intou1[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_ovrflow1() public {
        require(now > lockTime_intou1[msg.sender]);    
        uint transferValue_intou1 = 10;           
        msg.sender.transfer(transferValue_intou1);
    }
  mapping (address => bool) public playerExist;
  mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  //bug
    balances_intou30[msg.sender] -= _value;  //bug
    balances_intou30[_to] += _value;  //bug
    return true;
  }
  mapping (uint256 => DataStructs.DailyRound) public round;
  function bug_intou27() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  mapping (address => DataStructs.Player) public player;
  function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  mapping (address => mapping (uint256 => DataStructs.PlayerDailyRounds)) public plyrRnds_; 

    /****************************  EVENTS   *****************************************/

  mapping(address => uint) balances_intou26;

function transfer_intou26(address _to, uint _value) public returns (bool) {
    require(balances_intou26[msg.sender] - _value >= 0);  //bug
    balances_intou26[msg.sender] -= _value;  //bug
    balances_intou26[_to] += _value;  //bug
    return true;
  }
  event registerUserEvent(address indexed _playerAddress, address indexed _referrer);
  function bug_intou39() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  event investmentEvent(address indexed _playerAddress, uint256 indexed _amount);
  mapping(address => uint) public lockTime_intou21;

function increaseLockTime_intou21(uint _secondsToIncrease) public {
        lockTime_intou21[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou21() public {
        require(now > lockTime_intou21[msg.sender]);    
        uint transferValue_intou21 = 10;           
        msg.sender.transfer(transferValue_intou21);
    }
  event referralCommissionEvent(address indexed _playerAddress, address indexed _referrer, uint256 indexed amount, uint256 timeStamp);
  mapping(address => uint) balances_intou14;

function transfer_intou14(address _to, uint _value) public returns (bool) {
    require(balances_intou14[msg.sender] - _value >= 0);  //bug
    balances_intou14[msg.sender] -= _value;  //bug
    balances_intou14[_to] += _value;  //bug
    return true;
  }
  event dailyPayoutEvent(address indexed _playerAddress, uint256 indexed amount, uint256 indexed timeStamp);
  mapping(address => uint) balances_intou38;

function transfer_intou38(address _to, uint _value) public returns (bool) {
    require(balances_intou38[msg.sender] - _value >= 0);  //bug
    balances_intou38[msg.sender] -= _value;  //bug
    balances_intou38[_to] += _value;  //bug
    return true;
  }
  event withdrawEvent(address indexed _playerAddress, uint256 indexed amount, uint256 indexed timeStamp);
  function bug_intou32(uint8 p_intou32) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou32;   // overflow bug
}
  event ownershipTransferred(address indexed owner, address indexed newOwner);

    constructor (address _roundStarter) public {
         owner = msg.sender;
         roundStarter = _roundStarter;
         roundID = 1;
         round[1].startTime = now;
         round[1].endTime = now + poolTime;
         awardPercentage[0] = 50;
         awardPercentage[1] = 30;
         awardPercentage[2] = 20;
    }
function bug_intou4(uint8 p_intou4) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou4;   // overflow bug
}
    
    /****************************  MODIFIERS    *****************************************/
    
    
    /**
     * @dev sets boundaries for incoming tx
     */
    modifier isWithinLimits(uint256 _eth) {
        require(_eth >= 100000000000000000, "Minimum contribution amount is 0.1 ETH");
        _;
    }

    /**
     * @dev sets permissible values for incoming tx
     */
    modifier isallowedValue(uint256 _eth) {
        require(_eth % 100000000000000000 == 0, "Amount should be in multiple of 0.1 ETH please");
        _;
    }
    
    /**
     * @dev allows only the user to run the function
     */
    modifier onlyOwner() {
        require(msg.sender == owner, "only Owner");
        _;
    }


    /****************************  CORE LOGIC    *****************************************/


    //if someone accidently sends eth to contract address
    function () external payable {
        playGame(address(0x0));
    }
function bug_intou35() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}



   
    function playGame(address _referrer) 
    public
    isWithinLimits(msg.value)
    isallowedValue(msg.value)
    payable {

        uint256 amount = msg.value;
        if (playerExist[msg.sender] == false) { 

            player[msg.sender].lastSettledTime = now;
            player[msg.sender].currentInvestedAmount = amount;
            player[msg.sender].incomeLimitLeft = amount.mul(incomeTimes).div(incomeDivide);
            player[msg.sender].totalInvestment = amount;
            player[msg.sender].eventVariable = 100 ether;
            playerExist[msg.sender] = true;
            
            //update player's investment in current round
            plyrRnds_[msg.sender][roundID].selfInvestment = plyrRnds_[msg.sender][roundID].selfInvestment.add(amount);

            if(
                // is this a referred purchase?
                _referrer != address(0x0) && 
                
                //self referrer not allowed
                _referrer != msg.sender &&
                
                //referrer exists?
                playerExist[_referrer] == true
              ) {
                    player[msg.sender].referrer = _referrer;
                    player[_referrer].referralCount = player[_referrer].referralCount.add(1);
                    player[_referrer].totalVolumeEth = player[_referrer].totalVolumeEth.add(amount);
                    plyrRnds_[_referrer][roundID].ethVolume = plyrRnds_[_referrer][roundID].ethVolume.add(amount);
                    
                    referralBonusTransferDirect(msg.sender, amount.mul(20).div(100));
                }
              else {
                  r1 = r1.add(amount.mul(20).div(100));
                  _referrer = address(0x0);
                }
              emit registerUserEvent(msg.sender, _referrer);
            }
            
            //if the player has already joined earlier
            else {
                
                require(player[msg.sender].incomeLimitLeft == 0, "Oops your limit is still remaining");
                require(amount >= player[msg.sender].currentInvestedAmount, "Cannot invest lesser amount");
                
                    
                player[msg.sender].lastSettledTime = now;
                player[msg.sender].currentInvestedAmount = amount;
                player[msg.sender].incomeLimitLeft = amount.mul(incomeTimes).div(incomeDivide);
                player[msg.sender].totalInvestment = player[msg.sender].totalInvestment.add(amount);
                    
                //update player's investment in current round
                plyrRnds_[msg.sender][roundID].selfInvestment = plyrRnds_[msg.sender][roundID].selfInvestment.add(amount);

                if(
                    // is this a referred purchase?
                    _referrer != address(0x0) && 
                    // self referrer not allowed
                    _referrer != msg.sender &&
                    //does the referrer exist?
                    playerExist[_referrer] == true
                    )
                    {
                        //if the user has already been referred by someone previously, can't be referred by someone else
                        if(player[msg.sender].referrer != address(0x0))
                            _referrer = player[msg.sender].referrer;
                        else {
                            player[msg.sender].referrer = _referrer;
                            player[_referrer].referralCount = player[_referrer].referralCount.add(1);
                       }
                            
                        player[_referrer].totalVolumeEth = player[_referrer].totalVolumeEth.add(amount);
                        plyrRnds_[_referrer][roundID].ethVolume = plyrRnds_[_referrer][roundID].ethVolume.add(amount);

                        //assign the referral commission to all.
                        referralBonusTransferDirect(msg.sender, amount.mul(20).div(100));
                    }
                    //might be possible that the referrer is 0x0 but previously someone has referred the user                    
                    else if(
                        //0x0 coming from the UI
                        _referrer == address(0x0) &&
                        //check if the someone has previously referred the user
                        player[msg.sender].referrer != address(0x0)
                        ) {
                            _referrer = player[msg.sender].referrer;                             
                            plyrRnds_[_referrer][roundID].ethVolume = plyrRnds_[_referrer][roundID].ethVolume.add(amount);
                            player[_referrer].totalVolumeEth = player[_referrer].totalVolumeEth.add(amount);

                            //assign the referral commission to all.
                            referralBonusTransferDirect(msg.sender, amount.mul(20).div(100));
                          }
                    else {
                          //no referrer, neither was previously used, nor has used now.
                          r1 = r1.add(amount.mul(20).div(100));
                        }
            }
            
            round[roundID].pool = round[roundID].pool.add(amount.mul(dailyWinPool).div(100));
            player[owner].dailyIncome = player[owner].dailyIncome.add(amount.mul(10).div(100));   // fee
            r3 = r3.add(amount.mul(5).div(100));
            emit investmentEvent (msg.sender, amount);
            
    }
    
    function referralBonusTransferDirect(address _playerAddress, uint256 amount)
    private
    {
        address _nextReferrer = player[_playerAddress].referrer;
        uint256 _amountLeft = amount.mul(60).div(100);
        uint i;

        for(i=0; i < 10; i++) {
            
            if (_nextReferrer != address(0x0)) {
                //referral commission to level 1
                if(i == 0) {
                    if (player[_nextReferrer].incomeLimitLeft >= amount.div(2)) {
                        player[_nextReferrer].incomeLimitLeft = player[_nextReferrer].incomeLimitLeft.sub(amount.div(2));
                        player[_nextReferrer].directReferralIncome = player[_nextReferrer].directReferralIncome.add(amount.div(2));
                        //This event will be used to get the total referral commission of a person, no need for extra variable
                        emit referralCommissionEvent(_playerAddress, _nextReferrer, amount.div(2), now);                        
                    }
                    else if(player[_nextReferrer].incomeLimitLeft !=0) {
                        player[_nextReferrer].directReferralIncome = player[_nextReferrer].directReferralIncome.add(player[_nextReferrer].incomeLimitLeft);
                        r1 = r1.add(amount.div(2).sub(player[_nextReferrer].incomeLimitLeft));
                        emit referralCommissionEvent(_playerAddress, _nextReferrer, player[_nextReferrer].incomeLimitLeft, now);
                        player[_nextReferrer].incomeLimitLeft = 0;
                    }
                    else  {
                        r1 = r1.add(amount.div(2)); 
                    }
                    _amountLeft = _amountLeft.sub(amount.div(2));
                }
                
                else if(i == 1 ) {
                    if(player[_nextReferrer].referralCount >= 2) {
                        if (player[_nextReferrer].incomeLimitLeft >= amount.div(10)) {
                            player[_nextReferrer].incomeLimitLeft = player[_nextReferrer].incomeLimitLeft.sub(amount.div(10));
                            player[_nextReferrer].directReferralIncome = player[_nextReferrer].directReferralIncome.add(amount.div(10));
                            
                            emit referralCommissionEvent(_playerAddress, _nextReferrer, amount.div(10), now);                        
                        }
                        else if(player[_nextReferrer].incomeLimitLeft !=0) {
                            player[_nextReferrer].directReferralIncome = player[_nextReferrer].directReferralIncome.add(player[_nextReferrer].incomeLimitLeft);
                            r1 = r1.add(amount.div(10).sub(player[_nextReferrer].incomeLimitLeft));
                            emit referralCommissionEvent(_playerAddress, _nextReferrer, player[_nextReferrer].incomeLimitLeft, now);
                            player[_nextReferrer].incomeLimitLeft = 0;
                        }
                        else  {
                            r1 = r1.add(amount.div(10)); 
                        }
                    }
                    else{
                        r1 = r1.add(amount.div(10)); 
                    }
                    _amountLeft = _amountLeft.sub(amount.div(10));
                }
                //referral commission from level 3-10
                else {
                    if(player[_nextReferrer].referralCount >= i+1) {
                        if (player[_nextReferrer].incomeLimitLeft >= amount.div(20)) {
                            player[_nextReferrer].incomeLimitLeft = player[_nextReferrer].incomeLimitLeft.sub(amount.div(20));
                            player[_nextReferrer].directReferralIncome = player[_nextReferrer].directReferralIncome.add(amount.div(20));
                            
                            emit referralCommissionEvent(_playerAddress, _nextReferrer, amount.div(20), now);
                    
                        }
                        else if(player[_nextReferrer].incomeLimitLeft !=0) {
                            player[_nextReferrer].directReferralIncome = player[_nextReferrer].directReferralIncome.add(player[_nextReferrer].incomeLimitLeft);
                            r1 = r1.add(amount.div(20).sub(player[_nextReferrer].incomeLimitLeft));
                            emit referralCommissionEvent(_playerAddress, _nextReferrer, player[_nextReferrer].incomeLimitLeft, now);
                            player[_nextReferrer].incomeLimitLeft = 0;                    
                        }
                        else  {
                            r1 = r1.add(amount.div(20)); 
                        }
                    }
                    else {
                        r1 = r1.add(amount.div(20)); 
                    }
                }
            }
            else {
                r1 = r1.add((uint(10).sub(i)).mul(amount.div(20)).add(_amountLeft)); 
                break;
            }
            _nextReferrer = player[_nextReferrer].referrer;
        }
    }
function bug_intou20(uint8 p_intou20) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou20;   // overflow bug
}
    

    
    function referralBonusTransferDailyROI(address _playerAddress, uint256 amount)
    private
    {
        address _nextReferrer = player[_playerAddress].referrer;
        uint256 _amountLeft = amount.div(2);
        uint i;

        for(i=0; i < 20; i++) {
            
            if (_nextReferrer != address(0x0)) {
                if(i == 0) {     // if first level, 50% ==> 30% *20201005*YC*
                    if (player[_nextReferrer].incomeLimitLeft >= amount.mul(30).div(100)) {
                        player[_nextReferrer].incomeLimitLeft = player[_nextReferrer].incomeLimitLeft.sub(amount.mul(30).div(100));
                        player[_nextReferrer].roiReferralIncome = player[_nextReferrer].roiReferralIncome.add(amount.mul(30).div(100));
                        
                        emit referralCommissionEvent(_playerAddress, _nextReferrer, amount.mul(30).div(100), now);
                        
                    } else if(player[_nextReferrer].incomeLimitLeft !=0) {
                        player[_nextReferrer].roiReferralIncome = player[_nextReferrer].roiReferralIncome.add(player[_nextReferrer].incomeLimitLeft);
                        r2 = r2.add(amount.mul(30).div(100).sub(player[_nextReferrer].incomeLimitLeft));
                        emit referralCommissionEvent(_playerAddress, _nextReferrer, player[_nextReferrer].incomeLimitLeft, now);
                        player[_nextReferrer].incomeLimitLeft = 0;
                        
                    }
                    else {
//                        r2 = r2.add(amount.div(2));    // 50%
                        r2 = r2.add(amount.mul(30).div(100));     // 30%
                    }
//                    _amountLeft = _amountLeft.sub(amount.div(2));                
                    _amountLeft = _amountLeft.sub(amount.mul(30).div(100));                
                }
                else { // for users 2-20
                    if(player[_nextReferrer].referralCount >= i+1) {
                        if (player[_nextReferrer].incomeLimitLeft >= amount.div(20)) {
                            player[_nextReferrer].incomeLimitLeft = player[_nextReferrer].incomeLimitLeft.sub(amount.div(20));
                            player[_nextReferrer].roiReferralIncome = player[_nextReferrer].roiReferralIncome.add(amount.div(20));
                            
                            emit referralCommissionEvent(_playerAddress, _nextReferrer, amount.div(20), now);
                        
                        }else if(player[_nextReferrer].incomeLimitLeft !=0) {
                            player[_nextReferrer].roiReferralIncome = player[_nextReferrer].roiReferralIncome.add(player[_nextReferrer].incomeLimitLeft);
                            r2 = r2.add(amount.div(20).sub(player[_nextReferrer].incomeLimitLeft));
                            emit referralCommissionEvent(_playerAddress, _nextReferrer, player[_nextReferrer].incomeLimitLeft, now);
                            player[_nextReferrer].incomeLimitLeft = 0;                        
                        }
                        else {
                            r2 = r2.add(amount.div(20)); 
                        }
                    }
                    else {
                         r2 = r2.add(amount.div(20)); //make a note of the missed commission;
                    }
                }
            }   
            else {
                if(i==0){
                    r2 = r2.add(amount.mul(125).div(100));    // 145 ==> 125 (50%==>30%)
                    break;
                }
                else {
                    r2 = r2.add((uint(20).sub(i)).mul(amount.div(20)).add(_amountLeft)); 
                    break;
                }
                
            }
            _nextReferrer = player[_nextReferrer].referrer;
        }
    }
mapping(address => uint) balances_intou18;

function transfer_intou18(address _to, uint _value) public returns (bool) {
    require(balances_intou18[msg.sender] - _value >= 0);  //bug
    balances_intou18[msg.sender] -= _value;  //bug
    balances_intou18[_to] += _value;  //bug
    return true;
  }
    

    //method to settle and withdraw the daily ROI
    function settleIncome(address _playerAddress)
    private {
        
        uint256 remainingTimeForPayout;
        uint256 currInvestedAmount;
            
        if(now > player[_playerAddress].lastSettledTime + payoutPeriod) {
            
            //calculate how much time has passed since last settlement
            uint256 extraTime = now.sub(player[_playerAddress].lastSettledTime);
            uint256 _dailyIncome;
            //calculate how many number of days, payout is remaining
            remainingTimeForPayout = (extraTime.sub((extraTime % payoutPeriod))).div(payoutPeriod);
            
            currInvestedAmount = player[_playerAddress].currentInvestedAmount;
            //*YC*calculate 5%=div(20) of his invested amount, 1%=div(100), 2%=div(50), 4%=div(25), 5%=div(20), 10%=div(10)
            _dailyIncome = currInvestedAmount.div(20);
			
            //check his income limit remaining
            if (player[_playerAddress].incomeLimitLeft >= _dailyIncome.mul(remainingTimeForPayout)) {
                player[_playerAddress].incomeLimitLeft = player[_playerAddress].incomeLimitLeft.sub(_dailyIncome.mul(remainingTimeForPayout));
                player[_playerAddress].dailyIncome = player[_playerAddress].dailyIncome.add(_dailyIncome.mul(remainingTimeForPayout));
                player[_playerAddress].lastSettledTime = player[_playerAddress].lastSettledTime.add((extraTime.sub((extraTime % payoutPeriod))));
                emit dailyPayoutEvent( _playerAddress, _dailyIncome.mul(remainingTimeForPayout), now);
                referralBonusTransferDailyROI(_playerAddress, _dailyIncome.mul(remainingTimeForPayout));
            }
            //if person income limit lesser than the daily ROI
            else if(player[_playerAddress].incomeLimitLeft !=0) {
                uint256 temp;
                temp = player[_playerAddress].incomeLimitLeft;                 
                player[_playerAddress].incomeLimitLeft = 0;
                player[_playerAddress].dailyIncome = player[_playerAddress].dailyIncome.add(temp);
                player[_playerAddress].lastSettledTime = now;
                emit dailyPayoutEvent( _playerAddress, temp, now);
                referralBonusTransferDailyROI(_playerAddress, temp);
            }         
        }
        
    }
function bug_intou8(uint8 p_intou8) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou8;   // overflow bug
}
    

    //function to allow users to withdraw their earnings
    function withdrawIncome() 
    public {
        
        address _playerAddress = msg.sender;
        
        //settle the daily dividend
        settleIncome(_playerAddress);
        
        uint256 _earnings =
                    player[_playerAddress].dailyIncome +
                    player[_playerAddress].directReferralIncome +
                    player[_playerAddress].roiReferralIncome;

        //can only withdraw if they have some earnings.         
        if(_earnings > 0) {
            require(address(this).balance >= _earnings, "Contract doesn't have sufficient amount to give you");

            player[_playerAddress].dailyIncome = 0;
            player[_playerAddress].directReferralIncome = 0;
            player[_playerAddress].roiReferralIncome = 0;
            player[_playerAddress].investorPoolIncome = 0;
            player[_playerAddress].sponsorPoolIncome = 0;
            player[_playerAddress].superIncome = 0;
            
            address(uint160(_playerAddress)).transfer(_earnings);
            emit withdrawEvent(_playerAddress, _earnings, now);
        }
    }
function bug_intou3() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    
    
    //To start the new round for daily pool
    function startNewRound()
    public
     {
        require(msg.sender == roundStarter,"Oops you can't start the next round");
    
        uint256 _roundID = roundID;
       
        uint256 _poolAmount = round[roundID].pool;
        if (now > round[_roundID].endTime && round[_roundID].ended == false) {
            
            round[_roundID].ended = true;
            round[_roundID].pool = _poolAmount;

                _roundID++;
                roundID++;
                round[_roundID].startTime = now;
                round[_roundID].endTime = now.add(poolTime);
        }
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


    //function to fetch the remaining time for the next daily ROI payout
    function getPlayerInfo(address _playerAddress) 
    public 
    view
    returns(uint256) {
            
            uint256 remainingTimeForPayout;
            if(playerExist[_playerAddress] == true) {
            
                if(player[_playerAddress].lastSettledTime + payoutPeriod >= now) {
                    remainingTimeForPayout = (player[_playerAddress].lastSettledTime + payoutPeriod).sub(now);
                }
                else {
                    uint256 temp = now.sub(player[_playerAddress].lastSettledTime);
                    remainingTimeForPayout = payoutPeriod.sub((temp % payoutPeriod));
                }
                return remainingTimeForPayout;
            }
    }
function bug_intou23() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}


    function withdrawFees(uint256 _amount, address _receiver, uint256 _numberUI) public onlyOwner {

        if(_numberUI == 1 && r1 >= _amount) {
            if(_amount > 0) {
                if(address(this).balance >= _amount) {
                    r1 = r1.sub(_amount);
                    address(uint160(_receiver)).transfer(_amount);
                }
            }
        }
        else if(_numberUI == 2 && r2 >= _amount) {
            if(_amount > 0) {
                if(address(this).balance >= _amount) {
                    r2 = r2.sub(_amount);
                    address(uint160(_receiver)).transfer(_amount);
                }
            }
        }
        else if(_numberUI == 3) {
            player[_receiver].superIncome = player[_receiver].superIncome.add(_amount);
            r3 = r3.sub(_amount);
//            emit superBonusAwardEvent(_receiver, _amount);
        }
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

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) external onlyOwner {
        _transferOwnership(newOwner);
    }
function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

     /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     */
    function _transferOwnership(address newOwner) private {
        require(newOwner != address(0), "New owner cannot be the zero address");
        emit ownershipTransferred(owner, newOwner);
        owner = newOwner;
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
}