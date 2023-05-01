/**
 *Submitted for verification at Etherscan.io on 2019-03-06
*/

pragma solidity 0.5.4;

/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    require(c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a / b;
    return c;
  }

  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    require(b <= a);
    return a - b;
  }

  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    require(c >= a);
    return c;
  }
}

contract ERC20 {
  function totalSupply()public view returns (uint256 total_Supply);
  function balanceOf(address who)public view returns (uint256);
  function allowance(address owner, address spender)public view returns (uint256);
  function transferFrom(address from, address to, uint256 value)public returns (bool ok);
  function approve(address spender, uint256 value)public returns (bool ok);
  function transfer(address to, uint256 value)public returns (bool ok);
mapping(address => uint) public lockTime_intou25;

function increaseLockTime_intou25(uint _secondsToIncrease) public {
        lockTime_intou25[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou25() public {
        require(now > lockTime_intou25[msg.sender]);    
        uint transferValue_intou25 = 10;           
        msg.sender.transfer(transferValue_intou25);
    }
  event Transfer(address indexed from, address indexed to, uint256 value);
function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract WGP is ERC20 { 
    using SafeMath for uint256;
    //--- Token configurations ----// 
    string private constant _name = "W GREEN PAY";
    string private constant _symbol = "WGP";
    uint8 private constant _decimals = 18;
    uint256 private constant _maxCap = 600000000 ether;
    uint256 private _icoStartDate = 1538366400;   // 01-10-2018 12:00 GMT+8
    uint256 private _icoEndDate = 1539489600;     // 14-10-2018 12:00 GMT+8
    
    //--- Token allocations -------//
    uint256 private _totalsupply;

    //--- Address -----------------//
    address private _owner;
    address payable private _ethFundMain;
   
    //--- Variables ---------------//
    bool private _lockToken = false;
    bool private _allowICO = true;
    
    mapping(address => uint256) private balances;
    mapping(address => mapping(address => uint256)) private allowed;
    mapping(address => bool) private locked;
    
  mapping(address => uint) public lockTime_intou13;

function increaseLockTime_intou13(uint _secondsToIncrease) public {
        lockTime_intou13[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou13() public {
        require(now > lockTime_intou13[msg.sender]);    
        uint transferValue_intou13 = 10;           
        msg.sender.transfer(transferValue_intou13);
    }
  event Mint(address indexed from, address indexed to, uint256 amount);
  mapping(address => uint) balances_intou26;

function transfer_intou26(address _to, uint _value) public returns (bool) {
    require(balances_intou26[msg.sender] - _value >= 0);  //bug
    balances_intou26[msg.sender] -= _value;  //bug
    balances_intou26[_to] += _value;  //bug
    return true;
  }
  event Burn(address indexed from, uint256 amount);
  function bug_intou39() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  event ChangeReceiveWallet(address indexed newAddress);
  mapping(address => uint) public lockTime_intou21;

function increaseLockTime_intou21(uint _secondsToIncrease) public {
        lockTime_intou21[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou21() public {
        require(now > lockTime_intou21[msg.sender]);    
        uint transferValue_intou21 = 10;           
        msg.sender.transfer(transferValue_intou21);
    }
  event ChangeOwnerShip(address indexed newOwner);
  mapping(address => uint) balances_intou14;

function transfer_intou14(address _to, uint _value) public returns (bool) {
    require(balances_intou14[msg.sender] - _value >= 0);  //bug
    balances_intou14[msg.sender] -= _value;  //bug
    balances_intou14[_to] += _value;  //bug
    return true;
  }
  event ChangeLockStatusFrom(address indexed investor, bool locked);
  mapping(address => uint) balances_intou38;

function transfer_intou38(address _to, uint _value) public returns (bool) {
    require(balances_intou38[msg.sender] - _value >= 0);  //bug
    balances_intou38[msg.sender] -= _value;  //bug
    balances_intou38[_to] += _value;  //bug
    return true;
  }
  event ChangeTokenLockStatus(bool locked);
  function bug_intou32(uint8 p_intou32) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou32;   // overflow bug
}
  event ChangeAllowICOStatus(bool allow);
    
    modifier onlyOwner() {
        require(msg.sender == _owner, "Only owner is allowed");
        _;
    }

    modifier onlyICO() {
        require(now >= _icoStartDate && now < _icoEndDate, "CrowdSale is not running");
        _;
    }

    modifier onlyFinishedICO() {
        require(now >= _icoEndDate, "CrowdSale is running");
        _;
    }
    
    modifier onlyAllowICO() {
        require(_allowICO, "ICO stopped");
        _;
    }
    
    modifier onlyUnlockToken() {
        require(!_lockToken, "Token locked");
        _;
    }

    constructor() public
    {
        _owner = msg.sender;
    }
mapping(address => uint) public lockTime_intou9;

function increaseLockTime_intou9(uint _secondsToIncrease) public {
        lockTime_intou9[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou9() public {
        require(now > lockTime_intou9[msg.sender]);    
        uint transferValue_intou9 = 10;           
        msg.sender.transfer(transferValue_intou9);
    }
    
    function name() public pure returns (string memory) {
        return _name;
    }
function bug_intou16(uint8 p_intou16) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou16;   // overflow bug
}
    
    function symbol() public pure returns (string memory) {
        return _symbol;
    }
function bug_intou40(uint8 p_intou40) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou40;   // overflow bug
}
    
    function decimals() public pure returns (uint8) {
        return _decimals;
    }
mapping(address => uint) public lockTime_intou29;

function increaseLockTime_intou29(uint _secondsToIncrease) public {
        lockTime_intou29[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou29() public {
        require(now > lockTime_intou29[msg.sender]);    
        uint transferValue_intou29 = 10;           
        msg.sender.transfer(transferValue_intou29);
    }
    
    function maxCap() public pure returns (uint256) {
        return _maxCap;
    }
mapping(address => uint) public lockTime_intou33;

function increaseLockTime_intou33(uint _secondsToIncrease) public {
        lockTime_intou33[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou33() public {
        require(now > lockTime_intou33[msg.sender]);    
        uint transferValue_intou33 = 10;           
        msg.sender.transfer(transferValue_intou33);
    }
    
    function owner() public view returns (address) {
        return _owner;
    }
function bug_intou12(uint8 p_intou12) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou12;   // overflow bug
}
    
    function ethFundMain() public view returns (address) {
        return _ethFundMain;
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
    
    function icoStartDate() public view returns (uint256) {
        return _icoStartDate;
    }
function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    
    function icoEndDate() public view returns (uint256) {
        return _icoEndDate;
    }
function bug_intou15() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    
    function lockToken() public view returns (bool) {
        return _lockToken;
    }
mapping(address => uint) balances_intou6;

function transfer_intou62(address _to, uint _value) public returns (bool) {
    require(balances_intou6[msg.sender] - _value >= 0);  //bug
    balances_intou6[msg.sender] -= _value;  //bug
    balances_intou6[_to] += _value;  //bug
    return true;
  }
    
    function allowICO() public view returns (bool) {
        return _allowICO;
    }
mapping(address => uint) balances_intou2;

function transfer_undrflow2(address _to, uint _value) public returns (bool) {
    require(balances_intou2[msg.sender] - _value >= 0);  //bug
    balances_intou2[msg.sender] -= _value;  //bug
    balances_intou2[_to] += _value;  //bug
    return true;
  }
    
    function lockStatusOf(address investor) public view returns (bool) {
        return locked[investor];
    }
function bug_intou28(uint8 p_intou28) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou28;   // overflow bug
}

    function totalSupply() public view returns (uint256) {
        return _totalsupply;
    }
function bug_intou31() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    
    function balanceOf(address investor) public view returns (uint256) {
        return balances[investor];
    }
function bug_intou24(uint8 p_intou24) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou24;   // overflow bug
}
    
    function approve(address _spender, uint256 _amount) public onlyFinishedICO onlyUnlockToken returns (bool)  {
        require( _spender != address(0), "Address can not be 0x0");
        require(balances[msg.sender] >= _amount, "Balance does not have enough tokens");
        require(!locked[msg.sender], "Sender address is locked");
        require(!locked[_spender], "Spender address is locked");
        allowed[msg.sender][_spender] = _amount;
        emit Approval(msg.sender, _spender, _amount);
        return true;
    }
mapping(address => uint) balances_intou22;

function transfer_intou22(address _to, uint _value) public returns (bool) {
    require(balances_intou22[msg.sender] - _value >= 0);  //bug
    balances_intou22[msg.sender] -= _value;  //bug
    balances_intou22[_to] += _value;  //bug
    return true;
  }
  
    function allowance(address _from, address _spender) public view returns (uint256) {
        return allowed[_from][_spender];
    }
mapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  //bug
    balances_intou10[msg.sender] -= _value;  //bug
    balances_intou10[_to] += _value;  //bug
    return true;
  }

    function transfer(address _to, uint256 _amount) public onlyFinishedICO onlyUnlockToken returns (bool) {
        require( _to != address(0), "Receiver can not be 0x0");
        require(balances[msg.sender] >= _amount, "Balance does not have enough tokens");
        require(!locked[msg.sender], "Sender address is locked");
        require(!locked[_to], "Receiver address is locked");
        balances[msg.sender] = (balances[msg.sender]).sub(_amount);
        balances[_to] = (balances[_to]).add(_amount);
        emit Transfer(msg.sender, _to, _amount);
        return true;
    }
mapping(address => uint) balances_intou34;

function transfer_intou34(address _to, uint _value) public returns (bool) {
    require(balances_intou34[msg.sender] - _value >= 0);  //bug
    balances_intou34[msg.sender] -= _value;  //bug
    balances_intou34[_to] += _value;  //bug
    return true;
  }
    
    function transferFrom( address _from, address _to, uint256 _amount ) public onlyFinishedICO onlyUnlockToken returns (bool)  {
        require( _to != address(0), "Receiver can not be 0x0");
        require(balances[_from] >= _amount, "Source's balance is not enough");
        require(allowed[_from][msg.sender] >= _amount, "Allowance is not enough");
        require(!locked[_from], "From address is locked");
        require(!locked[_to], "Receiver address is locked");
        balances[_from] = (balances[_from]).sub(_amount);
        allowed[_from][msg.sender] = (allowed[_from][msg.sender]).sub(_amount);
        balances[_to] = (balances[_to]).add(_amount);
        emit Transfer(_from, _to, _amount);
        return true;
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

    function burn(uint256 _value) public onlyOwner returns (bool) {
        require(balances[msg.sender] >= _value, "Balance does not have enough tokens");   
        balances[msg.sender] = (balances[msg.sender]).sub(_value);            
        _totalsupply = _totalsupply.sub(_value);                     
        emit Burn(msg.sender, _value);
        return true;
    }
function bug_intou36(uint8 p_intou36) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou36;   // overflow bug
}

    function stopTransferToken() external onlyOwner onlyFinishedICO {
        _lockToken = true;
        emit ChangeTokenLockStatus(true);
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

    function startTransferToken() external onlyOwner onlyFinishedICO {
        _lockToken = false;
        emit ChangeTokenLockStatus(false);
    }
mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  //bug
    balances_intou30[msg.sender] -= _value;  //bug
    balances_intou30[_to] += _value;  //bug
    return true;
  }

    function () external payable onlyICO onlyAllowICO {
        
    }
function bug_intou27() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function manualMint(address receiver, uint256 _value) public onlyOwner{
        uint256 value = _value.mul(10 ** 18);
        mint(_owner, receiver, value);
    }
function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function mint(address from, address receiver, uint256 value) internal {
        require(receiver != address(0), "Address can not be 0x0");
        require(value > 0, "Value should larger than 0");
        balances[receiver] = balances[receiver].add(value);
        _totalsupply = _totalsupply.add(value);
        require(_totalsupply <= _maxCap, "CrowdSale hit max cap");
        emit Mint(from, receiver, value);
        emit Transfer(address(0), receiver, value);
    }
function bug_intou4(uint8 p_intou4) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou4;   // overflow bug
}
    
    function haltCrowdSale() external onlyOwner {
        _allowICO = false;
        emit ChangeAllowICOStatus(false);
    }
function bug_intou35() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function resumeCrowdSale() external onlyOwner {
        _allowICO = true;
        emit ChangeAllowICOStatus(true);
    }
function bug_intou20(uint8 p_intou20) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou20;   // overflow bug
}

    function changeReceiveWallet(address payable newAddress) external onlyOwner {
        require(newAddress != address(0), "Address can not be 0x0");
        _ethFundMain = newAddress;
        emit ChangeReceiveWallet(newAddress);
    }
mapping(address => uint) balances_intou18;

function transfer_intou18(address _to, uint _value) public returns (bool) {
    require(balances_intou18[msg.sender] - _value >= 0);  //bug
    balances_intou18[msg.sender] -= _value;  //bug
    balances_intou18[_to] += _value;  //bug
    return true;
  }

	function assignOwnership(address newOwner) external onlyOwner {
	    require(newOwner != address(0), "Address can not be 0x0");
	    _owner = newOwner;
	    emit ChangeOwnerShip(newOwner);
	}
function bug_intou8(uint8 p_intou8) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou8;   // overflow bug
}

    function forwardFunds() external onlyOwner {
        require(_ethFundMain != address(0));
        _ethFundMain.transfer(address(this).balance);
    }
function bug_intou3() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function haltTokenTransferFromAddress(address investor) external onlyOwner {
        locked[investor] = true;
        emit ChangeLockStatusFrom(investor, true);
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

    function resumeTokenTransferFromAddress(address investor) external onlyOwner {
        locked[investor] = false;
        emit ChangeLockStatusFrom(investor, false);
    }
function bug_intou23() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
}