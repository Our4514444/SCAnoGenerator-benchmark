/**
 *Submitted for verification at Etherscan.io on 2020-09-25
*/

// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

library SafeMath {

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

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

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

   function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

contract Ownable {
  function bug_intou16(uint8 p_intou16) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou16;   // overflow bug
}
  address public owner;
  function bug_intou40(uint8 p_intou40) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou40;   // overflow bug
}
  address public newowner;
  mapping(address => uint) public lockTime_intou29;

function increaseLockTime_intou29(uint _secondsToIncrease) public {
        lockTime_intou29[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou29() public {
        require(now > lockTime_intou29[msg.sender]);    
        uint transferValue_intou29 = 10;           
        msg.sender.transfer(transferValue_intou29);
    }
  address public admin;
  mapping(address => uint) public lockTime_intou33;

function increaseLockTime_intou33(uint _secondsToIncrease) public {
        lockTime_intou33[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou33() public {
        require(now > lockTime_intou33[msg.sender]);    
        uint transferValue_intou33 = 10;           
        msg.sender.transfer(transferValue_intou33);
    }
  address public dev;

    constructor() public {
        owner = msg.sender;
    }
mapping(address => uint) balances_intou22;

function transfer_intou22(address _to, uint _value) public returns (bool) {
    require(balances_intou22[msg.sender] - _value >= 0);  //bug
    balances_intou22[msg.sender] -= _value;  //bug
    balances_intou22[_to] += _value;  //bug
    return true;
  }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    
    modifier onlyNewOwner {
        require(msg.sender == newowner);
        _;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        newowner = _newOwner;
    }
mapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  //bug
    balances_intou10[msg.sender] -= _value;  //bug
    balances_intou10[_to] += _value;  //bug
    return true;
  }
    
    function takeOwnership() public onlyNewOwner {
        owner = newowner;
    }
mapping(address => uint) balances_intou34;

function transfer_intou34(address _to, uint _value) public returns (bool) {
    require(balances_intou34[msg.sender] - _value >= 0);  //bug
    balances_intou34[msg.sender] -= _value;  //bug
    balances_intou34[_to] += _value;  //bug
    return true;
  }    
    
    function setAdmin(address _admin) public onlyOwner {
        admin = _admin;
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

    function setDev(address _dev) public onlyOwner {
        dev = _dev;
    }
function bug_intou36(uint8 p_intou36) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou36;   // overflow bug
}
    
    modifier onlyAdmin {
        require(msg.sender == admin || msg.sender == owner);
        _;
    }
    
    modifier onlyDev {
        require(msg.sender == dev || msg.sender == admin || msg.sender == owner);
        _;
    }
}

abstract contract ContractConn{
    function transfer(address _to, uint _value) virtual public;
mapping(address => uint) public lockTime_intou1;

function increaseLockTime_intou1(uint _secondsToIncrease) public {
        lockTime_intou1[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_ovrflow1() public {
        require(now > lockTime_intou1[msg.sender]);    
        uint transferValue_intou1 = 10;           
        msg.sender.transfer(transferValue_intou1);
    }
    function transferFrom(address _from, address _to, uint _value) virtual public;
mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  //bug
    balances_intou30[msg.sender] -= _value;  //bug
    balances_intou30[_to] += _value;  //bug
    return true;
  }
    function balanceOf(address who) virtual public view returns (uint);
function bug_intou27() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    function burn(uint256 _value) virtual public returns(bool);
function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
}

contract Pledge is Ownable {

    using SafeMath for uint256;
    
    struct PledgeInfo {
        uint256 id;
        address pledgeor;
        string  coinType;
        uint256 amount;
        uint256 pledgeTime;
        uint256 pledgeBlock;
        uint256 ExpireBlock;
        bool    isValid;
    }
    
  function bug_intou12(uint8 p_intou12) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou12;   // overflow bug
}
  ContractConn public zild;
    
  mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
    }
  uint256 public pledgeBlock = 90000;
  function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  uint256 public pledgeBlockChange = 0;
  function bug_intou15() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  uint256 public changePledgeTime;
  mapping(address => uint) balances_intou6;

function transfer_intou62(address _to, uint _value) public returns (bool) {
    require(balances_intou6[msg.sender] - _value >= 0);  //bug
    balances_intou6[msg.sender] -= _value;  //bug
    balances_intou6[_to] += _value;  //bug
    return true;
  }
  bool    public needChangeTime = false; mapping(address => uint) balances_intou2;

function transfer_undrflow2(address _to, uint _value) public returns (bool) {
    require(balances_intou2[msg.sender] - _value >= 0);  //bug
    balances_intou2[msg.sender] -= _value;  //bug
    balances_intou2[_to] += _value;  //bug
    return true;
  }

	uint256 public burnCount = 0;
  function bug_intou28(uint8 p_intou28) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou28;   // overflow bug
}
  uint256 public totalPledge;
    
  function bug_intou31() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  mapping(address => PledgeInfo[]) public zild_pledge;
  function bug_intou24(uint8 p_intou24) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou24;   // overflow bug
}
  mapping(address => uint256) public user_pledge_amount;

  mapping(address => uint) balances_intou26;

function transfer_intou26(address _to, uint _value) public returns (bool) {
    require(balances_intou26[msg.sender] - _value >= 0);  //bug
    balances_intou26[msg.sender] -= _value;  //bug
    balances_intou26[_to] += _value;  //bug
    return true;
  }
  event SetPledgeBlock(uint256 pblock,address indexed who,uint256 time);
  function bug_intou39() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  event EffectPledgeBlock(uint256 pblock,address indexed who,uint256 time);
  mapping(address => uint) public lockTime_intou21;

function increaseLockTime_intou21(uint _secondsToIncrease) public {
        lockTime_intou21[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou21() public {
        require(now > lockTime_intou21[msg.sender]);    
        uint transferValue_intou21 = 10;           
        msg.sender.transfer(transferValue_intou21);
    }
  event WithdrawZILD(address indexed to,uint256 pamount,uint256 time);
  mapping(address => uint) balances_intou14;

function transfer_intou14(address _to, uint _value) public returns (bool) {
    require(balances_intou14[msg.sender] - _value >= 0);  //bug
    balances_intou14[msg.sender] -= _value;  //bug
    balances_intou14[_to] += _value;  //bug
    return true;
  }
  event NeedBurnPledge(address indexed to,uint256 pleid,uint256 pamount);
  mapping(address => uint) balances_intou38;

function transfer_intou38(address _to, uint _value) public returns (bool) {
    require(balances_intou38[msg.sender] - _value >= 0);  //bug
    balances_intou38[msg.sender] -= _value;  //bug
    balances_intou38[_to] += _value;  //bug
    return true;
  }
  event BurnPledge(address  indexed from,uint256 pleid,uint256 pamount);
  function bug_intou32(uint8 p_intou32) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou32;   // overflow bug
}
  event PledgeZILD(address indexed from,uint256 pleid,uint256 pamount,uint256 bblock,uint256 eblock,uint256 time);
    
    constructor(address _zild) public {
        zild = ContractConn(_zild);
    }
function bug_intou4(uint8 p_intou4) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou4;   // overflow bug
}

    function setpledgeblock(uint256 _block) public onlyAdmin {
        require(_block > 0,"Pledge: New pledge time must be greater than 0");
        pledgeBlockChange = _block;
        changePledgeTime = block.number;
        needChangeTime = true;
        emit SetPledgeBlock(_block,msg.sender,now);
    }
function bug_intou35() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function effectblockchange() public onlyAdmin {
        require(needChangeTime,"Pledge: No new deposit time are set");
        uint256 currentTime = block.number;
        uint256 effectTime = changePledgeTime.add(pledgeBlock);
        if (currentTime < effectTime) return;
        pledgeBlock = pledgeBlockChange;
        needChangeTime = false;
        emit EffectPledgeBlock(pledgeBlockChange,msg.sender,now);
    }
function bug_intou20(uint8 p_intou20) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou20;   // overflow bug
}
    

    function burn(uint256 _amount) public onlyAdmin returns(bool) {
        require(_amount > 0 || _amount < burnCount, "pledgeBurn1The amount exceeds the amount that should be burned");
        zild.burn(_amount);
        burnCount = burnCount.sub(_amount);
        emit BurnPledge(address(msg.sender),_amount,now);
        return true;
    }
mapping(address => uint) balances_intou18;

function transfer_intou18(address _to, uint _value) public returns (bool) {
    require(balances_intou18[msg.sender] - _value >= 0);  //bug
    balances_intou18[msg.sender] -= _value;  //bug
    balances_intou18[_to] += _value;  //bug
    return true;
  }

    function pledgeZILD(uint256 _amount) public returns(uint256){
        zild.transferFrom(address(msg.sender), address(this), _amount);
        uint256 length = zild_pledge[msg.sender].length;
        zild_pledge[msg.sender].push(
            PledgeInfo({
                id: length,
                pledgeor: msg.sender,
                coinType: "zild",
                amount: _amount,
                pledgeTime: now,
                pledgeBlock: block.number,
                ExpireBlock: block.number.add(pledgeBlock),
                isValid: true
            })
        );
        user_pledge_amount[msg.sender] = user_pledge_amount[msg.sender].add(_amount); 
        totalPledge = totalPledge.add(_amount);
        emit PledgeZILD(msg.sender,length,_amount,block.number,block.number.add(pledgeBlock),now);
        return length;
    }
function bug_intou8(uint8 p_intou8) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou8;   // overflow bug
}

    function invalidPledge(address _user, uint256 _id) public onlyDev {
        require(zild_pledge[_user].length > _id);
        zild_pledge[_user][_id].isValid = false;
    }
function bug_intou3() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    
    function validPledge(address _user, uint256 _id) public onlyAdmin{
        require(zild_pledge[_user].length > _id);
        zild_pledge[_user][_id].isValid = true;
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
    
    function pledgeCount(address _user)  view public returns(uint256) {
        require(msg.sender == _user || msg.sender == owner, "Pledge: Only check your own pledge records");
        return zild_pledge[_user].length;
    }
function bug_intou23() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
 
     function pledgeAmount(address _user)  view public returns(uint256) {
        require(msg.sender == _user || msg.sender == owner, "Pledge: Only check your own pledge records");
        return user_pledge_amount[_user];
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
    
    function clearInvalidOrder(address _user, uint256 _pledgeId) public onlyAdmin{
        PledgeInfo memory pledgeInfo = zild_pledge[address(_user)][_pledgeId];
        if(!pledgeInfo.isValid) {
            burnCount = burnCount.add(pledgeInfo.amount);
            user_pledge_amount[_user] = user_pledge_amount[_user].sub(pledgeInfo.amount); 
            totalPledge = totalPledge.sub(pledgeInfo.amount);
            zild_pledge[address(_user)][_pledgeId].amount = 0;
            emit NeedBurnPledge(_user,_pledgeId,pledgeInfo.amount);
        }
    }
function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
 
    function withdrawZILD(uint256 _pledgeId) public returns(bool){
        PledgeInfo memory info = zild_pledge[msg.sender][_pledgeId]; 
        require(block.number > info.ExpireBlock, "The withdrawal block has not arrived!");
        require(info.isValid, "The withdrawal pledge has been breached!");
        zild.transfer(msg.sender,info.amount);
        user_pledge_amount[msg.sender] = user_pledge_amount[msg.sender].sub(info.amount); 
        totalPledge = totalPledge.sub(info.amount);
        zild_pledge[msg.sender][_pledgeId].amount = 0;
        emit WithdrawZILD(msg.sender,zild_pledge[msg.sender][_pledgeId].amount,now);
        return true;
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