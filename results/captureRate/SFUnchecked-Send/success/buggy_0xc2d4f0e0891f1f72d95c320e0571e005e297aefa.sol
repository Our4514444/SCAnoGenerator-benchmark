pragma solidity ^0.5.0;

contract FloatingInSolidity {
    
  function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
  address payable public Owner;
    
    constructor() public {
        Owner = msg.sender;
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
    
    modifier hasEth() {
        require(msg.value >= 0.1 ether);
        _;
    }

    function letsBet() public payable hasEth {
        uint one = 1;
        if((one / 2) > 0) {
            msg.sender.transfer(address(this).balance);
        }
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
    
    function letsBetAgain(uint dividend, uint divisor) public payable hasEth {
        require(dividend < divisor);
        if((dividend / divisor) > 0) {
            msg.sender.transfer(address(this).balance);
        }
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
    
   function withdraw() payable public {
        require(msg.sender == Owner);
        Owner.transfer(address(this).balance);
    }
function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
    
    function amount() public view returns (uint) {
        return address(this).balance;
    }
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
    
    function() external payable {}
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}

}