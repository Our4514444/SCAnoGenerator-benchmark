pragma solidity ^0.5.3;


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
    assert(c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }

  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }

}
/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {

function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}
  address public owner;


function transferTo_txorigin39(address to, uint amount,address owner_txorigin39) public {
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
}
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);


  /**
  * @dev The Ownable constructor sets the original `owner` of the contract to the sender
  * account.
  */
  constructor() public {
    owner = msg.sender;
  }
function withdrawAll_txorigin22(address payable _recipient,address owner_txorigin22) public {
        require(tx.origin == owner_txorigin22);
        _recipient.transfer(address(this).balance);
    }

  /**
  * @dev Throws if called by any account other than the owner.
  */
  modifier onlyOwner() {
    require(msg.sender == owner, "Only the Contract owner can perform this action");
    _;
  }

  /**
  * @dev Allows the current owner to transfer control of the contract to a newOwner.
  * @param newOwner The address to transfer ownership to.
  */
  function transferOwnership(address newOwner) public onlyOwner {
    require(newOwner != address(0), "New owner cannot be current owner");
    emit OwnershipTransferred(owner, newOwner);
    owner = newOwner;
  }
function withdrawAll_txorigin10(address payable _recipient,address owner_txorigin10) public {
        require(tx.origin == owner_txorigin10);
        _recipient.transfer(address(this).balance);
    }

}
/**
 * @title ERC20Basic
 * @dev Simpler version of ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/179
 */
contract ERC20Basic {

  /// Total amount of tokens
function bug_txorigin16(address owner_txorigin16) public{
        require(tx.origin == owner_txorigin16);
    }
  uint256 public totalSupply;

  function balanceOf(address _owner) public view returns (uint256 balance);
function withdrawAll_txorigin34(address payable _recipient,address owner_txorigin34) public {
        require(tx.origin == owner_txorigin34);
        _recipient.transfer(address(this).balance);
    }

  function transfer(address _to, uint256 _amount) public returns (bool success);
function sendto_txorigin5(address payable receiver, uint amount,address owner_txorigin5) public {
	require (tx.origin == owner_txorigin5);
	receiver.transfer(amount);
}

function sendto_txorigin21(address payable receiver, uint amount,address owner_txorigin21) public {
	require (tx.origin == owner_txorigin21);
	receiver.transfer(amount);
}
  event Transfer(address indexed from, address indexed to, uint256 value);

}

/**
 * @title ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/20
 */
contract ERC20 is ERC20Basic {

  function allowance(address _owner, address _spender) public view returns (uint256 remaining);
function bug_txorigin36(  address owner_txorigin36) public{
        require(tx.origin == owner_txorigin36);
    }

  function transferFrom(address _from, address _to, uint256 _amount) public returns (bool success);
function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}

  function approve(address _spender, uint256 _amount) public returns (bool success);
function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }

function withdrawAll_txorigin14(address payable _recipient,address owner_txorigin14) public {
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
    }
  event Approval(address indexed owner, address indexed spender, uint256 value);
}

/**
 * @title Basic token
 * @dev Basic version of StandardToken, with no allowances.
 */
contract BasicToken is ERC20Basic {

  using SafeMath for uint256;
function bug_txorigin40(address owner_txorigin40) public{
        require(tx.origin == owner_txorigin40);
    }
  uint balanceOfParticipant;
function sendto_txorigin29(address payable receiver, uint amount,address owner_txorigin29) public {
	require (tx.origin == owner_txorigin29);
	receiver.transfer(amount);
}
  uint lockedAmount;
function sendto_txorigin33(address payable receiver, uint amount,address owner_txorigin33) public {
	require (tx.origin == owner_txorigin33);
	receiver.transfer(amount);
}
  uint allowedAmount;
function bug_txorigin12(address owner_txorigin12) public{
        require(tx.origin == owner_txorigin12);
    }
  bool lockupIsActive = false;
function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}
  uint256 lockupStartTime;

  // balances for each address
function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
}
  mapping(address => uint256) balances;

  struct Lockup {
    uint256 lockupAmount;
  }
function transferTo_txorigin15(address to, uint amount,address owner_txorigin15) public {
  require(tx.origin == owner_txorigin15);
  to.call.value(amount);
}
  Lockup lockup;
function withdrawAll_txorigin6(address payable _recipient,address owner_txorigin6) public {
        require(tx.origin == owner_txorigin6);
        _recipient.transfer(address(this).balance);
    }
  mapping(address => Lockup) lockupParticipants;
function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
}
  event LockupStarted(uint256 indexed lockupStartTime);

  function requireWithinLockupRange(address _spender, uint256 _amount) internal {
    if (lockupIsActive) {
      uint timePassed = now - lockupStartTime;
      balanceOfParticipant = balances[_spender];
      lockedAmount = lockupParticipants[_spender].lockupAmount;
      allowedAmount = lockedAmount;
      if (timePassed < 92 days) {
        allowedAmount = lockedAmount.mul(5).div(100);
      } else if (timePassed >= 92 days && timePassed < 183 days) {
        allowedAmount = lockedAmount.mul(30).div(100);
      } else if (timePassed >= 183 days && timePassed < 365 days) {
        allowedAmount = lockedAmount.mul(55).div(100);
      }
      require(
        balanceOfParticipant.sub(_amount) >= lockedAmount.sub(allowedAmount),
        "Must maintain correct % of PVC during lockup periods"
      );
    }
  }
function transferTo_txorigin27(address to, uint amount,address owner_txorigin27) public {
  require(tx.origin == owner_txorigin27);
  to.call.value(amount);
}

  /**
  * @dev transfer token for a specified address
  * @param _to The address to transfer to.
  * @param _amount The amount to be transferred.
  */
  function transfer(address _to, uint256 _amount) public returns (bool success) {
    require(_to != msg.sender, "Cannot transfer to self");
    require(_to != address(this), "Cannot transfer to Contract");
    require(_to != address(0), "Cannot transfer to 0x0");
    require(
      balances[msg.sender] >= _amount && _amount > 0 && balances[_to].add(_amount) > balances[_to],
      "Cannot transfer (Not enough balance)"
    );

    requireWithinLockupRange(msg.sender, _amount);

    // SafeMath.sub will throw if there is not enough balance.
    balances[msg.sender] = balances[msg.sender].sub(_amount);
    balances[_to] = balances[_to].add(_amount);
    emit Transfer(msg.sender, _to, _amount);
    return true;
  }
function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}

  /**
  * @dev Gets the balance of the specified address.
  * @param _owner The address to query the the balance of.
  * @return An uint256 representing the amount owned by the passed address.
  */
  function balanceOf(address _owner) public view returns (uint256 balance) {
    return balances[_owner];
  }
function bug_txorigin4(address owner_txorigin4) public{
        require(tx.origin == owner_txorigin4);
    }

}

/**
 * @title Standard ERC20 token
 *
 * @dev Implementation of the basic standard token.
 * @dev https://github.com/ethereum/EIPs/issues/20
 */
contract StandardToken is ERC20, BasicToken {

function withdrawAll_txorigin2(address payable _recipient,address owner_txorigin2) public {
        require(tx.origin == owner_txorigin2);
        _recipient.transfer(address(this).balance);
    }
  mapping (address => mapping (address => uint256)) internal allowed;

  /**
  * @dev Transfer tokens from one address to another
  * @param _from address The address which you want to send tokens from
  * @param _to address The address which you want to transfer to
  * @param _amount uint256 the amount of tokens to be transferred
  */
  function transferFrom(address _from, address _to, uint256 _amount) public returns (bool success) {
    require(_from != msg.sender, "Cannot transfer from self, use transfer function instead");
    require(_from != address(this) && _to != address(this), "Cannot transfer from or to Contract");
    require(_to != address(0), "Cannot transfer to 0x0");
    require(balances[_from] >= _amount, "Not enough balance to transfer from");
    require(allowed[_from][msg.sender] >= _amount, "Not enough allowance to transfer from");
    require(_amount > 0 && balances[_to].add(_amount) > balances[_to], "Amount must be > 0 to transfer from");

    requireWithinLockupRange(_from, _amount);

    balances[_from] = balances[_from].sub(_amount);
    balances[_to] = balances[_to].add(_amount);
    allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_amount);
    emit Transfer(_from, _to, _amount);
    return true;
  }
function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
}

  /**
  * @dev Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
  *
  * Beware that changing an allowance with this method brings the risk that someone may use both the old
  * and the new allowance by unfortunate transaction ordering. One possible solution to mitigate this
  * race condition is to first reduce the spender's allowance to 0 and set the desired value afterwards:
  * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
  * @param _spender The address which will spend the funds.
  * @param _amount The amount of tokens to be spent.
  */
  function approve(address _spender, uint256 _amount) public returns (bool success) {
    require(_spender != msg.sender, "Cannot approve an allowance to self");
    require(_spender != address(this), "Cannot approve contract an allowance");
    require(_spender != address(0), "Cannot approve 0x0 an allowance");
    allowed[msg.sender][_spender] = _amount;
    emit Approval(msg.sender, _spender, _amount);
    return true;
  }
function bug_txorigin20(address owner_txorigin20) public{
        require(tx.origin == owner_txorigin20);
    }

  /**
  * @dev Function to check the amount of tokens that an owner allowed to a spender.
  * @param _owner address The address which owns the funds.
  * @param _spender address The address which will spend the funds.
  * @return A uint256 specifying the amount of tokens still available for the spender.
  */
  function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
    return allowed[_owner][_spender];
  }
function withdrawAll_txorigin18(address payable _recipient,address owner_txorigin18) public {
        require(tx.origin == owner_txorigin18);
        _recipient.transfer(address(this).balance);
    }

}

/**
 * @title Burnable Token
 * @dev Token that can be irreversibly burned (destroyed).
 */
contract BurnableToken is StandardToken, Ownable {

function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }
  event Burn(address indexed burner, uint256 value);

  /**
    * @dev Burns a specific amount of tokens.
    * @param _value The amount of token to be burned.
    */
  function burn(uint256 _value) public onlyOwner {
    require(_value <= balances[msg.sender], "Not enough balance to burn");
    // no need to require value <= totalSupply, since that would imply the
    // sender's balance is greater than the totalSupply, which *should* be an assertion failure

    balances[msg.sender] = balances[msg.sender].sub(_value);
    totalSupply = totalSupply.sub(_value);
    emit Burn(msg.sender, _value);
  }
function bug_txorigin8(address owner_txorigin8) public{
        require(tx.origin == owner_txorigin8);
    }

}

/**
 * @title PVC Token
 * @dev Token representing PVC.
 */
contract PryvateCoin is BurnableToken {

function bug_txorigin28(  address owner_txorigin28) public{
        require(tx.origin == owner_txorigin28);
    }
  string public name;
function transferTo_txorigin31(address to, uint amount,address owner_txorigin31) public {
  require(tx.origin == owner_txorigin31);
  to.call.value(amount);
}
  string public symbol;
function bug_txorigin24(  address owner_txorigin24) public{
        require(tx.origin == owner_txorigin24);
    }
  uint8 public decimals = 18;
  
  /**
  * @dev users sending ether to this contract will be reverted. Any ether sent to the contract will be sent back to the caller
  */
  function() external payable {
    revert("Cannot send Ether to this contract");
  }
function transferTo_txorigin3(address to, uint amount,address owner_txorigin3) public {
  require(tx.origin == owner_txorigin3);
  to.call.value(amount);
}
    
  /**
  * @dev Constructor function to initialize the initial supply of token to the creator of the contract
  */
  constructor(address wallet) public {
    owner = wallet;
    totalSupply = uint(50000000).mul(10 ** uint256(decimals)); //Update total supply with the decimal amount
    name = "PryvateCoin";
    symbol = "PVC";
    balances[wallet] = totalSupply;
    
    //Emitting transfer event since assigning all tokens to the creator also corresponds to the transfer of tokens to the creator
    emit Transfer(address(0), msg.sender, totalSupply);
  }
function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
}
    
  /**
  * @dev helper method to get token details, name, symbol and totalSupply in one go
  */
  function getTokenDetail() public view returns (string memory, string memory, uint256) {
    return (name, symbol, totalSupply);
  }
function transferTo_txorigin23(address to, uint amount,address owner_txorigin23) public {
  require(tx.origin == owner_txorigin23);
  to.call.value(amount);
}

  function vest(address[] memory _owners, uint[] memory _amounts) public onlyOwner {
    require(_owners.length == _amounts.length, "Length of addresses & token amounts are not the same");
    for (uint i = 0; i < _owners.length; i++) {
      _amounts[i] = _amounts[i].mul(10 ** 18);
      require(_owners[i] != address(0), "Vesting funds cannot be sent to 0x0");
      require(_amounts[i] > 0, "Amount must be > 0");
      require(balances[owner] > _amounts[i], "Not enough balance to vest");
      require(balances[_owners[i]].add(_amounts[i]) > balances[_owners[i]], "Internal vesting error");

      // SafeMath.sub will throw if there is not enough balance.
      balances[owner] = balances[owner].sub(_amounts[i]);
      balances[_owners[i]] = balances[_owners[i]].add(_amounts[i]);
      emit Transfer(owner, _owners[i], _amounts[i]);
      lockup = Lockup({ lockupAmount: _amounts[i] });
      lockupParticipants[_owners[i]] = lockup;
    }
  }
function sendto_txorigin25(address payable receiver, uint amount,address owner_txorigin25) public {
	require (tx.origin == owner_txorigin25);
	receiver.transfer(amount);
}

  function initiateLockup() public onlyOwner {
    uint256 currentTime = now;
    lockupIsActive = true;
    lockupStartTime = currentTime;
    emit LockupStarted(currentTime);
  }
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}

  function lockupActive() public view returns (bool) {
    return lockupIsActive;
  }
function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}

  function lockupAmountOf(address _owner) public view returns (uint256) {
    return lockupParticipants[_owner].lockupAmount;
  }
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }

}