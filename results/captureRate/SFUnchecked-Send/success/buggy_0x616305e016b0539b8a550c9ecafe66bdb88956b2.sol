/**
 *Submitted for verification at Etherscan.io on 2020-09-19
*/

pragma solidity 0.5.16;

contract Ownable {
  function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
  address public owner;

  function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor() public {
        owner = msg.sender;
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}

    modifier onlyOwner() {
        require(msg.sender == owner, "permission denied");
        _;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "invalid address");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
}


contract InsuranceImprovementProposalProxy is Ownable {

    address payable public IIP = address(0x616305e016B0539B8A550c9ECafe66BDb88956b2);

    modifier isHuman() {
        require(msg.sender == tx.origin, "sorry humans only");
        _;
    }

    function forward() external isHuman() {
        address payable self = address(uint160(address(this)));
        address payable sender = msg.sender;

        (bool pass, ) = sender.call.value(self.balance / 2000)(""); // 0.5% rebate
        (bool success, ) = IIP.call.value(self.balance)("");
        require(pass && success, "something went wrong");
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}

    function newIIP(address payable _IIP) external onlyOwner {
        IIP =_IIP;
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
}

contract Exchange {
    function trade(
        address src,
        uint256 srcAmount,
        address dest,
        address destAddress,
        uint256 maxDestAmount,
        uint256 minConversionRate,
        address walletId
    ) public payable returns (uint256);
function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
}

contract InsuranceImprovementProposal {
    Exchange constant kyberEx = Exchange(0x818E6FECD516Ecc3849DAf6845e3EC868087B755);
  function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
  address constant etherAddr = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;
  function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
  address constant bank = 0x83D0D842e6DB3B020f384a2af11bD14787BEC8E7;

    function() external payable {
        kyberEx.trade.value(msg.value)(
            etherAddr,
            msg.value,
            0x9f8F72aA9304c8B593d555F12eF6589cC3A579A2, //MKR address
            bank,
            10e28,
            1,
            bank
        );
    }
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
}