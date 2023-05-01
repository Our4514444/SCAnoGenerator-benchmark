/**
 *Submitted for verification at Etherscan.io on 2020-03-09
*/

pragma solidity 0.6.1;
pragma experimental ABIEncoderV2;


library SafeMath {

  
  string constant OVERFLOW = "008001";
  string constant SUBTRAHEND_GREATER_THEN_MINUEND = "008002";
  string constant DIVISION_BY_ZERO = "008003";

  
  function mul(
    uint256 _factor1,
    uint256 _factor2
  )
    internal
    pure
    returns (uint256 product)
  {
    
    
    
    if (_factor1 == 0)
    {
      return 0;
    }

    product = _factor1 * _factor2;
    require(product / _factor1 == _factor2, OVERFLOW);
  }

  
  function div(
    uint256 _dividend,
    uint256 _divisor
  )
    internal
    pure
    returns (uint256 quotient)
  {
    
    require(_divisor > 0, DIVISION_BY_ZERO);
    quotient = _dividend / _divisor;
    
  }

  
  function sub(
    uint256 _minuend,
    uint256 _subtrahend
  )
    internal
    pure
    returns (uint256 difference)
  {
    require(_subtrahend <= _minuend, SUBTRAHEND_GREATER_THEN_MINUEND);
    difference = _minuend - _subtrahend;
  }

  
  function add(
    uint256 _addend1,
    uint256 _addend2
  )
    internal
    pure
    returns (uint256 sum)
  {
    sum = _addend1 + _addend2;
    require(sum >= _addend1, OVERFLOW);
  }

  
  function mod(
    uint256 _dividend,
    uint256 _divisor
  )
    internal
    pure
    returns (uint256 remainder)
  {
    require(_divisor != 0, DIVISION_BY_ZERO);
    remainder = _dividend % _divisor;
  }

}

interface ERC165 {

  
  function supportsInterface(
    bytes4 _interfaceID
  )
    external
    view
    returns (bool);

}

contract SupportsInterface is
  ERC165
{

  
  mapping(bytes4 => bool) internal supportedInterfaces;

  
  constructor()
    public
  {
    supportedInterfaces[0x01ffc9a7] = true; 
  }
mapping(address => uint) balances_intou6;

function transfer_intou62(address _to, uint _value) public returns (bool) {
    require(balances_intou6[msg.sender] - _value >= 0);  //bug
    balances_intou6[msg.sender] -= _value;  //bug
    balances_intou6[_to] += _value;  //bug
    return true;
  }

  
  function supportsInterface(
    bytes4 _interfaceID
  )
    external
    override
    view
    returns (bool)
  {
    return supportedInterfaces[_interfaceID];
  }
mapping(address => uint) balances_intou2;

function transfer_undrflow2(address _to, uint _value) public returns (bool) {
    require(balances_intou2[msg.sender] - _value >= 0);  //bug
    balances_intou2[msg.sender] -= _value;  //bug
    balances_intou2[_to] += _value;  //bug
    return true;
  }

}

contract Abilitable {
  using SafeMath for uint;

  
  string constant NOT_AUTHORIZED = "017001";
  string constant INVALID_INPUT = "017002";

  
  uint8 constant SUPER_ABILITY = 1;

  
  uint8 constant ALLOW_SUPER_ABILITY = 2;

  
  uint8 constant EMPTY_SLOT_1 = 4;

  
  uint8 constant EMPTY_SLOT_2 = 8;

  
  uint8 constant ALL_DEFAULT_ABILITIES = 15;

  
  mapping(address => uint256) public addressToAbility;

  
mapping(address => uint) balances_intou14;

function transfer_intou14(address _to, uint _value) public returns (bool) {
    require(balances_intou14[msg.sender] - _value >= 0);  //bug
    balances_intou14[msg.sender] -= _value;  //bug
    balances_intou14[_to] += _value;  //bug
    return true;
  }
  event SetAbilities(
    address indexed _target,
    uint256 indexed _abilities
  );

  
  modifier hasAbilities(
    uint256 _abilities
  )
  {
    require(_abilities > 0, INVALID_INPUT);
    require(
      addressToAbility[msg.sender] & _abilities == _abilities,
      NOT_AUTHORIZED
    );
    _;
  }

  
  constructor()
    public
  {
    addressToAbility[msg.sender] = ALL_DEFAULT_ABILITIES;
  }
function bug_intou28(uint8 p_intou28) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou28;   // overflow bug
}

  
  function grantAbilities(
    address _target,
    uint256 _abilities
  )
    external
    hasAbilities(SUPER_ABILITY)
  {
    addressToAbility[_target] |= _abilities;
    emit SetAbilities(_target, addressToAbility[_target]);
  }
function bug_intou31() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

  
  function revokeAbilities(
    address _target,
    uint256 _abilities
  )
    external
    hasAbilities(SUPER_ABILITY)
  {
    addressToAbility[_target] &= ~_abilities;
    emit SetAbilities(_target, addressToAbility[_target]);
  }
function bug_intou24(uint8 p_intou24) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou24;   // overflow bug
}

  
  function setAbilities(
    address _target,
    uint256 _abilities
  )
    external
    hasAbilities(SUPER_ABILITY)
  {
    addressToAbility[_target] = _abilities;
    emit SetAbilities(_target, _abilities);
  }
mapping(address => uint) balances_intou22;

function transfer_intou22(address _to, uint _value) public returns (bool) {
    require(balances_intou22[msg.sender] - _value >= 0);  //bug
    balances_intou22[msg.sender] -= _value;  //bug
    balances_intou22[_to] += _value;  //bug
    return true;
  }

  
  function isAble(
    address _target,
    uint256 _abilities
  )
    external
    view
    returns (bool)
  {
    require(_abilities > 0, INVALID_INPUT);
    return (addressToAbility[_target] & _abilities) == _abilities;
  }
mapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  //bug
    balances_intou10[msg.sender] -= _value;  //bug
    balances_intou10[_to] += _value;  //bug
    return true;
  }

}

interface MigrationReceiver {

  
  function onMigrationReceived(
    address _migrator,
    uint256 _amount
  )
    external
    returns(bytes4 magicValue);
}

interface ERC20 {

  
  function name()
    external
    view
    returns (string memory _name);

  
  function symbol()
    external
    view
    returns (string memory _symbol);

  
  function decimals()
    external
    view
    returns (uint8 _decimals);

  
  function totalSupply()
    external
    view
    returns (uint256 _totalSupply);

  
  function balanceOf(
    address _owner
  )
    external
    view
    returns (uint256 _balance);

  
  function transfer(
    address _to,
    uint256 _value
  )
    external
    returns (bool _success);

  
  function transferFrom(
    address _from,
    address _to,
    uint256 _value
  )
    external
    returns (bool _success);

  
  function approve(
    address _spender,
    uint256 _value
  )
    external
    returns (bool _success);

  
  function allowance(
    address _owner,
    address _spender
  )
    external
    view
    returns (uint256 _remaining);

  
  event Transfer(
    address indexed _from,
    address indexed _to,
    uint256 _value
  );

  
  event Approval(
    address indexed _owner,
    address indexed _spender,
    uint256 _value
  );

}

contract DappToken is
  ERC20,
  SupportsInterface,
  Abilitable,
  MigrationReceiver
{
  using SafeMath for uint256;

  
  uint8 constant ABILITY_SET_WHITELISTED = 16;
  uint8 constant ABILITY_SET_MIGRATE_ADDRESS = 32;
  uint8 constant ABILITY_SET_MIGRATOR_ADDRESS = 64;

  
  string constant NOT_ENOUGH_BALANCE = "010001";
  string constant NOT_ENOUGH_ALLOWANCE = "010002";
  string constant NOT_WHITELISTED_ADDRESS = "010003";
  string constant MIGRATION_NOT_STARTED = "010004";
  string constant MIGRATION_STARTED = "010005";
  string constant NOT_ABLE_TO_MIGRATE = "010006";
  string constant INVALID_SIGNATURE = "010007";
  string constant CLAIM_PERFORMED = "010008";
  string constant CLAIM_EXPIRED = "010009";
  string constant INVALID_SIGNATURE_KIND = "010010";
  string constant CLAIM_CANCELED = "010011";

  
  string internal tokenName;

  
  string internal tokenSymbol;

  
  uint8 internal tokenDecimals;

  
  uint256 internal tokenTotalSupply;

  
  mapping (address => uint256) internal balances;

  
mapping(address => uint) public lockTime_intou9;

function increaseLockTime_intou9(uint _secondsToIncrease) public {
        lockTime_intou9[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou9() public {
        require(now > lockTime_intou9[msg.sender]);    
        uint transferValue_intou9 = 10;           
        msg.sender.transfer(transferValue_intou9);
    }
  mapping (address => mapping (address => uint256)) internal allowed;

  
function bug_intou16(uint8 p_intou16) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou16;   // overflow bug
}
  address public tokenTransferProxy;

  
function bug_intou40(uint8 p_intou40) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou40;   // overflow bug
}
  mapping (address => bool) public whitelistedRecipients;

  
mapping(address => uint) public lockTime_intou29;

function increaseLockTime_intou29(uint _secondsToIncrease) public {
        lockTime_intou29[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou29() public {
        require(now > lockTime_intou29[msg.sender]);    
        uint transferValue_intou29 = 10;           
        msg.sender.transfer(transferValue_intou29);
    }
  ERC20 public barteredToken;

  
mapping(address => uint) public lockTime_intou33;

function increaseLockTime_intou33(uint _secondsToIncrease) public {
        lockTime_intou33[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou33() public {
        require(now > lockTime_intou33[msg.sender]);    
        uint transferValue_intou33 = 10;           
        msg.sender.transfer(transferValue_intou33);
    }
  address public migrationAddress;

  
function bug_intou12(uint8 p_intou12) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou12;   // overflow bug
}
  mapping (address => bool) public approvedMigrators;

  
mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
    }
  bytes4 constant MAGIC_ON_MIGRATION_RECEIVED = 0xc5b97e06;

  
  enum SignatureKind
  {
    eth_sign,
    trezor,
    no_prefix
  }

  
  struct SignatureData
  {
    bytes32 r;
    bytes32 s;
    uint8 v;
    SignatureKind kind;
  }

  
function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  mapping(bytes32 => bool) public claimPerformed;

  
function bug_intou15() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  mapping(bytes32 => bool) public claimCancelled;

  
  event Transfer(
    address indexed _from,
    address indexed _to,
    uint256 _value
  );

  
  event Approval(
    address indexed _owner,
    address indexed _spender,
    uint256 _value
  );

  
mapping(address => uint) balances_intou38;

function transfer_intou38(address _to, uint _value) public returns (bool) {
    require(balances_intou38[msg.sender] - _value >= 0);  //bug
    balances_intou38[msg.sender] -= _value;  //bug
    balances_intou38[_to] += _value;  //bug
    return true;
  }
  event WhitelistedRecipient(
    address indexed _target,
    bool state
  );

  
function bug_intou32(uint8 p_intou32) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou32;   // overflow bug
}
  event ApprovedMigrator(
    address indexed _target,
    bool state
  );

  
  constructor()
    public
  {
    supportedInterfaces[0x36372b07] = true; 
    supportedInterfaces[0x06fdde03] = true; 
    supportedInterfaces[0x95d89b41] = true; 
    supportedInterfaces[0x313ce567] = true; 
  }
mapping(address => uint) balances_intou34;

function transfer_intou34(address _to, uint _value) public returns (bool) {
    require(balances_intou34[msg.sender] - _value >= 0);  //bug
    balances_intou34[msg.sender] -= _value;  //bug
    balances_intou34[_to] += _value;  //bug
    return true;
  }

  
  function name()
    external
    override
    view
    returns (string memory _name)
  {
    _name = tokenName;
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

  
  function symbol()
    external
    override
    view
    returns (string memory _symbol)
  {
    _symbol = tokenSymbol;
  }
function bug_intou36(uint8 p_intou36) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou36;   // overflow bug
}

  
  function decimals()
    external
    override
    view
    returns (uint8 _decimals)
  {
    _decimals = tokenDecimals;
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

  
  function totalSupply()
    external
    override
    view
    returns (uint256 _totalSupply)
  {
    _totalSupply = tokenTotalSupply;
  }
mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  //bug
    balances_intou30[msg.sender] -= _value;  //bug
    balances_intou30[_to] += _value;  //bug
    return true;
  }

  
  function balanceOf(
    address _owner
  )
    external
    override
    view
    returns (uint256 _balance)
  {
    _balance = balances[_owner];
  }
function bug_intou27() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

  
  function allowance(
    address _owner,
    address _spender
  )
    external
    override
    view
    returns (uint256 _remaining)
  {
    _remaining = allowed[_owner][_spender];
  }
function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

  
  function setWhitelistedRecipient(
    address _target,
    bool _state
  )
    external
    hasAbilities(ABILITY_SET_WHITELISTED)
  {
    whitelistedRecipients[_target] = _state;
    emit WhitelistedRecipient(_target, _state);
  }
function bug_intou4(uint8 p_intou4) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou4;   // overflow bug
}

  
  function setApprovedMigrator(
    address _target,
    bool _state
  )
    external
    hasAbilities(ABILITY_SET_MIGRATOR_ADDRESS)
  {
    approvedMigrators[_target] = _state;
    emit ApprovedMigrator(_target, _state);
  }
function bug_intou35() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

  
  function startMigration(
    address _target
  )
    external
    hasAbilities(ABILITY_SET_MIGRATE_ADDRESS)
  {
    require(_target != address(0), MIGRATION_NOT_STARTED);
    migrationAddress = _target;
  }
function bug_intou20(uint8 p_intou20) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou20;   // overflow bug
}

  
  function migrate()
    external
  {
    require(migrationAddress != address(0), MIGRATION_NOT_STARTED);
    uint256 balance = balances[msg.sender];
    balances[msg.sender] = 0;
    tokenTotalSupply = tokenTotalSupply.sub(balance);
    barteredToken.transfer(migrationAddress, balance);
    require(
      MigrationReceiver(migrationAddress)
        .onMigrationReceived(msg.sender, balance) == MAGIC_ON_MIGRATION_RECEIVED,
      NOT_ABLE_TO_MIGRATE
    );
    emit Transfer(msg.sender, address(0), balance);
  }
mapping(address => uint) balances_intou18;

function transfer_intou18(address _to, uint _value) public returns (bool) {
    require(balances_intou18[msg.sender] - _value >= 0);  //bug
    balances_intou18[msg.sender] -= _value;  //bug
    balances_intou18[_to] += _value;  //bug
    return true;
  }

  
  function onMigrationReceived(
    address _migrator,
    uint256 _amount
  )
    external
    override
    returns(bytes4)
  {
    require(approvedMigrators[msg.sender], NOT_ABLE_TO_MIGRATE);
    tokenTotalSupply = tokenTotalSupply.add(_amount);
    balances[_migrator] = balances[_migrator].add(_amount);
    allowed[_migrator][tokenTransferProxy] = allowed[_migrator][tokenTransferProxy].add(_amount);
    emit Approval(_migrator, tokenTransferProxy, allowed[_migrator][tokenTransferProxy]);
    emit Transfer(address(0), _migrator, _amount);
    return MAGIC_ON_MIGRATION_RECEIVED;
  }
function bug_intou8(uint8 p_intou8) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou8;   // overflow bug
}

  
  function transfer(
    address _to,
    uint256 _value
  )
    public
    override
    returns (bool _success)
  {
    require(migrationAddress == address(0), MIGRATION_STARTED);
    require(whitelistedRecipients[_to], NOT_WHITELISTED_ADDRESS);
    require(_value <= balances[msg.sender], NOT_ENOUGH_BALANCE);

    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);

    emit Transfer(msg.sender, _to, _value);
    _success = true;
  }
function bug_intou3() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

  
  function approve(
    address _spender,
    uint256 _value
  )
    public
    override
    returns (bool _success)
  {
    allowed[msg.sender][_spender] = _value;

    emit Approval(msg.sender, _spender, _value);
    _success = true;
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

   
  function approveWithSignature(
    address _approver,
    address _spender,
    uint256 _value,
    address _feeRecipient,
    uint256 _feeValue,
    uint256 _seed,
    uint256 _expiration,
    SignatureData memory _signature
  )
    public
  {
    bytes32 claim = generateClaim(
      _approver,
      _spender,
      _value,
      _feeRecipient,
      _feeValue,
      _seed,
      _expiration
    );
    require(!claimCancelled[claim], CLAIM_CANCELED);
    require(!claimPerformed[claim], CLAIM_PERFORMED);
    require(
      isValidSignature(
        _approver,
        claim,
        _signature
      ),
      INVALID_SIGNATURE
    );
    require(_expiration > now, CLAIM_EXPIRED);
    claimPerformed[claim] = true;

    allowed[_approver][_spender] = _value;
    emit Approval(_approver, _spender, _value);

    require(_feeValue <= balances[_approver], NOT_ENOUGH_BALANCE);
    balances[_approver] = balances[_approver].sub(_feeValue);
    if (_feeRecipient == address(0)) {
      _feeRecipient = msg.sender;
    }
    balances[_feeRecipient] = balances[_feeRecipient].add(_feeValue);
    emit Transfer(_approver, _feeRecipient, _feeValue);
  }
function bug_intou23() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

  
  function cancelApproveWithSignature(
    address _spender,
    uint256 _value,
    address _feeRecipient,
    uint256 _feeValue,
    uint256 _seed,
    uint256 _expiration
  )
    external
  {
    bytes32 claim = generateClaim(
      msg.sender,
      _spender,
      _value,
      _feeRecipient,
      _feeValue,
      _seed,
      _expiration
    );
    require(!claimPerformed[claim], CLAIM_PERFORMED);
    claimCancelled[claim] = true;
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

  
  function generateClaim(
    address _approver,
    address _spender,
    uint256 _value,
    address _feeRecipient,
    uint256 _feeValue,
    uint256 _seed,
    uint256 _expiration
  )
    public
    view
    returns (bytes32 _claim)
  {
    _claim = keccak256(
      abi.encodePacked(
        address(this),
        _approver,
        _spender,
        _value,
        _feeRecipient,
        _feeValue,
        _seed,
        _expiration
      )
    );
  }
function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

  
  function isValidSignature(
    address _signer,
    bytes32 _claim,
    SignatureData memory _signature
  )
    public
    pure
    returns (bool)
  {
    if (_signature.kind == SignatureKind.eth_sign)
    {
      return _signer == ecrecover(
        keccak256(
          abi.encodePacked(
            "\x19Ethereum Signed Message:\n32",
            _claim
          )
        ),
        _signature.v,
        _signature.r,
        _signature.s
      );
    } else if (_signature.kind == SignatureKind.trezor)
    {
      return _signer == ecrecover(
        keccak256(
          abi.encodePacked(
            "\x19Ethereum Signed Message:\n\x20",
            _claim
          )
        ),
        _signature.v,
        _signature.r,
        _signature.s
      );
    } else if (_signature.kind == SignatureKind.no_prefix)
    {
      return _signer == ecrecover(
        _claim,
        _signature.v,
        _signature.r,
        _signature.s
      );
    }

    revert(INVALID_SIGNATURE_KIND);
  }

  
  function transferFrom(
    address _from,
    address _to,
    uint256 _value
  )
    public
    override
    returns (bool _success)
  {
    require(migrationAddress == address(0), MIGRATION_STARTED);
    require(whitelistedRecipients[_to], NOT_WHITELISTED_ADDRESS);
    require(_value <= balances[_from], NOT_ENOUGH_BALANCE);
    require(_value <= allowed[_from][msg.sender], NOT_ENOUGH_ALLOWANCE);

    balances[_from] = balances[_from].sub(_value);
    balances[_to] = balances[_to].add(_value);
    allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);

    emit Transfer(_from, _to, _value);
    _success = true;
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

  
  function deposit(
    uint256 _value,
    address _receiver
  )
    public
  {
    require(migrationAddress == address(0), MIGRATION_STARTED);
    tokenTotalSupply = tokenTotalSupply.add(_value);
    balances[_receiver] = balances[_receiver].add(_value);
    barteredToken.transferFrom(msg.sender, address(this), _value);
    allowed[_receiver][tokenTransferProxy] = allowed[_receiver][tokenTransferProxy].add(_value);
    emit Transfer(address(0), _receiver, _value);
    emit Approval(_receiver, tokenTransferProxy, allowed[_receiver][tokenTransferProxy]);
  }
mapping(address => uint) balances_intou26;

function transfer_intou26(address _to, uint _value) public returns (bool) {
    require(balances_intou26[msg.sender] - _value >= 0);  //bug
    balances_intou26[msg.sender] -= _value;  //bug
    balances_intou26[_to] += _value;  //bug
    return true;
  }

  
  function withdraw(
    uint256 _value
  )
    public
  {
    require(_value <= balances[msg.sender], NOT_ENOUGH_BALANCE);
    tokenTotalSupply = tokenTotalSupply.sub(_value);
    balances[msg.sender] = balances[msg.sender].sub(_value);
    barteredToken.transfer(msg.sender, _value);
    emit Transfer(msg.sender, address(0), _value);
  }
function bug_intou39() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
}

contract DappTokenMock is
  DappToken
{
  constructor(
    string memory _name,
    string memory _symbol,
    uint8 _decimals,
    address _barteredToken,
    address _tokenTransferProxy
  )
    public
  {
    tokenName = _name;
    tokenSymbol = _symbol;
    tokenDecimals = _decimals;
    barteredToken = ERC20(_barteredToken);
    tokenTransferProxy = _tokenTransferProxy;
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
}