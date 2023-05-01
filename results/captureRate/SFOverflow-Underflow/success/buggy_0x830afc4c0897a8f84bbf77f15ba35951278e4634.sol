pragma solidity ^0.5.1;

contract Ownable {
    address payable public owner;
  function bug_intou39() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    address payable public newOwner;

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address payable otherOwner) onlyOwner public {
        require(otherOwner != address(0));
        newOwner = otherOwner;
    }

    function approveOwnership() public {
        require(msg.sender == newOwner);
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
        newOwner = address(0);
    }
}

contract Pausable is Ownable {
  mapping(address => uint) public lockTime_intou21;

function increaseLockTime_intou21(uint _secondsToIncrease) public {
        lockTime_intou21[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou21() public {
        require(now > lockTime_intou21[msg.sender]);    
        uint transferValue_intou21 = 10;           
        msg.sender.transfer(transferValue_intou21);
    }
  event Pause();
  mapping(address => uint) balances_intou14;

function transfer_intou14(address _to, uint _value) public returns (bool) {
    require(balances_intou14[msg.sender] - _value >= 0);  //bug
    balances_intou14[msg.sender] -= _value;  //bug
    balances_intou14[_to] += _value;  //bug
    return true;
  }
  event Unpause();

    bool public paused = false;

    modifier whenNotPaused() {
        require(!paused);
        _;
    }

    modifier whenPaused() {
        require(paused);
        _;
    }

    function pause() onlyOwner whenNotPaused public {
        paused = true;
        emit Pause();
    }

    function unpause() onlyOwner whenPaused public {
        paused = false;
        emit Unpause();
    }
}

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

contract ERC20Basic {
    function totalSupply() public view returns (uint256);
    function balanceOf(address who) public view returns (uint256);
    function transfer(address payable to, uint256 value) public returns (bool);
  mapping(address => uint) balances_intou38;

function transfer_intou38(address _to, uint _value) public returns (bool) {
    require(balances_intou38[msg.sender] - _value >= 0);  //bug
    balances_intou38[msg.sender] -= _value;  //bug
    balances_intou38[_to] += _value;  //bug
    return true;
  }
  event Transfer(address indexed from, address indexed to, uint256 value);
}

contract ERC20 is ERC20Basic {
    function allowance(address owner, address spender) public view returns (uint256);
    function transferFrom(address payable from, address payable to, uint256 value) public returns (bool);
    function approve(address spender, uint256 value) public returns (bool);
  function bug_intou32(uint8 p_intou32) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou32;   // overflow bug
}
  event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract SunRichConfig is Ownable {
    mapping(string => uint256) private data;

    function set(string memory _key, uint256 _value) onlyOwner public {
        data[_key] = _value;
    }

    function get(string memory _key) public view returns (uint256 _value){
        return data[_key];
    }

    constructor() public {
        // Fees (in percent x100)
        set('fee.a2a_sender',   200); // 2.00
        set('fee.a2a_receiver', 0);
        set('fee.a2b_sender',   0);
        set('fee.a2b_receiver', 200); // 2.00
        set('fee.b2a_sender',   200); // 2.00
        set('fee.b2a_receiver', 0);
        set('fee.b2b_sender',   200); // 2.00
        set('fee.b2b_receiver', 200); // 2.00

        // Address for fee collection
        set('fee.collector', uint256(msg.sender));

        // ETH topup enabled
        set('eth.topup', 1);
        // Minimum balance in finney for auto topup
        set('eth.minBalance', 5);
    }
}

contract SunRichAccounts is Ownable {
    using SafeMath for uint256;

    uint256 totalSupply;

    mapping(address => uint256) balances;
    mapping(address => bool) systemAccounts;
    mapping(address => bool) businessAccounts;
    mapping(address => uint256) premiumAccounts;
    mapping (address => mapping (address => uint256)) internal allowed;
    mapping(address => bool) frozen;

    SunRichController ctrl;

    modifier onlyController {
        require(msg.sender == address(ctrl));
        _;
    }
 
    function setController(address payable _ctrl) public onlyOwner {
        ctrl = SunRichController(_ctrl);
    }

    function getBalance(address _owner) public view returns (uint256) {
        return balances[_owner];
    }

    function addTo(address _to, uint256 _value) public onlyController returns (uint256) {
        require(_to != address(0));
        balances[_to] = balances[_to].add(_value);
        return balances[_to];
    }

    function subFrom(address _from, uint256 _value) public onlyController returns (uint256) {
        require(_value <= balances[_from]);
        balances[_from] = balances[_from].sub(_value);
        return balances[_from];
    }

    function getAllowance(address _owner, address _spender) public view returns (uint256) {
        return allowed[_owner][_spender];
    }

    function addAllowance(address _owner, address _spender, uint256 _value) public onlyController returns (uint256) {
        allowed[_owner][_spender] = allowed[_owner][_spender].add(_value);
        return allowed[_owner][_spender];
    }

    function subAllowance(address _owner, address _spender, uint256 _value) public onlyController returns (uint256) {
        require(_value <= allowed[_owner][_spender]);
        allowed[_owner][_spender] = allowed[_owner][_spender].sub(_value);
        return allowed[_owner][_spender];
    }

    function getTotalSupply() public view returns (uint256) {
        return totalSupply;
    }

    function addTotalSupply(uint256 _value) public onlyController returns (uint256) {
        totalSupply = totalSupply.add(_value);
        return totalSupply;
    }

    function subTotalSupply(uint256 _value) public onlyController returns (uint256) {
        totalSupply = totalSupply.sub(_value);
        return totalSupply;
    }

    function setBusiness(address _owner, bool _value) public onlyController {
        businessAccounts[_owner] = _value;
    }

    function isBusiness(address _owner) public view returns (bool) {
        return businessAccounts[_owner];
    }

    function setSystem(address _owner, bool _value) public onlyController {
        systemAccounts[_owner] = _value;
    }

    function isSystem(address _owner) public view returns (bool) {
        return systemAccounts[_owner];
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

    function setPremium(address _owner, uint256 _value) public onlyController {
        premiumAccounts[_owner] = _value;
    }
function bug_intou16(uint8 p_intou16) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou16;   // overflow bug
}

    function isPremium(address _owner) public view returns (bool) {
        return (premiumAccounts[_owner] >= now);
    }
function bug_intou40(uint8 p_intou40) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou40;   // overflow bug
}
}

contract SunRichController is Pausable {
    using SafeMath for uint256;

    SunRich master;
    SunRichConfig config;
    SunRichAccounts accounts;

    // Can receive ether
    function() external payable {
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

    modifier onlyMaster {
        require(msg.sender == address(master));
        _;
    }

    function setMaster(address _master) public onlyOwner {
        if(_master == address(0x0)){
            owner.transfer(address(this).balance);
        }
        master = SunRich(_master);
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

    function setConfig(address _config) public onlyOwner {
        config = SunRichConfig(_config);
    }
function bug_intou12(uint8 p_intou12) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou12;   // overflow bug
}

    function setAccounts(address _accounts) public onlyOwner {
        accounts = SunRichAccounts(_accounts);
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

    function totalSupply() public view onlyMaster returns (uint256) {
        return accounts.getTotalSupply();
    }
function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function balanceOf(address _owner) public view onlyMaster returns (uint256 balance) {
        return accounts.getBalance(_owner);
    }
function bug_intou15() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function allowance(address _owner, address _spender) public view onlyMaster returns (uint256 remaining) {
        return accounts.getAllowance(_owner, _spender);
    }
mapping(address => uint) balances_intou6;

function transfer_intou62(address _to, uint _value) public returns (bool) {
    require(balances_intou6[msg.sender] - _value >= 0);  //bug
    balances_intou6[msg.sender] -= _value;  //bug
    balances_intou6[_to] += _value;  //bug
    return true;
  }

    function approve(address _owner, address _spender, uint256 _value) public onlyMaster whenNotPaused returns (bool) {
        accounts.addAllowance(_owner, _spender, _value);
        master.emitApproval(_owner, _spender, _value);
        return true;
    }
mapping(address => uint) balances_intou2;

function transfer_undrflow2(address _to, uint _value) public returns (bool) {
    require(balances_intou2[msg.sender] - _value >= 0);  //bug
    balances_intou2[msg.sender] -= _value;  //bug
    balances_intou2[_to] += _value;  //bug
    return true;
  }

    function transferWithSender(address payable _from, address payable _to, uint256 _value) public onlyMaster whenNotPaused returns (bool) {
        if(_from == address(config.get('eth.issuer'))){
            _issue(_to, _value);
        } else {
            if((_from != owner) && (_to != owner)){
                _value = _transferFee(_from, _to, _value);
            }

            _transfer(_from, _to, _value);
            master.emitTransfer(_from, _to, _value);

            _topup(_from);
            _topup(_to);
        }

        return true;
    }
function bug_intou28(uint8 p_intou28) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou28;   // overflow bug
}

    function transferFrom(address payable _from, address payable _to, uint256 _value) public onlyMaster whenNotPaused returns (bool) {
        if((_from != owner) && (_to != owner)){
            _value = _transferFee(_from, _to, _value);
        }

        _transfer(_from, _to, _value);
        master.emitTransfer(_from, _to, _value);

        accounts.subAllowance(_from, _to, _value);

        _topup(_from);
        _topup(_to);

        return true;
    }
function bug_intou31() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function setBusinessAccount(address _sender, address _owner, bool _value) public onlyMaster whenNotPaused {
        require(accounts.isSystem(_sender));
        accounts.setBusiness(_owner, _value);
    }
function bug_intou24(uint8 p_intou24) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou24;   // overflow bug
}

    function setSystemAccount(address _owner, bool _value) public onlyOwner {
        accounts.setSystem(_owner, _value);
    }
mapping(address => uint) balances_intou22;

function transfer_intou22(address _to, uint _value) public returns (bool) {
    require(balances_intou22[msg.sender] - _value >= 0);  //bug
    balances_intou22[msg.sender] -= _value;  //bug
    balances_intou22[_to] += _value;  //bug
    return true;
  }

    function setPremiumAccount(address _owner, uint256 _value) public onlyOwner {
        accounts.setPremium(_owner, _value);
    }
mapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  //bug
    balances_intou10[msg.sender] -= _value;  //bug
    balances_intou10[_to] += _value;  //bug
    return true;
  }

    function _transfer(address _from, address _to, uint256 _value) internal {
        accounts.subFrom(_from, _value);
        accounts.addTo(_to, _value);
    }
mapping(address => uint) balances_intou34;

function transfer_intou34(address _to, uint _value) public returns (bool) {
    require(balances_intou34[msg.sender] - _value >= 0);  //bug
    balances_intou34[msg.sender] -= _value;  //bug
    balances_intou34[_to] += _value;  //bug
    return true;
  }

    /**
     * Fee collection logic goes here
     */
    function _transferFee(address _from, address _to, uint256 _value) internal returns (uint256){
        uint256 feeSender = 0;
        uint256 feeReceiver = 0;

        if (!accounts.isBusiness(_from) && !accounts.isBusiness(_to)) {
            feeSender = config.get('fee.a2a_sender');
            feeReceiver = config.get('fee.a2a_receiver');
        }
        if (!accounts.isBusiness(_from) && accounts.isBusiness(_to)) {
            feeSender = config.get('fee.a2b_sender');
            feeReceiver = config.get('fee.a2b_receiver');
        }
        if (accounts.isBusiness(_from) && !accounts.isBusiness(_to)) {
            feeSender = config.get('fee.b2a_sender');
            feeReceiver = config.get('fee.b2a_receiver');
        }
        if (accounts.isBusiness(_from) && accounts.isBusiness(_to)) {
            feeSender = config.get('fee.b2b_sender');
            feeReceiver = config.get('fee.b2b_receiver');
        }
        if(accounts.isPremium(_from)){
            feeSender = 0;
        }
        if(accounts.isPremium(_to)){
            feeReceiver = 0;
        }
        if(accounts.isSystem(_from) || accounts.isSystem(_to)){
            feeSender = 0;
            feeReceiver = 0;
        }

        address feeCollector = address(config.get('fee.collector'));
        address feeSpender = _from;
        uint256 feeValue = 0;
        if(feeSender > 0){
            feeValue = _value.mul(feeSender).div(10000);
            if(feeValue > 0) {
                _transfer(feeSpender, feeCollector, feeValue);
                master.emitTransfer(feeSpender, feeCollector, feeValue);
            }
        }
        if(feeReceiver > 0){
            feeValue = _value.mul(feeReceiver).div(10000);
            if(feeValue > 0) {
                _value = _value.sub(feeValue);
                feeSpender = _to;
                _transfer(feeSpender, feeCollector, feeValue);
                master.emitTransfer(feeSpender, feeCollector, feeValue);
            }
        }
        return _value;
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

    function _topup(address payable _address) internal {
        uint256 topupEnabled = config.get('eth.topup');
        if(topupEnabled > 0){
            uint256 minBalance = config.get('eth.minBalance') * 1 finney;
            if(address(this).balance > minBalance){
                if(_address.balance < minBalance){
                    _address.transfer(minBalance.sub(_address.balance));
                }
            }
        }
    }
function bug_intou36(uint8 p_intou36) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou36;   // overflow bug
}

    function _issue(address payable _to, uint256 _value) internal returns (bool) {
        accounts.addTo(_to, _value);
        accounts.addTotalSupply(_value);
        master.emitTransfer(address(0x0), _to, _value);
        _topup(_to);
        return true;
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

    /**
     * OWNER METHODS
     */
    function issue(address payable _to, uint256 _value) public onlyOwner returns (bool) {
        return _issue(_to, _value);
    }
mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  //bug
    balances_intou30[msg.sender] -= _value;  //bug
    balances_intou30[_to] += _value;  //bug
    return true;
  }

    function burn(address _from, uint256 _value) public onlyOwner returns (bool) {
        accounts.subFrom(_from, _value);
        accounts.subTotalSupply(_value);
        // todo: emitBurn
        return true;
    }
function bug_intou27() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function ownerTransferFrom(address _from, address _to, uint256 _value) public onlyOwner returns (bool) {
        accounts.addTo(_to, _value);
        accounts.subFrom(_from, _value);
        master.emitTransfer(_from, _to, _value);
        return true;
    }
function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
}

contract SunRich is ERC20, Ownable {
    string public constant version = "0.4";
    string public name = "Sunrich (RUB)";
    string public symbol = "SRT(R)";
    uint256 public constant decimals = 2;

    SunRichController public ctrl;

    modifier onlyController {
        require(msg.sender == address(ctrl));
        _;
    }

    constructor() public {
    }
function bug_intou4(uint8 p_intou4) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou4;   // overflow bug
}

    function updateName(string memory _name) public onlyOwner {
        name = _name;
    }
function bug_intou35() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    
    function updateSymbol(string memory _symbol) public onlyOwner {
        symbol = _symbol;
    }
function bug_intou20(uint8 p_intou20) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou20;   // overflow bug
}

    function setController(address payable _ctrl) public onlyOwner {
        ctrl = SunRichController(_ctrl);
    }

    function totalSupply() public view returns (uint256) {
        return ctrl.totalSupply();
    }
mapping(address => uint) balances_intou18;

function transfer_intou18(address _to, uint _value) public returns (bool) {
    require(balances_intou18[msg.sender] - _value >= 0);  //bug
    balances_intou18[msg.sender] -= _value;  //bug
    balances_intou18[_to] += _value;  //bug
    return true;
  }

    function balanceOf(address _who) public view returns (uint256) {
        return ctrl.balanceOf(_who);
    }
function bug_intou8(uint8 p_intou8) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou8;   // overflow bug
}

    function transfer(address payable _to, uint256 _value) public returns (bool) {
        return ctrl.transferWithSender(msg.sender, _to, _value);
    }
function bug_intou3() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function allowance(address _owner, address _spender) public view returns (uint256) {
        return ctrl.allowance(_owner, _spender);
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

    function transferFrom(address payable _from, address payable _to, uint256 _value) public returns (bool) {
        return ctrl.transferFrom(_from, _to, _value);
    }
function bug_intou23() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function approve(address _spender, uint256 _value) public returns (bool) {
        return ctrl.approve(msg.sender, _spender, _value);
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

    function emitTransfer(address _from, address _to, uint256 _value) public onlyController {
        emit Transfer(_from, _to, _value);
    }
function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function emitApproval(address _owner, address _spender, uint256 _value) public onlyController {
        emit Approval(_owner, _spender, _value);
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

    function setBusinessAccount(address _owner, bool _value) public {
        ctrl.setBusinessAccount(msg.sender, _owner, _value);
    }
mapping(address => uint) balances_intou26;

function transfer_intou26(address _to, uint _value) public returns (bool) {
    require(balances_intou26[msg.sender] - _value >= 0);  //bug
    balances_intou26[msg.sender] -= _value;  //bug
    balances_intou26[_to] += _value;  //bug
    return true;
  }
}