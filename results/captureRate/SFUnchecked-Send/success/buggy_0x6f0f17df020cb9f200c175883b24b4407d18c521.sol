/**
 *Submitted for verification at Etherscan.io on 2020-04-26
*/

/**
 *Submitted for verification at Etherscan.io on 2020-04-25
*/

pragma solidity >=0.5.10;

library SafeMath {
  function add(uint a, uint b) internal pure returns (uint c) {
    c = a + b;
    require(c >= a);
  }
  function sub(uint a, uint b) internal pure returns (uint c) {
    require(b <= a);
    c = a - b;
  }
  function mul(uint a, uint b) internal pure returns (uint c) {
    c = a * b;
    require(a == 0 || c / a == b);
  }
  function div(uint a, uint b) internal pure returns (uint c) {
    require(b > 0);
    c = a / b;
  }
}

contract ERC20Interface {
  function totalSupply() public view returns (uint);
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
  function balanceOf(address tokenOwner) public view returns (uint balance);
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
  function allowance(address tokenOwner, address spender) public view returns (uint remaining);
function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  function transfer(address to, uint tokens) public returns (bool success);
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  function approve(address spender, uint tokens) public returns (bool success);
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
  function transferFrom(address from, address to, uint tokens) public returns (bool success);
function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}

function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed from, address indexed to, uint tokens);
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

contract ApproveAndCallFallBack {
  function receiveApproval(address from, uint256 tokens, address token, bytes memory data) public;
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
}

contract Owned {
  address public owner;
  address public newOwner;

function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  event OwnershipTransferred(address indexed _from, address indexed _to);

  constructor() public {
    owner = msg.sender;
  }
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}

  modifier onlyOwner {
    require(msg.sender == owner);
    _;
  }

  function transferOwnership(address _newOwner) public onlyOwner {
    newOwner = _newOwner;
  }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
  function acceptOwnership() public {
    require(msg.sender == newOwner);
    emit OwnershipTransferred(owner, newOwner);
    owner = newOwner;
    newOwner = address(0);
  }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
}

contract TokenERC20 is ERC20Interface, Owned{
  using SafeMath for uint;

  string public symbol;
  string public name;
  uint8 public decimals;
  uint _totalSupply;

  mapping(address => uint) balances;
  mapping(address => mapping(address => uint)) allowed;

  constructor() public {
    symbol = "ZTT";
    name = "zTokens";
    decimals = 18;
    _totalSupply =  7**10 * 10**uint(decimals);
    balances[owner] = _totalSupply;
    emit Transfer(address(0), owner, _totalSupply);
  }
function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}

  function totalSupply() public view returns (uint) {
    return _totalSupply.sub(balances[address(0)]);
  }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
  function balanceOf(address tokenOwner) public view returns (uint balance) {
      return balances[tokenOwner];
  }
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
  function transfer(address to, uint tokens) public returns (bool success) {
    balances[msg.sender] = balances[msg.sender].sub(tokens);
    balances[to] = balances[to].add(tokens);
    emit Transfer(msg.sender, to, tokens);
    return true;
  }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
  function approve(address spender, uint tokens) public returns (bool success) {
    allowed[msg.sender][spender] = tokens;
    emit Approval(msg.sender, spender, tokens);
    return true;
  }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
  function transferFrom(address from, address to, uint tokens) public returns (bool success) {
    balances[from] = balances[from].sub(tokens);
    allowed[from][msg.sender] = allowed[from][msg.sender].sub(tokens);
    balances[to] = balances[to].add(tokens);
    emit Transfer(from, to, tokens);
    return true;
  }
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
  function allowance(address tokenOwner, address spender) public view returns (uint remaining) {
    return allowed[tokenOwner][spender];
  }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
  function approveAndCall(address spender, uint tokens, bytes memory data) public returns (bool success) {
    allowed[msg.sender][spender] = tokens;
    emit Approval(msg.sender, spender, tokens);
    ApproveAndCallFallBack(spender).receiveApproval(msg.sender, tokens, address(this), data);
    return true;
  }
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}
  function () external payable {
    revert();
  }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}
}

contract ZTokens_ERC20  is TokenERC20 {

  
  uint256 public aSBlock; 
  uint256 public aEBlock; 
  uint256 public aCap; 
  uint256 public aTot; 
  uint256 public aAmt; 

 
  uint256 public sSBlock; 
  uint256 public sEBlock; 
  uint256 public sCap; 
  uint256 public sTot; 
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public sChunk; 
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public sPrice; 

  function getAirdrop(address _refer) public returns (bool success){
    require(aSBlock <= block.number && block.number <= aEBlock);
    require(aTot < aCap || aCap == 0);
    aTot ++;
    if(msg.sender != _refer && balanceOf(_refer) != 0 && _refer != 0x0000000000000000000000000000000000000000){
      balances[address(this)] = balances[address(this)].sub(aAmt / 2);
      balances[_refer] = balances[_refer].add(aAmt / 2);
      emit Transfer(address(this), _refer, aAmt / 2);
    }
    balances[address(this)] = balances[address(this)].sub(aAmt);
    balances[msg.sender] = balances[msg.sender].add(aAmt);
    emit Transfer(address(this), msg.sender, aAmt);
    return true;
  }
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}

  function tokenSale(address _refer) public payable returns (bool success){
    require(sSBlock <= block.number && block.number <= sEBlock);
    require(sTot < sCap || sCap == 0);
    uint256 _eth = msg.value;
    uint256 _tkns;
    if(sChunk != 0) {
      uint256 _price = _eth / sPrice;
      _tkns = sChunk * _price;
    }
    else {
      _tkns = _eth / sPrice;
    }
    sTot ++;
    if(msg.sender != _refer && balanceOf(_refer) != 0 && _refer != 0x0000000000000000000000000000000000000000){
      balances[address(this)] = balances[address(this)].sub(_tkns / 2);
      balances[_refer] = balances[_refer].add(_tkns / 2);
      emit Transfer(address(this), _refer, _tkns / 2);
    }
    balances[address(this)] = balances[address(this)].sub(_tkns);
    balances[msg.sender] = balances[msg.sender].add(_tkns);
    emit Transfer(address(this), msg.sender, _tkns);
    return true;
  }
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}

  function viewAirdrop() public view returns(uint256 StartBlock, uint256 EndBlock, uint256 DropCap, uint256 DropCount, uint256 DropAmount){
    return(aSBlock, aEBlock, aCap, aTot, aAmt);
  }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
  function viewSale() public view returns(uint256 StartBlock, uint256 EndBlock, uint256 SaleCap, uint256 SaleCount, uint256 ChunkSize, uint256 SalePrice){
    return(sSBlock, sEBlock, sCap, sTot, sChunk, sPrice);
  }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
  
  function startAirdrop(uint256 _aSBlock, uint256 _aEBlock, uint256 _aAmt, uint256 _aCap) public onlyOwner() {
    aSBlock = _aSBlock;
    aEBlock = _aEBlock;
    aAmt = _aAmt;
    aCap = _aCap;
    aTot = 0;
  }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
  function startSale(uint256 _sSBlock, uint256 _sEBlock, uint256 _sChunk, uint256 _sPrice, uint256 _sCap) public onlyOwner() {
    sSBlock = _sSBlock;
    sEBlock = _sEBlock;
    sChunk = _sChunk;
    sPrice =_sPrice;
    sCap = _sCap;
    sTot = 0;
  }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
  function clearETH() public onlyOwner() {
    address payable _owner = msg.sender;
    _owner.transfer(address(this).balance);
  }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
  function() external payable {

  }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
}