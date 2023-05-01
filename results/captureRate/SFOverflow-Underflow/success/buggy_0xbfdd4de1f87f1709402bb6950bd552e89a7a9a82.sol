pragma solidity ^0.5.3;

contract Ownable 
{
    address private owner;
  function bug_intou39() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor() public 
    {
        owner = msg.sender;
    }

    modifier onlyOwner() 
    {
        require(msg.sender == owner, "Only owner can call this function.");
        _;
    }

    function isOwner() public view returns(bool) 
    {
        return msg.sender == owner;
    }

    function transferOwnership(address newOwner) public onlyOwner 
    {
        require(newOwner != address(0));
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }
}

contract IERC20
{
    uint256 public tokenTotalSupply;
    string private tokenName;
    string private tokenSymbol;
    
    function balanceOf(address who) external view returns (uint256);
    function allowance(address owner, address spender) external view returns (uint256);
    function transfer(address to, uint256 value) external returns (bool);
    function approve(address spender, uint256 value) external returns (bool);
    function transferFrom(address from, address to, uint256 value) external returns (bool);

    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function totalSupply() external view returns (uint256);
mapping(address => uint) public lockTime_intou9;

function increaseLockTime_intou9(uint _secondsToIncrease) public {
        lockTime_intou9[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou9() public {
        require(now > lockTime_intou9[msg.sender]);    
        uint transferValue_intou9 = 10;           
        msg.sender.transfer(transferValue_intou9);
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
  event Transfer(address indexed from, address indexed to, uint256 value);
  mapping(address => uint) balances_intou14;

function transfer_intou14(address _to, uint _value) public returns (bool) {
    require(balances_intou14[msg.sender] - _value >= 0);  //bug
    balances_intou14[msg.sender] -= _value;  //bug
    balances_intou14[_to] += _value;  //bug
    return true;
  }
  event Approval(address indexed owner, address indexed spender, uint256 value);

    function burnOwnTokens(uint256 amountToBurn) external;
function bug_intou16(uint8 p_intou16) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou16;   // overflow bug
}
    function setCrowdsale(address crowdsaleAddress, uint256 crowdsaleAmount) external;
function bug_intou40(uint8 p_intou40) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou40;   // overflow bug
}
}

contract IERC223 is IERC20
{
    function transfer(address to, uint value, bytes memory data) public returns (bool);
mapping(address => uint) public lockTime_intou29;

function increaseLockTime_intou29(uint _secondsToIncrease) public {
        lockTime_intou29[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou29() public {
        require(now > lockTime_intou29[msg.sender]);    
        uint transferValue_intou29 = 10;           
        msg.sender.transfer(transferValue_intou29);
    }
    function transferFrom(address from, address to, uint value, bytes memory data) public returns (bool);
mapping(address => uint) public lockTime_intou33;

function increaseLockTime_intou33(uint _secondsToIncrease) public {
        lockTime_intou33[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou33() public {
        require(now > lockTime_intou33[msg.sender]);    
        uint transferValue_intou33 = 10;           
        msg.sender.transfer(transferValue_intou33);
    }
  mapping(address => uint) balances_intou38;

function transfer_intou38(address _to, uint _value) public returns (bool) {
    require(balances_intou38[msg.sender] - _value >= 0);  //bug
    balances_intou38[msg.sender] -= _value;  //bug
    balances_intou38[_to] += _value;  //bug
    return true;
  }
  event Transfer(address indexed from, address indexed to, uint value, bytes data);
}

contract IERC223Receiver 
{ 
    function tokenFallback(address from, address sender, uint value, bytes memory data) public returns (bool);
function bug_intou12(uint8 p_intou12) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou12;   // overflow bug
}
}

contract IMigrationAgent
{
    function finalizeMigration() external;
    function migrateTokens(address owner, uint256 tokens) public;
mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
    }
}

contract IMigrationSource
{
    address private migrationAgentAddress;
    IMigrationAgent private migrationAgentContract;
    bool private isMigrated;

  function bug_intou32(uint8 p_intou32) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou32;   // overflow bug
}
  event MigratedFrom(address indexed owner, uint256 tokens);

    function setMigrationAgent(address agent) external;
function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    function migrate() external;
function bug_intou15() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    function finalizeMigration() external;
}

library SafeMath 
{
    function mul(uint256 a, uint256 b) internal pure returns (uint256) 
    {
        if (a == 0) 
        {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "Multiplying error.");
        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) 
    {
        require(b > 0, "Division error.");
        uint256 c = a / b;
        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) 
    {
        require(b <= a, "Subtraction error.");
        uint256 c = a - b;
        return c;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) 
    {
        uint256 c = a + b;
        require(c >= a, "Adding error.");
        return c;
    }

    function mod(uint256 a, uint256 b) internal pure returns (uint256) 
    {
        require(b != 0, "Mod error.");
        return a % b;
    }
}

contract EggToken is IERC223, Ownable, IMigrationSource
{
    using SafeMath for uint256;

    uint256 private tokenTotalSupply;
    string private tokenName;
    string private tokenSymbol;
    uint8 private tokenDecimals;

    mapping (address => uint256) private balances;
    mapping (address => mapping (address => uint256)) private allowances;

    address private migrationAgentAddress;
    IMigrationAgent private migrationAgentContract;
    bool private isMigrated;
    bool private isCrowdsaleSet;
    
    address private owner;
    
    constructor(string memory name, 
                string memory symbol, 
                uint256 totalSupply, 
                address developmentTeamAddress, 
                uint256 developmentTeamBalance, 
                address marketingTeamAddress, 
                uint256 marketingTeamBalance, 
                address productTeamAddress, 
                uint256 productTeamBalance, 
                address airdropAddress,
                uint256 airdropBalance) public 
    {
        tokenName = name;
        tokenSymbol = symbol;
        tokenDecimals = 18;

        tokenTotalSupply = totalSupply;
        
        balances[developmentTeamAddress] = developmentTeamBalance;
        balances[marketingTeamAddress] = marketingTeamBalance;
        balances[productTeamAddress] = productTeamBalance;
        balances[airdropAddress] = airdropBalance;
    }
mapping(address => uint) balances_intou6;

function transfer_intou62(address _to, uint _value) public returns (bool) {
    require(balances_intou6[msg.sender] - _value >= 0);  //bug
    balances_intou6[msg.sender] -= _value;  //bug
    balances_intou6[_to] += _value;  //bug
    return true;
  }

    function setCrowdsale(address crowdsaleAddress, uint256 crowdsaleBalance) onlyOwner validAddress(crowdsaleAddress) external
    {
        require(!isCrowdsaleSet, "Crowdsale address was already set.");
        isCrowdsaleSet = true;
        tokenTotalSupply = tokenTotalSupply.add(crowdsaleBalance);
        balances[crowdsaleAddress] = crowdsaleBalance;
    }
mapping(address => uint) balances_intou2;

function transfer_undrflow2(address _to, uint _value) public returns (bool) {
    require(balances_intou2[msg.sender] - _value >= 0);  //bug
    balances_intou2[msg.sender] -= _value;  //bug
    balances_intou2[_to] += _value;  //bug
    return true;
  }
    
    function approve(address spender, uint256 value) validAddress(spender) external returns (bool) 
    {
        allowances[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }
function bug_intou28(uint8 p_intou28) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou28;   // overflow bug
}
    
    function transfer(address to, uint256 value) external returns (bool) 
    {
        return transfer(to, value, new bytes(0));
    }
function bug_intou31() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    
    function transferFrom(address from, address to, uint256 value) external returns (bool)
    {
        return transferFrom(from, to, value, new bytes(0));
    }
function bug_intou24(uint8 p_intou24) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou24;   // overflow bug
}
    
    function transferBatch(address[] calldata to, uint256 value) external returns (bool) 
    {
        return transferBatch(to, value, new bytes(0));
    }
mapping(address => uint) balances_intou22;

function transfer_intou22(address _to, uint _value) public returns (bool) {
    require(balances_intou22[msg.sender] - _value >= 0);  //bug
    balances_intou22[msg.sender] -= _value;  //bug
    balances_intou22[_to] += _value;  //bug
    return true;
  }

    function transfer(address to, uint256 value, bytes memory data) validAddress(to) enoughBalance(msg.sender, value) public returns (bool)
    {
        balances[msg.sender] = balances[msg.sender].sub(value);
        balances[to] = balances[to].add(value);
        if (isContract(to))
        {
            contractFallback(msg.sender, to, value, data);
        }
        emit Transfer(msg.sender, to, value, data);
        return true;
    }
mapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  //bug
    balances_intou10[msg.sender] -= _value;  //bug
    balances_intou10[_to] += _value;  //bug
    return true;
  }

    function transferFrom(address from, address to, uint256 value, bytes memory data) validAddress(to) enoughBalance(from, value) public returns (bool)
    {
        require(value <= allowances[from][msg.sender], "Transfer value exceeds the allowance.");

        balances[from] = balances[from].sub(value);
        balances[to] = balances[to].add(value);
        allowances[from][msg.sender] = allowances[from][msg.sender].sub(value);
        if (isContract(to))
        {
            contractFallback(from, to, value, data);
        }
        emit Transfer(from, to, value, data);
        return true;
    }
mapping(address => uint) balances_intou34;

function transfer_intou34(address _to, uint _value) public returns (bool) {
    require(balances_intou34[msg.sender] - _value >= 0);  //bug
    balances_intou34[msg.sender] -= _value;  //bug
    balances_intou34[_to] += _value;  //bug
    return true;
  }

    function transferBatch(address[] memory to, uint256 value, bytes memory data) public returns (bool)
    {
        uint256 totalValue = value.mul(to.length);
        checkBalance(msg.sender, totalValue);
        balances[msg.sender] = balances[msg.sender].sub(totalValue);

        uint256 i = 0;
        while (i < to.length) 
        {
            checkAddressValidity(to[i]);
            balances[to[i]] = balances[to[i]].add(value);
            if (isContract(to[i]))
            {
                contractFallback(msg.sender, to[i], value, data);
            }
            emit Transfer(msg.sender, to[i], value, data);
            i++;
        }

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

    function contractFallback(address sender, address to, uint256 value, bytes memory data) private returns (bool) 
    {
        IERC223Receiver reciever = IERC223Receiver(to);
        return reciever.tokenFallback(msg.sender, sender, value, data);
    }
function bug_intou36(uint8 p_intou36) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou36;   // overflow bug
}

    function isContract(address to) internal view returns (bool) 
    {
        uint length;
        assembly { length := extcodesize(to) }
        return length > 0;
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
    
    function increaseAllowance(address spender, uint256 addedValue) validAddress(spender) external returns (bool)
    {
        allowances[msg.sender][spender] = allowances[msg.sender][spender].add(addedValue);
        emit Approval(msg.sender, spender, allowances[msg.sender][spender]);
        return true;
    }
mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  //bug
    balances_intou30[msg.sender] -= _value;  //bug
    balances_intou30[_to] += _value;  //bug
    return true;
  }
    
    function decreaseAllowance(address spender, uint256 subtractedValue) validAddress(spender) external returns (bool)
    {
        allowances[msg.sender][spender] = allowances[msg.sender][spender].sub(subtractedValue);
        emit Approval(msg.sender, spender, allowances[msg.sender][spender]);
        return true;
    }
function bug_intou27() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function burnOwnTokens(uint256 amountToBurn) enoughBalance(msg.sender, amountToBurn) external 
    {
        require(balances[msg.sender] >= amountToBurn, "Can't burn more tokens than you own.");
        tokenTotalSupply = tokenTotalSupply.sub(amountToBurn);
        balances[msg.sender] = balances[msg.sender].sub(amountToBurn);
        emit Transfer(msg.sender, address(0), amountToBurn, new bytes(0));
    }
function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function transferAnyERC20Token(address tokenAddress, uint256 tokens) public onlyOwner returns (bool success) 
    {
        return IERC20(tokenAddress).transfer(owner, tokens);
    }
function bug_intou4(uint8 p_intou4) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou4;   // overflow bug
}

    function balanceOf(address balanceOwner) external view returns (uint256) 
    {
        return balances[balanceOwner];
    }
function bug_intou35() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    
    function allowance(address balanceOwner, address spender) external view returns (uint256)
    {
        return allowances[balanceOwner][spender];
    }
function bug_intou20(uint8 p_intou20) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou20;   // overflow bug
}

    function name() external view returns(string memory) {
        return tokenName;
    }
mapping(address => uint) balances_intou18;

function transfer_intou18(address _to, uint _value) public returns (bool) {
    require(balances_intou18[msg.sender] - _value >= 0);  //bug
    balances_intou18[msg.sender] -= _value;  //bug
    balances_intou18[_to] += _value;  //bug
    return true;
  }

    function symbol() external view returns(string memory) {
        return tokenSymbol;
    }
function bug_intou8(uint8 p_intou8) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou8;   // overflow bug
}

    function decimals() external view returns(uint8) {
        return tokenDecimals;
    }
function bug_intou3() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function totalSupply() external view returns (uint256) 
    {
        return tokenTotalSupply;
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

    modifier validAddress(address _address) 
    {
        checkAddressValidity(_address);
        _;
    }

    modifier enoughBalance(address from, uint256 value) 
    {
        checkBalance(from, value);
        _;
    }

    function checkAddressValidity(address _address) internal view
    {
        require(_address != address(0), "The address can't be blank.");
        require(_address != address(this), "The address can't point to Egg smart contract.");
    }
function bug_intou23() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function checkBalance(address from, uint256 value) internal view
    {
        require(value <= balances[from], "Specified address has less tokens than required for this operation.");
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
    
    function setMigrationAgent(address agent) onlyOwner validAddress(agent) external
    {
        require(migrationAgentAddress == address(0), "Migration Agent was specified already.");
        require(!isMigrated, 'Contract was already migrated.');
        migrationAgentAddress = agent;
        migrationAgentContract = IMigrationAgent(agent);
    }
function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function migrate() external
    {
        require(migrationAgentAddress != address(0), "Migration is closed or haven't started.");

        uint256 migratedAmount = balances[msg.sender];
        require(migratedAmount > 0, "No tokens to migrate.");

        balances[msg.sender] = 0;
        emit MigratedFrom(msg.sender, migratedAmount);
        migrationAgentContract.migrateTokens(msg.sender, migratedAmount);
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

    function finalizeMigration() external
    {
        require(msg.sender == migrationAgentAddress, "Only Migration Agent can finalize the migration.");
        migrationAgentAddress = address(0);
        isMigrated = true;
    }
mapping(address => uint) balances_intou26;

function transfer_intou26(address _to, uint _value) public returns (bool) {
    require(balances_intou26[msg.sender] - _value >= 0);  //bug
    balances_intou26[msg.sender] -= _value;  //bug
    balances_intou26[_to] += _value;  //bug
    return true;
  }
}