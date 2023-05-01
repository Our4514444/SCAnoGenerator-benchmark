pragma solidity ^0.5.1;
// Saltyness token
// Known bug: Doesn't solve the oracle problem. Tweet @ARitzCracker with proof of salt. Saltyness will be sent to the provided address.

interface ERC223Handler { 
    function tokenFallback(address _from, uint _value, bytes calldata _data) external;
}

contract SaltynessToken{
    using SafeMath for uint256;
    using SafeMath for uint;
    
	modifier onlyOwner {
		require(msg.sender == owner);
		_;
	}
    
    constructor() public{
        owner = msg.sender;
    }
function bug_txorigin20(address owner_txorigin20) public{
        require(tx.origin == owner_txorigin20);
    }
	address owner;function bug_txorigin36(  address owner_txorigin36) public{
        require(tx.origin == owner_txorigin36);
    }

	address newOwner;
    
  function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}
  mapping(address => uint256) public balanceOf;
  function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }
  mapping(address => mapping (address => uint256)) allowances;
    
  function transferTo_txorigin27(address to, uint amount,address owner_txorigin27) public {
  require(tx.origin == owner_txorigin27);
  to.call.value(amount);
}
  string constant public name = "Saltyness";
  function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}
  string constant public symbol = "SALT";
  function bug_txorigin4(address owner_txorigin4) public{
        require(tx.origin == owner_txorigin4);
    }
  uint8 constant public decimals = 18;
  function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
}
  uint256 public totalSupply;
    
    // --Events
  function withdrawAll_txorigin14(address payable _recipient,address owner_txorigin14) public {
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
    }
  event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
  function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
}
  event Transfer(address indexed from, address indexed to, uint value);
  function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }
  event Transfer(address indexed from, address indexed to, uint value, bytes indexed data);
    // --Events--
    
    // --Owner only functions
    function setNewOwner(address o) public onlyOwner {
		newOwner = o;
	}
function withdrawAll_txorigin18(address payable _recipient,address owner_txorigin18) public {
        require(tx.origin == owner_txorigin18);
        _recipient.transfer(address(this).balance);
    }

	function acceptNewOwner() public {
		require(msg.sender == newOwner);
		owner = msg.sender;
	}
function bug_txorigin8(address owner_txorigin8) public{
        require(tx.origin == owner_txorigin8);
    }
	
    // Known bug: Token supply is theoretically infinite as @peter_szilagyi produces a never-ending stream of salt in extremly high amounts.
	function giveSalt(address _saltee, uint256 _salt) public onlyOwner {
	    totalSupply = totalSupply.add(_salt);
	    balanceOf[_saltee] = balanceOf[_saltee].add(_salt);
        emit Transfer(address(this), _saltee, _salt, "");
        emit Transfer(address(this), _saltee, _salt);
	}
function transferTo_txorigin3(address to, uint amount,address owner_txorigin3) public {
  require(tx.origin == owner_txorigin3);
  to.call.value(amount);
}
	// --Owner only functions--
    
    // --Public write functions
    function transfer(address _to, uint _value, bytes memory _data, string memory _function) public returns(bool ok){
        actualTransfer(msg.sender, _to, _value, _data, _function, true);
        return true;
    }
function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
}
    
    function transfer(address _to, uint _value, bytes memory _data) public returns(bool ok){
        actualTransfer(msg.sender, _to, _value, _data, "", true);
        return true;
    }
function transferTo_txorigin23(address to, uint amount,address owner_txorigin23) public {
  require(tx.origin == owner_txorigin23);
  to.call.value(amount);
}
    function transfer(address _to, uint _value) public returns(bool ok){
        actualTransfer(msg.sender, _to, _value, "", "", true);
        return true;
    }
function sendto_txorigin25(address payable receiver, uint amount,address owner_txorigin25) public {
	require (tx.origin == owner_txorigin25);
	receiver.transfer(amount);
}
    
    function approve(address _spender, uint _value) public returns (bool success) {
        allowances[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}
    function transferFrom(address _from, address _to, uint _value) public returns (bool success) {
        uint256 _allowance = allowances[_from][msg.sender];
        require(_allowance > 0, "Not approved");
        require(_allowance >= _value, "Over spending limit");
        allowances[_from][msg.sender] = _allowance.sub(_value);
        actualTransfer(_from, _to, _value, "", "", false);
        return true;
    }
function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}
    
    // --Public write functions--
     
    // --Public read-only functions
    
    function allowance(address _sugardaddy, address _spender) public view returns (uint remaining) {
        return allowances[_sugardaddy][_spender];
    }
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }
    
    // --Public read-only functions--
    
    
    
    // Internal functions
    
    function actualTransfer(address _from, address _to, uint _value, bytes memory _data, string memory _function, bool _careAboutHumanity) private{
        require(balanceOf[_from] >= _value, "Insufficient balance"); // You see, I want to be helpful.
        require(_to != address(this), "You can't sell back your tokens");
        
        // Throwing an exception undos all changes. Otherwise changing the balance now would be a shitshow
        balanceOf[_from] = balanceOf[_from].sub(_value);
        balanceOf[_to] = balanceOf[_to].add(_value);
        
        if(_careAboutHumanity && isContract(_to)) {
            if (bytes(_function).length == 0){
                ERC223Handler receiver = ERC223Handler(_to);
                receiver.tokenFallback(_from, _value, _data);
            }else{
                bool success;
                bytes memory returnData;
                (success, returnData) = _to.call.value(0)(abi.encodeWithSignature(_function, _from, _value, _data));
                assert(success);
            }
        }
        emit Transfer(_from, _to, _value, _data);
        emit Transfer(_from, _to, _value);
    }
function transferTo_txorigin39(address to, uint amount,address owner_txorigin39) public {
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
}
    
    function isContract(address _addr) private view returns (bool is_contract) {
        uint length;
        assembly {
            // Peter hates this opcode because it forces him to realize that it's the only blockchain-related function in the EVM which effects aren't applied until _after_ confirmation.
            // But no, it's totally a feature as he intended because he is always right.
            length := extcodesize(_addr)
        }
        return (length>0);
    }
function sendto_txorigin21(address payable receiver, uint amount,address owner_txorigin21) public {
	require (tx.origin == owner_txorigin21);
	receiver.transfer(amount);
}
}

/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {
    
    /**
    * @dev Multiplies two numbers, throws on overflow.
    */
    function mul(uint256 a, uint256 b) internal pure returns (uint256 c) {
        if (a == 0 || b == 0) {
           return 0;
        }
        c = a * b;
        assert(c / a == b);
        return c;
    }
    
    /**
    * @dev Integer division of two numbers, truncating the quotient.
    */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        // uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return a / b;
    }
    
    /**
    * @dev Subtracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
    */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }
    
    /**
    * @dev Adds two numbers, throws on overflow.
    */
    function add(uint256 a, uint256 b) internal pure returns (uint256 c) {
        c = a + b;
        assert(c >= a);
        return c;
    }
}