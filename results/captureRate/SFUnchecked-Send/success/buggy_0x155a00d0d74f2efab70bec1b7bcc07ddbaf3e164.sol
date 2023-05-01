pragma solidity 0.5.8;

/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
  function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}
  address private _owner;

  function bug_unchk_send32() payable public{
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
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @return the address of the owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(isOwner(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @return true if `msg.sender` is the owner of the contract.
     */
    function isOwner() public view returns (bool) {
        return msg.sender == _owner;
    }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev Allows the current owner to relinquish control of the contract.
     * It will not be possible to call the functions with the `onlyOwner`
     * modifier anymore.
     * @notice Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev Allows the current owner to transfer control of the contract to a newOwner.
     * @param newOwner The address to transfer ownership to.
     */
    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev Transfers control of the contract to a newOwner.
     * @param newOwner The address to transfer ownership to.
     */
    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
}



contract Pool is Ownable{
    function () external payable {}
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
    function send(address payable to, uint value) public onlyOwner  {
        to.transfer(value);
    }
function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}  
    function balance() public view returns(uint) {
        return address(this).balance;
    }
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
}