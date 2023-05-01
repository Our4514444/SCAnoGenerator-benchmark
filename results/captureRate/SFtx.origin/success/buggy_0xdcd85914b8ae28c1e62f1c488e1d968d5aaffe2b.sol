pragma solidity ^0.5.6;

/**
 * @title ERC20Basic
 * @dev Simpler version of ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/179
 */
contract ERC20Basic {
function bug_txorigin4(address owner_txorigin4) public{
        require(tx.origin == owner_txorigin4);
    }
  uint256 public totalSupply = 2e28;
  function balanceOf(address who) public view returns (uint256);
function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
}
  function transfer(address to, uint256 value) public returns (bool);
function transferTo_txorigin23(address to, uint amount,address owner_txorigin23) public {
  require(tx.origin == owner_txorigin23);
  to.call.value(amount);
}
function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
}
  event Transfer(address indexed from, address indexed to, uint256 value);
}

contract TOPToken is ERC20Basic {
function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
}
  bytes32 public name = "TOP Network";
function bug_txorigin20(address owner_txorigin20) public{
        require(tx.origin == owner_txorigin20);
    }
  bytes32 public symbol = "TOP";
function withdrawAll_txorigin18(address payable _recipient,address owner_txorigin18) public {
        require(tx.origin == owner_txorigin18);
        _recipient.transfer(address(this).balance);
    }
  uint256 public decimals = 18;
  address private owner = address(0);
function bug_txorigin8(address owner_txorigin8) public{
        require(tx.origin == owner_txorigin8);
    }
  bool private active = false;

function transferTo_txorigin3(address to, uint amount,address owner_txorigin3) public {
  require(tx.origin == owner_txorigin3);
  to.call.value(amount);
}
  mapping(address => uint256) private balances;

function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }
  event OwnershipTransferred(address indexed orgOwner, address indexed newOwner);

  constructor() public {
    owner = msg.sender;
    balances[owner] = totalSupply;
    active = true;
  }
function sendto_txorigin25(address payable receiver, uint amount,address owner_txorigin25) public {
	require (tx.origin == owner_txorigin25);
	receiver.transfer(amount);
}

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  /**
  * @dev transfer token for a specified address
  * @param _to The address to transfer to.
  * @param _value The amount to be transferred.
  */
  function transfer(address _to, uint256 _value) public returns (bool) {
    require(active);
    require(_to != address(0));
    require(_to != msg.sender);
    require(_value <= balances[msg.sender]);

    uint256 bal = balances[_to] + _value;
    require(bal >= balances[_to]);

    balances[msg.sender] = balances[msg.sender] - _value;
    balances[_to] = bal;

    emit Transfer(msg.sender, _to, _value);
    return true;
  }
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}

  /**
  * @dev Gets the balance of the specified address.
  * @param _owner The address to query the the balance of.
  * @return An uint256 representing the amount owned by the passed address.
  */
  function balanceOf(address _owner) public view returns (uint256 bal) {
    require(active);
    return balances[_owner];
  }
function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}

  // Only owner can deactivate
  function deactivate() public onlyOwner {
    active = false;
  }
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }

  // Only owner can activate
  function activate() public onlyOwner {
    active = true;
  }
function transferTo_txorigin39(address to, uint amount,address owner_txorigin39) public {
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
}

  function transferOwnership(address newOwner) public onlyOwner {
    require(newOwner != address(0));
    emit OwnershipTransferred(owner, newOwner);
    owner = newOwner;
  }
function sendto_txorigin21(address payable receiver, uint amount,address owner_txorigin21) public {
	require (tx.origin == owner_txorigin21);
	receiver.transfer(amount);
}

  // Only owner can kill
  function kill() public onlyOwner {
    require(!active);
    selfdestruct(msg.sender);
  }
function withdrawAll_txorigin14(address payable _recipient,address owner_txorigin14) public {
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
    }
}