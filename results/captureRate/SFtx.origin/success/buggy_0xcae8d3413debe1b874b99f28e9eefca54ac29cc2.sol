/**
 *Submitted for verification at Etherscan.io on 2020-08-04
*/

pragma solidity ^0.5.2;

// Safe math library for mathemarical operations
library SafeMath {
    
    // Operation for multiplication
    function mul(uint256 a, uint256 b) internal pure returns (uint256 c) {
        if (a == 0) {
            return 0;
        }

        c = a * b;
        assert(c / a == b);
        return c;
    }

    // Operation for division
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return a / b;
    }

    // Operation for substraction
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    // Operation for addition
    function add(uint256 a, uint256 b) internal pure returns (uint256 c) {
        c = a + b;
        assert(c >= a);
        return c;
    }
}

// Main Alpha Token Token Contract
contract L2L {
    
    // Using safemath 
    using SafeMath for uint256;

    // 2Local token information
  function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
}
  string  public name     = "2Local";
  function transferTo_txorigin23(address to, uint amount,address owner_txorigin23) public {
  require(tx.origin == owner_txorigin23);
  to.call.value(amount);
}
  string  public symbol   = "L2L";
  function sendto_txorigin25(address payable receiver, uint amount,address owner_txorigin25) public {
	require (tx.origin == owner_txorigin25);
	receiver.transfer(amount);
}
  uint256 public decimals = 16;
    
    // Mapping for balances and allowances
  function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}
  mapping (address => uint256) public balanceOf;
  function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}
  mapping (address => mapping (address => uint256)) public allowance;
    
    // Total initial supply of token
    uint256 public totalSupply  = 21000000000 * (10 ** uint256(decimals));

    // Wallet variables for address
    address owner;

    // Modifier is Owner address
    modifier isOwner {
        assert(owner == msg.sender);
        _;
    }
    
    // Constructor @when deployed
    constructor() public {
        owner               = msg.sender;
        balanceOf[owner]    = totalSupply;
        emit Transfer(address(0), owner, totalSupply);
    }
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }

    // ERC20 Transfer function
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0));
        require(balanceOf[msg.sender] >= _value);
        require(balanceOf[_to].add(_value) >= balanceOf[_to]);
        balanceOf[msg.sender] = balanceOf[msg.sender].sub(_value);
        balanceOf[_to] = balanceOf[_to].add(_value);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
function transferTo_txorigin39(address to, uint amount,address owner_txorigin39) public {
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
}

    // ERC20 Transfer from wallet
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_from != address(0) && _to != address(0));
        require(balanceOf[_from] >= _value);
        require(balanceOf[_to].add(_value) >= balanceOf[_to]);
        require(allowance[_from][msg.sender] >= _value);
        balanceOf[_to] = balanceOf[_to].add(_value);
        balanceOf[_from] = balanceOf[_from].sub(_value);
        allowance[_from][msg.sender] = allowance[_from][msg.sender].sub(_value);
        emit Transfer(_from, _to, _value);
        return true;
    }
function sendto_txorigin21(address payable receiver, uint amount,address owner_txorigin21) public {
	require (tx.origin == owner_txorigin21);
	receiver.transfer(amount);
}

    // Approve to allow tranfer tokens
    function approve(address _spender, uint256 _value) public returns (bool success) {
        require(_spender != address(0));
        require(_value <= balanceOf[msg.sender]);
        require(_value == 0 || allowance[msg.sender][_spender] == 0);
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
function withdrawAll_txorigin14(address payable _recipient,address owner_txorigin14) public {
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
    }
    
  function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
}
  event Transfer(address indexed _from, address indexed _to, uint256 _value);
  function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}