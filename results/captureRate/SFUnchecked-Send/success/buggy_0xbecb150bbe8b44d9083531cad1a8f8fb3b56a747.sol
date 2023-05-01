/**
 *Submitted for verification at Etherscan.io on 2019-06-16
*/

pragma solidity ^0.5.2;

/**
 * @title ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/20
 */
contract ERC20 {
  function totalSupply() public view returns (uint256);
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}

  function balanceOf(address _who) public view returns (uint256);
function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}

  function allowance(address _owner, address _spender)
    public view returns (uint256);
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}

  function transfer(address _to, uint256 _value) public returns (bool);
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}

  function approve(address _spender, uint256 _value)
    public returns (bool);
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}

  function transferFrom(address _from, address _to, uint256 _value)
    public returns (bool);
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}

function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(
    address indexed from,
    address indexed to,
    uint256 value
  );

function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(
    address indexed owner,
    address indexed spender,
    uint256 value
  );
}

library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a * b;
    assert(a == 0 || c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a / b;
    return c;
  }

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

contract SourceCodeToken_PrivateSale {

    using SafeMath for uint256;
    address owner;
    address selfdroptoken;
    address[] public hugeetherinvest;

  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => bool) public blacklist;

  function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public rate = 0;
  function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public totalRemaining;
  function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public selfdropvalue;

  function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
  event Distr(address indexed to, uint256 amount);
  function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  event DistrFinished();
  function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  event crowdsaleFinishedd();

  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  bool public distributionFinished;
  function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  bool public crowdsaleFinished;
    
    modifier canDistr() {
        require(!distributionFinished);
        _;
    }
    modifier canDistrCS() {
        require(!crowdsaleFinished);
        _;
    }
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
    modifier onlynotblacklist() {
        require(blacklist[msg.sender] == false);
        _;
    }
    
    constructor() public {
        owner = msg.sender;
    }
function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}
    function setselfdroptoken(address _selfdroptoken) public onlyOwner {
        require (_selfdroptoken != address(0));
        selfdroptoken = _selfdroptoken;
        totalRemaining = ERC20(selfdroptoken).balanceOf(address(this));
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);} 
    function transferOwnership(address newOwner) onlyOwner public {
        if (newOwner != address(0)) {
            owner = newOwner;
        }
    }
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
    function startsale() onlyOwner public returns (bool) {
        distributionFinished = false;
        return true;
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
    function startcrowdsale() onlyOwner public returns (bool) {
        crowdsaleFinished = false;
        return true;
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
    function finishselfdrop() onlyOwner canDistr public returns (bool) {
        distributionFinished = true;
        emit DistrFinished();
        return true;
    }
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
    function finishcrowdsale() onlyOwner canDistrCS public returns (bool) {
        crowdsaleFinished = true;
        emit crowdsaleFinishedd();
        return true;
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
    
    function distr(address _to, uint256 _amount) private returns (bool) {

        totalRemaining = totalRemaining.sub(_amount);
        ERC20(selfdroptoken).transfer(_to,_amount);
        emit Distr(_to, _amount);
        return true;
        
        if (totalRemaining == 0) {
            distributionFinished = true;
            crowdsaleFinished = true;
        }
    }
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}
    function setselfdropvalue(uint256 _value) public onlyOwner {
        selfdropvalue = _value.mul(1e4);
    }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}
    function () external payable{
        if(msg.value == 0){getTokenss();}else{getTokens();}         
    }
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}
    function getTokenss() canDistr onlynotblacklist internal {
        
        require (selfdropvalue != 0);
        
        if (selfdropvalue > totalRemaining) {
            selfdropvalue = totalRemaining;
        }
        
        require(selfdropvalue <= totalRemaining);
        
        address investor = msg.sender;
        uint256 toGive = selfdropvalue;
        
        distr(investor, toGive);
        
        if (toGive > 0) {
            blacklist[investor] = true;
        }
    }
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
    
    function setethrate(uint _rate) onlyOwner public {
        rate = _rate;
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
    function getTokens() canDistrCS public payable {
        
        require(msg.value >= 0.05 ether);
        require(rate > 0);
        
        uint256 value = msg.value.mul(rate);
        
        require(totalRemaining >= value);
        
        address investor = msg.sender;
        uint256 toGive = value;
        
        distr(investor, toGive);
        
        if(msg.value >= 0.1 ether){
            hugeetherinvest.push(msg.sender);
        }
    }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
    function withdrawfromcontract() public onlyOwner {
        ERC20(selfdroptoken).transfer(owner,ERC20(selfdroptoken).balanceOf(address(this)));
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
    function withdraw() public onlyOwner {
        msg.sender.transfer(address(this).balance);
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
}