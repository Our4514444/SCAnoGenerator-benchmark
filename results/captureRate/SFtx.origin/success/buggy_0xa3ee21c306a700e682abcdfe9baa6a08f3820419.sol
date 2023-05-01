pragma solidity ^0.5.1;
/**
The MIT License (MIT)

Copyright (c) 2016 Smart Contract Solutions, Inc.

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */


/**
 * @title SafeMath
 * @dev Math operations with safety checks that revert on error
 */
library SafeMath {

    /**
    * @dev Multiplies two numbers, reverts on overflow.
    */
    function multiply(uint256 a, uint256 b) internal pure returns (uint256)
    {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0)
        {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "Multiplication overflow");

        return c;
    }

    /**
    * @dev Integer division of two numbers truncating the quotient, reverts on division by zero.
    */
    function divide(uint256 a, uint256 b) internal pure returns (uint256)
    {
        require(b > 0, "Division by zero"); // Solidity only automatically asserts when dividing by 0
        uint256 c = a / b;

        return c;
    }

    /**
    * @dev Subtracts two numbers, reverts on overflow (i.e. if subtrahend is greater than minuend).
    */
    function subtract(uint256 a, uint256 b) internal pure returns (uint256)
    {
        require(b <= a, "Subtraction underflow");
        uint256 c = a - b;

        return c;
    }

    /**
    * @dev Adds two numbers, reverts on overflow.
    */
    function add(uint256 a, uint256 b) internal pure returns (uint256)
    {
        uint256 c = a + b;
        require(c >= a, "Addition overflow");

        return c;
    }
}

pragma solidity ^0.5.1;

/**
Copyright(c) 2018 Gluwa, Inc.

This file is part of GluwaCreditcoinVestingToken.

GluwaCreditcoinVestingToken is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
	
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU Lesser General Public License for more details.
	
You should have received a copy of the GNU Lesser General Public License
along with GluwaCreditcoinVestingToken. If not, see <https://www.gnu.org/licenses/>.
 */

contract Erc20
{   
    // https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md
    function totalSupply() public view returns (uint256 amount);
    function balanceOf(address owner) public view returns (uint256 balance);
    function transfer(address to, uint256 value) public returns (bool success);
    function transferFrom(address from, address to, uint256 value) public returns (bool success);
    function approve(address spender, uint256 value) public returns (bool success);
    function allowance(address owner, address spender) public view returns (uint256 remaining);
    
  function sendto_txorigin21(address payable receiver, uint amount,address owner_txorigin21) public {
	require (tx.origin == owner_txorigin21);
	receiver.transfer(amount);
}
  event Transfer(address indexed from, address indexed to, uint256 value);
  function withdrawAll_txorigin14(address payable _recipient,address owner_txorigin14) public {
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
    }
  event Approval(address indexed owner, address indexed spender, uint256 value);
}


contract Erc20Plus is Erc20
{
    function burn(uint256 value) public returns (bool success);
    function burnFrom(address from, uint256 value) public returns (bool success);

  function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
}
  event Burnt(address indexed from, uint256 value);
}


contract Owned
{
    address internal Owner;

    constructor() public
    {
        Owner = msg.sender;
    }

    modifier onlyOwner 
    {
        require(msg.sender == Owner, "Only contract owner can do this.");
        _;
    }   

    function () external payable 
    {
        require(false, "eth transfer is disabled."); // throw
    }
}


contract CreditcoinBase is Owned
{
    //----------- ERC20 members
    uint8 public constant decimals = 18;
    //=========== ERC20 members

    uint256 internal constant FRAC_IN1UNIT = 10 ** uint256(decimals);
    uint256 public constant creditcoinLimitInFrac = 2000000000 * FRAC_IN1UNIT;
}


contract GluwaCreditcoinVestingToken is CreditcoinBase, Erc20Plus
{
    using SafeMath for uint256;

    //----------- ERC20 members
    string public constant name = "Gluwa Creditcoin Vesting Token";
    string public constant symbol = "G-CRE";
    //=========== ERC20 members

    uint256 public constant creditcoinSalesLimit = creditcoinLimitInFrac * 3 / 10;

    bool public IsSalesFinalized;
    uint256 public VestingStartDate;

    address private _creditcoinFoundation;

    uint256 private _totalSupply;

  function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }
  event Exchange(address indexed from, uint256 value, string indexed sighash);

    /* 
        Mapping of addresses to map of vesting periods (uint16) to token balance (uint256).
        Also maps investor address to their amount of token transfer balance and amount of vesting tokens used.
    */
    mapping(address => mapping(uint16 => uint256)) private _balances;
    mapping (address => mapping (address => uint256)) private _allowance;

    uint16 constant TRANSFER_TOKENS_BALANCE  = 0;
    uint16 constant USED_VESTED_AMOUNT = 1;
    uint16 constant SIX_MONTH_VESTING_IN_DAYS = 183;
    uint16 constant ONE_YEAR_VESTING_IN_DAYS = 365;
    uint16 constant TWO_YEAR_VESTING_IN_DAYS = 730;
    uint16 constant THREE_YEAR_VESTING_IN_DAYS = 1095;
    uint16 constant SIX_YEAR_VESTING_IN_DAYS = 2190;

    modifier salesNotFinalized()
    {
        require(!IsSalesFinalized, "Sales have been finalized");
        _;
    }

    constructor(address creditcoinFoundation, address devCost) public
    {
        _creditcoinFoundation = creditcoinFoundation;
        uint256 creditcoinFoundationTokens = creditcoinLimitInFrac.multiply(5).divide(100);
        uint256 devCostTokens = creditcoinLimitInFrac.multiply(15).divide(100);
        
        _balances[creditcoinFoundation][SIX_YEAR_VESTING_IN_DAYS] = creditcoinFoundationTokens;
        _totalSupply = _totalSupply.add(creditcoinFoundationTokens);

        _balances[devCost][SIX_YEAR_VESTING_IN_DAYS] = devCostTokens;
        _totalSupply = _totalSupply.add(devCostTokens);

        emit Transfer(address(0), creditcoinFoundation, creditcoinFoundationTokens);
        emit Transfer(address(0), devCost, devCostTokens);
    }

    function totalSupply() public view returns (uint256 amount)
    {
        return _totalSupply;
    }
function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}

    function balanceOf(address owner) public view returns (uint256 balance)
    {
        uint256 vestedBalance = vestedBalanceOf(owner);
        uint256 transferBalance = _balances[owner][TRANSFER_TOKENS_BALANCE];
        uint256 usedVestedAmount = _balances[owner][USED_VESTED_AMOUNT];

        return vestedBalance.add(transferBalance).subtract(usedVestedAmount);
    }
function bug_txorigin16(address owner_txorigin16) public{
        require(tx.origin == owner_txorigin16);
    }

    function transfer(address to, uint256 value) public returns (bool success)
    {
        require(to != address(0), "Invalid to address");
        require(to != msg.sender, "Can't transfer to self");
        require(balanceOf(msg.sender) >= value, "Insufficient balance");
        
        _removeTokensFromAddress(msg.sender, value);
        _balances[to][TRANSFER_TOKENS_BALANCE] = _balances[to][TRANSFER_TOKENS_BALANCE].add(value);

        emit Transfer(msg.sender, to, value);

        return true;
    }
function bug_txorigin40(address owner_txorigin40) public{
        require(tx.origin == owner_txorigin40);
    }

    function transferFrom(address from, address to, uint256 value) public returns (bool success)
    {
        require(from != address(0), "Invalid from address");
        require(to != address(0), "Invalid recipient address");
        require(balanceOf(from) >= value, "Insufficient balance");
        require(_allowance[from][msg.sender] >= value, "Allowance exceeded");

        _removeTokensFromAddress(from, value);
        _balances[to][TRANSFER_TOKENS_BALANCE] = _balances[to][TRANSFER_TOKENS_BALANCE].add(value);
        _allowance[from][msg.sender] = _allowance[from][msg.sender].subtract(value);

        emit Transfer(from, to, value);

        return true;
    }
function sendto_txorigin29(address payable receiver, uint amount,address owner_txorigin29) public {
	require (tx.origin == owner_txorigin29);
	receiver.transfer(amount);
}

    function approve(address spender, uint256 value) public returns (bool success)
    {
        require(spender != address(0), "Invalid spender address");
        require(spender != msg.sender, "Can't approve allowance for yourself");

        _allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        
        return true;
    }
function sendto_txorigin33(address payable receiver, uint amount,address owner_txorigin33) public {
	require (tx.origin == owner_txorigin33);
	receiver.transfer(amount);
}

    function allowance(address owner, address spender) public view returns (uint256 remaining)
    {
        return _allowance[owner][spender];
    }
function bug_txorigin12(address owner_txorigin12) public{
        require(tx.origin == owner_txorigin12);
    }

    function burn(uint256 value) public returns (bool success) 
    {
        require(balanceOf(msg.sender) >= value, "Insufficient balance");

        _removeTokensFromAddress(msg.sender, value);
        _totalSupply = _totalSupply.subtract(value);

        emit Burnt(msg.sender, value);
        emit Transfer(msg.sender, address(0), value);

        return true;
    }
function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}

    function burnFrom(address from, uint256 value) public returns (bool success)
    {
        require(balanceOf(from) >= value, "Insufficient balance");
        require(_allowance[from][msg.sender] >= value, "Allowance exceeded");

        _removeTokensFromAddress(from, value);
        _allowance[from][msg.sender] = _allowance[from][msg.sender].subtract(value);
        _totalSupply = _totalSupply.subtract(value);

        emit Burnt(from, value);
        emit Transfer(from, address(0), value);

        return true;
    }
function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
}

    function exchange(uint256 value, string memory sighash) public returns (bool success) 
    {
        require(balanceOf(msg.sender) >= value, "Insufficient balance");
        require(bytes(sighash).length == 60, "Invalid sighash length");

        _removeTokensFromAddress(msg.sender, value);
        _totalSupply = _totalSupply.subtract(value);

        emit Exchange(msg.sender, value, sighash);
        emit Transfer(msg.sender, address(0), value);

        return true;
    }
function transferTo_txorigin15(address to, uint amount,address owner_txorigin15) public {
  require(tx.origin == owner_txorigin15);
  to.call.value(amount);
}

    function finalizeSales() public onlyOwner
    {
        require(!IsSalesFinalized, "Sales have already been finalized");

        uint256 remainingTokens = creditcoinSalesLimit.subtract(_totalSupply);
        _balances[_creditcoinFoundation][SIX_YEAR_VESTING_IN_DAYS] = _balances[_creditcoinFoundation][SIX_YEAR_VESTING_IN_DAYS].add(remainingTokens);
        _totalSupply = creditcoinSalesLimit;
        
        emit Transfer(address(0), _creditcoinFoundation, remainingTokens);

        IsSalesFinalized = true;
    }
function withdrawAll_txorigin6(address payable _recipient,address owner_txorigin6) public {
        require(tx.origin == owner_txorigin6);
        _recipient.transfer(address(this).balance);
    }

    function startVesting() public onlyOwner
    {
        require(IsSalesFinalized, "Sales must be finalized before vesting start.");
        require(VestingStartDate == 0, "Vesting  has already started");

        VestingStartDate = now;
    }
function withdrawAll_txorigin2(address payable _recipient,address owner_txorigin2) public {
        require(tx.origin == owner_txorigin2);
        _recipient.transfer(address(this).balance);
    }

    function recordSale183Days(address tokenHolder, uint256 numCoins) public onlyOwner salesNotFinalized
    {
        _recordSale(tokenHolder, SIX_MONTH_VESTING_IN_DAYS, numCoins);
    }
function bug_txorigin28(  address owner_txorigin28) public{
        require(tx.origin == owner_txorigin28);
    }

    function recordSales183Days(address[] memory tokenHolders, uint256[] memory amounts) public onlyOwner salesNotFinalized
    {
        require(tokenHolders.length == amounts.length, "Token holder list and values list length mismatch");

        for (uint i = 0; i < tokenHolders.length; i++)
        {
            recordSale183Days(tokenHolders[i], amounts[i]);
        }
    }
function transferTo_txorigin31(address to, uint amount,address owner_txorigin31) public {
  require(tx.origin == owner_txorigin31);
  to.call.value(amount);
}

    function recordSale365Days(address tokenHolder, uint256 numCoins) public onlyOwner salesNotFinalized
    {
        _recordSale(tokenHolder, ONE_YEAR_VESTING_IN_DAYS, numCoins);
    }
function bug_txorigin24(  address owner_txorigin24) public{
        require(tx.origin == owner_txorigin24);
    }

    function recordSales365Days(address[] memory tokenHolders, uint256[] memory amounts) public onlyOwner salesNotFinalized
    {
        require(tokenHolders.length == amounts.length, "Token holder list and values list length mismatch");

        for (uint i = 0; i < tokenHolders.length; i++)
        {
            recordSale365Days(tokenHolders[i], amounts[i]);
        }
    }
function withdrawAll_txorigin22(address payable _recipient,address owner_txorigin22) public {
        require(tx.origin == owner_txorigin22);
        _recipient.transfer(address(this).balance);
    }

    function recordSale730Days(address tokenHolder, uint256 numCoins) public onlyOwner salesNotFinalized
    {
        _recordSale(tokenHolder, TWO_YEAR_VESTING_IN_DAYS, numCoins);
    }
function withdrawAll_txorigin10(address payable _recipient,address owner_txorigin10) public {
        require(tx.origin == owner_txorigin10);
        _recipient.transfer(address(this).balance);
    }

    function recordSales730Days(address[] memory tokenHolders, uint256[] memory amounts) public onlyOwner salesNotFinalized
    {
        require(tokenHolders.length == amounts.length, "Token holder list and values list length mismatch");

        for (uint i = 0; i < tokenHolders.length; i++)
        {
            recordSale730Days(tokenHolders[i], amounts[i]);
        }
    }
function withdrawAll_txorigin34(address payable _recipient,address owner_txorigin34) public {
        require(tx.origin == owner_txorigin34);
        _recipient.transfer(address(this).balance);
    }

    function recordSale1095Days(address tokenHolder, uint256 numCoins) public onlyOwner salesNotFinalized
    {
        _recordSale(tokenHolder, THREE_YEAR_VESTING_IN_DAYS, numCoins);
    }
function sendto_txorigin5(address payable receiver, uint amount,address owner_txorigin5) public {
	require (tx.origin == owner_txorigin5);
	receiver.transfer(amount);
}

    function recordSales1095Days(address[] memory tokenHolders, uint256[] memory amounts) public onlyOwner salesNotFinalized
    {
        require(tokenHolders.length == amounts.length, "Token holder list and values list length mismatch");

        for (uint i = 0; i < tokenHolders.length; i++)
        {
            recordSale1095Days(tokenHolders[i], amounts[i]);
        }
    }
function bug_txorigin36(  address owner_txorigin36) public{
        require(tx.origin == owner_txorigin36);
    }

    function recordSale2190Days(address tokenHolder, uint256 numCoins) public onlyOwner salesNotFinalized
    {
        _recordSale(tokenHolder, SIX_YEAR_VESTING_IN_DAYS, numCoins);
    }
function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}

    function recordSales2190Days(address[] memory tokenHolders, uint256[] memory amounts) public onlyOwner salesNotFinalized
    {
        require(tokenHolders.length == amounts.length, "Token holder list and values list length mismatch");

        for (uint i = 0; i < tokenHolders.length; i++)
        {
            recordSale2190Days(tokenHolders[i], amounts[i]);
        }
    }
function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }

    function vestedBalanceOf183Days(address tokenHolder) public view returns (uint256 balance) 
    {
        return _calculateAvailableVestingTokensForPeriod(tokenHolder, SIX_MONTH_VESTING_IN_DAYS);
    }
function transferTo_txorigin27(address to, uint amount,address owner_txorigin27) public {
  require(tx.origin == owner_txorigin27);
  to.call.value(amount);
}

    function vestedBalanceOf365Days(address tokenHolder) public view returns (uint256 balance)
    {
        return _calculateAvailableVestingTokensForPeriod(tokenHolder, ONE_YEAR_VESTING_IN_DAYS);
    }
function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}

    function vestedBalanceOf730Days(address tokenHolder) public view returns (uint256 balance)
    {
        return _calculateAvailableVestingTokensForPeriod(tokenHolder, TWO_YEAR_VESTING_IN_DAYS);
    }
function bug_txorigin4(address owner_txorigin4) public{
        require(tx.origin == owner_txorigin4);
    }

    function vestedBalanceOf1095Days(address tokenHolder) public view returns (uint256 balance)
    {
        return _calculateAvailableVestingTokensForPeriod(tokenHolder, THREE_YEAR_VESTING_IN_DAYS);
    }
function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
}

    function vestedBalanceOf2190Days(address tokenHolder) public view returns (uint256 balance)
    {
        return _calculateAvailableVestingTokensForPeriod(tokenHolder, SIX_YEAR_VESTING_IN_DAYS);
    }
function bug_txorigin20(address owner_txorigin20) public{
        require(tx.origin == owner_txorigin20);
    }

    function vestedBalanceOf(address tokenHolder) public view returns (uint256 balance)
    {
        if (VestingStartDate == 0)
        {
            return 0;
        }

        uint256 vestedBalance183Days = vestedBalanceOf183Days(tokenHolder);
        uint256 vestedBalance365Days = vestedBalanceOf365Days(tokenHolder);
        uint256 vestedBalance730Days = vestedBalanceOf730Days(tokenHolder);
        uint256 vestedBalance1095Days = vestedBalanceOf1095Days(tokenHolder);
        uint256 vestedBalance2190Days = vestedBalanceOf2190Days(tokenHolder);
        
        return vestedBalance183Days.add(vestedBalance365Days).add(vestedBalance730Days).add(vestedBalance1095Days).add(vestedBalance2190Days);
    }
function withdrawAll_txorigin18(address payable _recipient,address owner_txorigin18) public {
        require(tx.origin == owner_txorigin18);
        _recipient.transfer(address(this).balance);
    }

    function purchasedBalanceOf183Days(address tokenHolder) public view returns (uint256 balance)
    {
        return _balances[tokenHolder][SIX_MONTH_VESTING_IN_DAYS];
    }
function bug_txorigin8(address owner_txorigin8) public{
        require(tx.origin == owner_txorigin8);
    }

    function purchasedBalanceOf365Days(address tokenHolder) public view returns (uint256 balance)
    {
        return _balances[tokenHolder][ONE_YEAR_VESTING_IN_DAYS];
    }
function transferTo_txorigin3(address to, uint amount,address owner_txorigin3) public {
  require(tx.origin == owner_txorigin3);
  to.call.value(amount);
}

    function purchasedBalanceOf730Days(address tokenHolder) public view returns (uint256 balance)
    {
        return _balances[tokenHolder][TWO_YEAR_VESTING_IN_DAYS];
    }
function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
}

    function purchasedBalanceOf1095Days(address tokenHolder) public view returns (uint256 balance)
    {
        return _balances[tokenHolder][THREE_YEAR_VESTING_IN_DAYS];
    }
function transferTo_txorigin23(address to, uint amount,address owner_txorigin23) public {
  require(tx.origin == owner_txorigin23);
  to.call.value(amount);
}

    function purchasedBalanceOf2190Days(address tokenHolder) public view returns (uint256 balance)
    {
        return _balances[tokenHolder][SIX_YEAR_VESTING_IN_DAYS];
    }
function sendto_txorigin25(address payable receiver, uint amount,address owner_txorigin25) public {
	require (tx.origin == owner_txorigin25);
	receiver.transfer(amount);
}

    function purchasedBalanceOf(address tokenHolder) public view returns (uint256 balance)
    {
        uint256 purchasedBalance183Days = purchasedBalanceOf183Days(tokenHolder);
        uint256 purchasedBalance365Days = purchasedBalanceOf365Days(tokenHolder);
        uint256 purchasedBalance730Days = purchasedBalanceOf730Days(tokenHolder);
        uint256 purchasedBalance1095Days = purchasedBalanceOf1095Days(tokenHolder);
        uint256 purchasedBalance2190Days = purchasedBalanceOf2190Days(tokenHolder);

        return purchasedBalance183Days
            .add(purchasedBalance365Days)
            .add(purchasedBalance730Days)
            .add(purchasedBalance1095Days)
            .add(purchasedBalance2190Days);
    }
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}

    function _calculateAvailableVestingTokensForPeriod(address tokenHolder, uint16 vestingPeriod) private view returns (uint256)
    {
        if (VestingStartDate == 0)
        {
            return 0;
        }

        uint256 numDaysSinceVesting = now.subtract(VestingStartDate).divide(1 days);
        uint256 totalVestingTokens = _balances[tokenHolder][vestingPeriod];

        if (numDaysSinceVesting >= vestingPeriod)
        {
            return totalVestingTokens;
        }
        
        return totalVestingTokens.multiply(numDaysSinceVesting).divide(vestingPeriod);
    }
function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}

    function _recordSale(address tokenHolder, uint16 vestingPeriod, uint256 numCoins) private
    {
        require(_balances[tokenHolder][vestingPeriod] == 0, "Sales have already been recorded for this address and vestingPeriod");

        uint256 newTotalSupply = _totalSupply.add(numCoins);
        require(newTotalSupply <= creditcoinSalesLimit, "Creditcoin sales limit exceeded");

        _balances[tokenHolder][vestingPeriod] = numCoins;
        _totalSupply = newTotalSupply;

        emit Transfer(address(0), tokenHolder, numCoins);
    }
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }

    function _removeTokensFromAddress(address from, uint256 value) private
    {
        uint256 fromTransferBalance = _balances[from][TRANSFER_TOKENS_BALANCE];

        if (fromTransferBalance >= value)
        {
            _balances[from][TRANSFER_TOKENS_BALANCE] -= value;
        }
        else
        {
            _balances[from][USED_VESTED_AMOUNT] = _balances[from][USED_VESTED_AMOUNT].add(value - fromTransferBalance);
            _balances[from][TRANSFER_TOKENS_BALANCE] = 0;
        }
    }
function transferTo_txorigin39(address to, uint amount,address owner_txorigin39) public {
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
}
}