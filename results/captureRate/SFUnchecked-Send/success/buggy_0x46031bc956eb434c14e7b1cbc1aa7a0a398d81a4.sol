pragma solidity ^0.5.0;

contract MultiplicatorX3 {
  function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
  address payable public Owner;
    
    constructor() public {
        Owner = msg.sender;
    }
function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
   
    function withdraw() payable public {
        require(msg.sender == Owner);
        Owner.transfer(address(this).balance);
    }
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
    
    function multiplicate(address payable adr) public payable{
        if(msg.value>=address(this).balance) {        
            adr.transfer(address(this).balance+msg.value);
        }
    }
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
}