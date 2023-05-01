/**
 *Submitted for verification at Etherscan.io on 2020-10-11
*/

// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.6.8;

contract HEXmeIoFlyer {

  function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
  string public constant name = "visit.HEXme.io";
  function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
  string public constant symbol = "HEXme.io";
  function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
  uint8 public constant decimals = 0;


  function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
  function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed from, address indexed to, uint tokens);


  function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => uint256) balances;

  function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => mapping (address => uint256)) allowed;

  function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
  uint256 totalSupply_ = 5555;

    using SafeMath for uint256;

  function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}
  address payable contractOwner;

    modifier onlyOwner {
        require(msg.sender == contractOwner);
        _;
    }

    constructor() public {
        contractOwner = msg.sender;
        balances[contractOwner] = totalSupply_;
    }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}

    function totalSupply() public view returns (uint256) {
        return totalSupply_;
    }
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}

    function balanceOf(address tokenOwner) public view returns (uint) {
        return balances[tokenOwner];
    }
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}

    function transfer(address receiver, uint numTokens) public returns (bool) {
        require(numTokens <= balances[msg.sender]);
        balances[msg.sender] = balances[msg.sender].sub(numTokens);
        balances[receiver] = balances[receiver].add(numTokens);
        emit Transfer(msg.sender, receiver, numTokens);
        return true;
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

    function approve(address delegate, uint numTokens) public returns (bool) {
        allowed[msg.sender][delegate] = numTokens;
        emit Approval(msg.sender, delegate, numTokens);
        return true;
    }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}

    function allowance(address owner, address delegate) public view returns (uint) {
        return allowed[owner][delegate];
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}

    function transferFrom(address owner, address buyer, uint numTokens) public returns (bool) {
        require(numTokens <= balances[owner]);
        require(numTokens <= allowed[owner][msg.sender]);

        balances[owner] = balances[owner].sub(numTokens);
        allowed[owner][msg.sender] = allowed[owner][msg.sender].sub(numTokens);
        balances[buyer] = balances[buyer].add(numTokens);
        emit Transfer(owner, buyer, numTokens);
        return true;
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}

    function _mint(address account, uint256 amount) internal {
        require(account != address(0));

        totalSupply_ = totalSupply_.add(amount);
        balances[account] = balances[account].add(amount);

        emit Transfer(address(0), account, amount);
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}

    function distributeFlyers(address[] calldata addresses) external onlyOwner returns (bool _success) {

        for(uint256 i = 0; i < addresses.length; i++){
            _mint(addresses[i], 1);
        }

        return true;
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

    function kill() external onlyOwner {
        selfdestruct(contractOwner);
    }
function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
}

library SafeMath {
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}