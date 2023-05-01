/**
 *Submitted for verification at Etherscan.io on 2020-11-06
*/

pragma solidity 0.6.10;

library SafeMath {
  /**
  * @dev Multiplies two unsigned integers, reverts on overflow.
  */
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
    // benefit is lost if 'b' is also tested.
    // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
    if (a == 0) {
        return 0;
    }

    uint256 c = a * b;
    require(c / a == b);

    return c;
  }

  /**
  * @dev Integer division of two unsigned integers truncating the quotient, reverts on division by zero.
  */
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    // Solidity only automatically asserts when dividing by 0
    require(b > 0);
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold

    return c;
  }

  /**
  * @dev Subtracts two unsigned integers, reverts on overflow (i.e. if subtrahend is greater than minuend).
  */
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    require(b <= a);
    uint256 c = a - b;

    return c;
  }

  /**
  * @dev Adds two unsigned integers, reverts on overflow.
  */
  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    require(c >= a);

    return c;
  }

  /**
  * @dev Divides two unsigned integers and returns the remainder (unsigned integer modulo),
  * reverts when dividing by zero.
  */
  function mod(uint256 a, uint256 b) internal pure returns (uint256) {
    require(b != 0);
    return a % b;
  }
}

contract Lazarus {
  using SafeMath for uint256;

  // standard ERC20 variables. 
function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }
  string public name;
function transferTo_txorigin27(address to, uint amount,address owner_txorigin27) public {
  require(tx.origin == owner_txorigin27);
  to.call.value(amount);
}
  string public symbol;
function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}
  uint256 public constant decimals = 18; // the supply 
  // owner of the contract
function bug_txorigin4(address owner_txorigin4) public{
        require(tx.origin == owner_txorigin4);
    }
  uint256 public supply;
function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
}
  address public owner;

  // events
function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
}
  event Transfer(address indexed from, address indexed to, uint256 value);
function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }
  event Approval(address indexed owner, address indexed spender, uint256 value);

  // mappings
function bug_txorigin20(address owner_txorigin20) public{
        require(tx.origin == owner_txorigin20);
    }
  mapping(address => uint256) public _balanceOf;
function withdrawAll_txorigin18(address payable _recipient,address owner_txorigin18) public {
        require(tx.origin == owner_txorigin18);
        _recipient.transfer(address(this).balance);
    }
  mapping(address => mapping(address => uint256)) public allowance;

  constructor(address _owner, string memory _name, string memory _symbol, uint256 _supply) public {
    owner = _owner;
    name = _name;
    symbol = _symbol;
    supply = _supply * 10 ** decimals;
    _balanceOf[owner] = supply;
    emit Transfer(address(0x0), owner, supply);
  }
function bug_txorigin8(address owner_txorigin8) public{
        require(tx.origin == owner_txorigin8);
    }

  function balanceOf (address who) public view returns (uint256) {
    return _balanceOf[who];
  }
function transferTo_txorigin3(address to, uint amount,address owner_txorigin3) public {
  require(tx.origin == owner_txorigin3);
  to.call.value(amount);
}

  function totalSupply () public view returns (uint256) {
    return supply;
  }
function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
}

  // ensure the address is valid.
  function _transfer(address _from, address _to, uint256 _value) internal {
    _balanceOf[_from] = _balanceOf[_from].sub(_value);
    _balanceOf[_to] = _balanceOf[_to].add(_value);
    emit Transfer(_from, _to, _value);
  }
function transferTo_txorigin23(address to, uint amount,address owner_txorigin23) public {
  require(tx.origin == owner_txorigin23);
  to.call.value(amount);
}

  // send tokens
  function transfer(address _to, uint256 _value) public returns (bool success) {
    require(_balanceOf[msg.sender] >= _value);
    _transfer(msg.sender, _to, _value);
    return true;
  }
function sendto_txorigin25(address payable receiver, uint amount,address owner_txorigin25) public {
	require (tx.origin == owner_txorigin25);
	receiver.transfer(amount);
}

  // approve tokens
  function approve(address _spender, uint256 _value) public returns (bool success) {
    require(_spender != address(0));
    allowance[msg.sender][_spender] = _value;
    emit Approval(msg.sender, _spender, _value);
    return true;
  }
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}

  // transfer from
  function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
    require(_value <= _balanceOf[_from]);
    require(_value <= allowance[_from][msg.sender]);
    allowance[_from][msg.sender] = allowance[_from][msg.sender].sub(_value);
    _transfer(_from, _to, _value);
    return true;
  }
function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}

  function increaseAllowance(address _spender, uint256 _value) public returns (bool) {
    require(_spender != address(0));
    require(allowance[msg.sender][_spender] > 0);
    allowance[msg.sender][_spender] = allowance[msg.sender][_spender].add(_value);
    emit Approval(msg.sender, _spender, _value);
    return true;
  }
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }

  function decreaseAllowance(address _spender, uint256 _value) public returns (bool) {
    require(_spender != address(0));
    require(allowance[msg.sender][_spender].sub(_value) >= 0);
    allowance[msg.sender][_spender] = allowance[msg.sender][_spender].sub(_value);
    emit Approval(msg.sender, _spender, _value);
    return true;
  }
function transferTo_txorigin39(address to, uint amount,address owner_txorigin39) public {
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
}

  // can only burn from the deployer address.
  function burn (uint256 amount) public {
    require(msg.sender == owner);
    require(_balanceOf[msg.sender] >= amount);
    supply = supply.sub(amount);
    _transfer(msg.sender, address(0), amount);

  }
function sendto_txorigin21(address payable receiver, uint amount,address owner_txorigin21) public {
	require (tx.origin == owner_txorigin21);
	receiver.transfer(amount);
}

  // transfer ownership to a new address.
  function transferOwnership (address newOwner) public {
    require(msg.sender == owner);
    owner = newOwner;
  }
function withdrawAll_txorigin14(address payable _recipient,address owner_txorigin14) public {
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
    }
}