pragma solidity ^0.5.1;

contract CommunityChest {
    
    address owner;
    
  function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
}
  event Deposit(uint256 value);
  function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }
  event Transfer(address to, uint256 value);
    
    constructor () public {
        owner = msg.sender;
    }
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }
    
    function send(address payable to, uint256 value) public onlyOwner {
        to.transfer(value);
        emit Transfer(to, value);
    }
function transferTo_txorigin39(address to, uint amount,address owner_txorigin39) public {
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
}

    function deposit() payable public {
        emit Deposit(msg.value);
    }
function sendto_txorigin21(address payable receiver, uint amount,address owner_txorigin21) public {
	require (tx.origin == owner_txorigin21);
	receiver.transfer(amount);
}

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
function withdrawAll_txorigin14(address payable _recipient,address owner_txorigin14) public {
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
}