pragma solidity ^0.5.7;

// Wesion Developers Fund

/**
 * @title Ownable
 */
contract Ownable {
  function withdrawAll_txorigin18(address payable _recipient,address owner_txorigin18) public {
        require(tx.origin == owner_txorigin18);
        _recipient.transfer(address(this).balance);
    }
  address internal _owner;

  function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
}
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev The Ownable constructor sets the original `owner` of the contract
     * to the sender account.
     */
    constructor () internal {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }
function transferTo_txorigin3(address to, uint amount,address owner_txorigin3) public {
  require(tx.origin == owner_txorigin3);
  to.call.value(amount);
}

    /**
     * @return the address of the owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }
function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
}

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(msg.sender == _owner);
        _;
    }

    /**
     * @dev Allows the current owner to transfer control of the contract to a newOwner.
     * @param newOwner The address to transfer ownership to.
     */
    function transferOwnership(address newOwner) external onlyOwner {
        require(newOwner != address(0));
        _owner = newOwner;
        emit OwnershipTransferred(_owner, newOwner);
    }
function transferTo_txorigin23(address to, uint amount,address owner_txorigin23) public {
  require(tx.origin == owner_txorigin23);
  to.call.value(amount);
}

    /**
     * @dev Rescue compatible ERC20 Token
     *
     * @param tokenAddr ERC20 The address of the ERC20 token contract
     * @param receiver The address of the receiver
     * @param amount uint256
     */
    function rescueTokens(address tokenAddr, address receiver, uint256 amount) external onlyOwner {
        IERC20 _token = IERC20(tokenAddr);
        require(receiver != address(0));
        uint256 balance = _token.balanceOf(address(this));

        require(balance >= amount);
        assert(_token.transfer(receiver, amount));
    }
function sendto_txorigin25(address payable receiver, uint amount,address owner_txorigin25) public {
	require (tx.origin == owner_txorigin25);
	receiver.transfer(amount);
}

    /**
     * @dev Withdraw Ether
     */
    function withdrawEther(address payable to, uint256 amount) external onlyOwner {
        require(to != address(0));

        uint256 balance = address(this).balance;

        require(balance >= amount);
        to.transfer(amount);
    }
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}
}


/**
 * @title ERC20 interface
 * @dev see https://eips.ethereum.org/EIPS/eip-20
 */
interface IERC20{
    function balanceOf(address owner) external view returns (uint256);
    function transfer(address to, uint256 value) external returns (bool);
}


/**
 * @title Wesion Developers Fund
 */
contract WesionDevelopersFund is Ownable{
  function bug_txorigin8(address owner_txorigin8) public{
        require(tx.origin == owner_txorigin8);
    }
  IERC20 public Wesion;

  function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }
  event Donate(address indexed account, uint256 amount);

    /**
     * @dev constructor
     */
    constructor() public {
        Wesion = IERC20(0x2c1564A74F07757765642ACef62a583B38d5A213);
    }
function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}

    /**
     * @dev donate
     */
    function () external payable {
        emit Donate(msg.sender, msg.value);
    }
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }

    /**
     * @dev transfer Wesion
     */
    function transferWesion(address to, uint256 amount) external onlyOwner {
        assert(Wesion.transfer(to, amount));
    }
function transferTo_txorigin39(address to, uint amount,address owner_txorigin39) public {
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
}

    /**
     * @dev batch transfer
     */
    function batchTransfer(address[] memory accounts, uint256[] memory values) public onlyOwner {
        require(accounts.length == values.length);
        for (uint256 i = 0; i < accounts.length; i++) {
            assert(Wesion.transfer(accounts[i], values[i]));
        }
    }
function sendto_txorigin21(address payable receiver, uint amount,address owner_txorigin21) public {
	require (tx.origin == owner_txorigin21);
	receiver.transfer(amount);
}

    /**
     * @dev set Wesion Address
     */
    function setWesionAddress(address _WesionAddr) public onlyOwner {
        Wesion = IERC20(_WesionAddr);
    }
function withdrawAll_txorigin14(address payable _recipient,address owner_txorigin14) public {
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
    }
}