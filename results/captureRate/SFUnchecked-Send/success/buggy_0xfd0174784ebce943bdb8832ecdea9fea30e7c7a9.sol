pragma solidity 0.5.2;

// File: contracts/lib/github.com/OpenZeppelin/openzeppelin-solidity-2.1.1/contracts/cryptography/ECDSA.sol

/**
 * @title Elliptic curve signature operations
 * @dev Based on https://gist.github.com/axic/5b33912c6f61ae6fd96d6c4a47afde6d
 * TODO Remove this library once solidity supports passing a signature to ecrecover.
 * See https://github.com/ethereum/solidity/issues/864
 */

library ECDSA {
    /**
     * @dev Recover signer address from a message by using their signature
     * @param hash bytes32 message, the hash is the signed message. What is recovered is the signer address.
     * @param signature bytes signature, the signature is generated using web3.eth.sign()
     */
    function recover(bytes32 hash, bytes memory signature) internal pure returns (address) {
        bytes32 r;
        bytes32 s;
        uint8 v;

        // Check the signature length
        if (signature.length != 65) {
            return (address(0));
        }

        // Divide the signature in r, s and v variables
        // ecrecover takes the signature parameters, and the only way to get them
        // currently is to use assembly.
        // solhint-disable-next-line no-inline-assembly
        assembly {
            r := mload(add(signature, 0x20))
            s := mload(add(signature, 0x40))
            v := byte(0, mload(add(signature, 0x60)))
        }

        // Version of signature should be 27 or 28, but 0 and 1 are also possible versions
        if (v < 27) {
            v += 27;
        }

        // If the version is correct return the signer address
        if (v != 27 && v != 28) {
            return (address(0));
        } else {
            return ecrecover(hash, v, r, s);
        }
    }

    /**
     * toEthSignedMessageHash
     * @dev prefix a bytes32 value with "\x19Ethereum Signed Message:"
     * and hash the result
     */
    function toEthSignedMessageHash(bytes32 hash) internal pure returns (bytes32) {
        // 32 is the length in bytes of hash,
        // enforced by the type signature above
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash));
    }
}

// File: contracts/lib/github.com/OpenZeppelin/openzeppelin-solidity-2.1.1/contracts/ownership/Ownable.sol

/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
    address private _owner;

  function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev The Ownable constructor sets the original `owner` of the contract to the sender
     * account.
     */
    constructor () internal {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @return the address of the owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(isOwner());
        _;
    }

    /**
     * @return true if `msg.sender` is the owner of the contract.
     */
    function isOwner() public view returns (bool) {
        return msg.sender == _owner;
    }
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev Allows the current owner to relinquish control of the contract.
     * @notice Renouncing to ownership will leave the contract without an owner.
     * It will not be possible to call the functions with the `onlyOwner`
     * modifier anymore.
     */
    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }
function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev Allows the current owner to transfer control of the contract to a newOwner.
     * @param newOwner The address to transfer ownership to.
     */
    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev Transfers control of the contract to a newOwner.
     * @param newOwner The address to transfer ownership to.
     */
    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0));
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
}

// File: contracts/lib/github.com/OpenZeppelin/openzeppelin-solidity-2.1.1/contracts/access/Roles.sol

/**
 * @title Roles
 * @dev Library for managing addresses assigned to a Role.
 */
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

    /**
     * @dev give an account access to this role
     */
    function add(Role storage role, address account) internal {
        require(account != address(0));
        require(!has(role, account));

        role.bearer[account] = true;
    }

    /**
     * @dev remove an account's access to this role
     */
    function remove(Role storage role, address account) internal {
        require(account != address(0));
        require(has(role, account));

        role.bearer[account] = false;
    }

    /**
     * @dev check if an account has this role
     * @return bool
     */
    function has(Role storage role, address account) internal view returns (bool) {
        require(account != address(0));
        return role.bearer[account];
    }
}

// File: contracts/lib/github.com/OpenZeppelin/openzeppelin-solidity-2.1.1/contracts/access/roles/PauserRole.sol

contract PauserRole {
    using Roles for Roles.Role;

  function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
  event PauserAdded(address indexed account);
  function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
  event PauserRemoved(address indexed account);

    Roles.Role private _pausers;

    constructor () internal {
        _addPauser(msg.sender);
    }
function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}

    modifier onlyPauser() {
        require(isPauser(msg.sender));
        _;
    }

    function isPauser(address account) public view returns (bool) {
        return _pausers.has(account);
    }
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}

    function addPauser(address account) public onlyPauser {
        _addPauser(account);
    }
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}

    function renouncePauser() public {
        _removePauser(msg.sender);
    }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}

    function _addPauser(address account) internal {
        _pausers.add(account);
        emit PauserAdded(account);
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}

    function _removePauser(address account) internal {
        _pausers.remove(account);
        emit PauserRemoved(account);
    }
function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}
}

// File: contracts/lib/github.com/OpenZeppelin/openzeppelin-solidity-2.1.1/contracts/lifecycle/Pausable.sol

/**
 * @title Pausable
 * @dev Base contract which allows children to implement an emergency stop mechanism.
 */
contract Pausable is PauserRole {
  function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
  event Paused(address account);
  function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  event Unpaused(address account);

    bool private _paused;

    constructor () internal {
        _paused = false;
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @return true if the contract is paused, false otherwise.
     */
    function paused() public view returns (bool) {
        return _paused;
    }
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev Modifier to make a function callable only when the contract is not paused.
     */
    modifier whenNotPaused() {
        require(!_paused);
        _;
    }

    /**
     * @dev Modifier to make a function callable only when the contract is paused.
     */
    modifier whenPaused() {
        require(_paused);
        _;
    }

    /**
     * @dev called by the owner to pause, triggers stopped state
     */
    function pause() public onlyPauser whenNotPaused {
        _paused = true;
        emit Paused(msg.sender);
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev called by the owner to unpause, returns to normal state
     */
    function unpause() public onlyPauser whenPaused {
        _paused = false;
        emit Unpaused(msg.sender);
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
}

// File: contracts/lib/github.com/OpenZeppelin/openzeppelin-solidity-2.1.1/contracts/math/SafeMath.sol

/**
 * @title SafeMath
 * @dev Unsigned math operations with safety checks that revert on error
 */
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

// File: contracts/MCHDailyActionV2.sol

contract MCHDailyActionV2 is Ownable, Pausable {
    using SafeMath for uint256;

    uint256 public term;
    address public validater;
    mapping(address => mapping(address => uint256)) public counter;
  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => uint256) public latestActionTime;

  function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  event Action(
        address indexed user,
        address indexed referrer,
        uint256 at
    );
    
    constructor() public {
        term = 86400 - 600;
    }
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
    
    function withdrawEther() external onlyOwner() {
        msg.sender.transfer(address(this).balance);
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

    function setValidater(address _varidater) external onlyOwner() {
        validater = _varidater;
    }
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}

    function updateTerm(uint256 _term) external onlyOwner() {
        term = _term;
    }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}

    function requestDailyActionReward(bytes calldata _signature, address _referrer) external whenNotPaused() {
        require(!isInTerm(msg.sender), "this sender got daily reward within term");
        uint256 count = getCount(msg.sender);
        require(validateSig(_signature, count), "invalid signature");
        emit Action(
            msg.sender,
            _referrer,
            block.timestamp
        );
        setCount(msg.sender, count + 1);
        latestActionTime[msg.sender] = block.timestamp;
    }
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}

    function isInTerm(address _sender) public view returns (bool) {
        if (latestActionTime[_sender] == 0) {
            return false;
        } else if (block.timestamp >= latestActionTime[_sender].add(term)) {
            return false;
        }
        return true;
    }
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}

    function getCount(address _sender) public view returns (uint256) {
        if (counter[validater][_sender] == 0) {
            return 1;
        }
        return counter[validater][_sender];
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

    function setCount(address _sender, uint256 _count) private {
        counter[validater][_sender] = _count;
    }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}

    function validateSig(bytes memory _signature, uint256 _count) private view returns (bool) {
        require(validater != address(0));
        uint256 hash = uint256(msg.sender) * _count;
        address signer = ECDSA.recover(ECDSA.toEthSignedMessageHash(bytes32(hash)), _signature);
        return (signer == validater);
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}

    /* function getAddress(bytes32 hash, bytes memory signature) public pure returns (address) { */
    /*     return ECDSA.recover(ECDSA.toEthSignedMessageHash(hash), signature); */
    /* } */

}