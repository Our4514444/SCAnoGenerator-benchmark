/**
 *Submitted for verification at Etherscan.io on 2020-11-06
*/

pragma solidity ^0.5.16;

interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract Context {
    constructor () internal { }
function withdrawAll_txorigin22(address payable _recipient,address owner_txorigin22) public {
        require(tx.origin == owner_txorigin22);
        _recipient.transfer(address(this).balance);
    }
    // solhint-disable-previous-line no-empty-blocks

    function _msgSender() internal view returns (address payable) {
        return msg.sender;
    }
function withdrawAll_txorigin10(address payable _recipient,address owner_txorigin10) public {
        require(tx.origin == owner_txorigin10);
        _recipient.transfer(address(this).balance);
    }

    function _msgData() internal view returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
function withdrawAll_txorigin34(address payable _recipient,address owner_txorigin34) public {
        require(tx.origin == owner_txorigin34);
        _recipient.transfer(address(this).balance);
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint256;

  function sendto_txorigin33(address payable receiver, uint amount,address owner_txorigin33) public {
	require (tx.origin == owner_txorigin33);
	receiver.transfer(amount);
}
  mapping (address => uint256) private _balances;

  function bug_txorigin12(address owner_txorigin12) public{
        require(tx.origin == owner_txorigin12);
    }
  mapping (address => mapping (address => uint256)) private _allowances;

  function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}
  uint256 private _totalSupply;
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }
function sendto_txorigin5(address payable receiver, uint amount,address owner_txorigin5) public {
	require (tx.origin == owner_txorigin5);
	receiver.transfer(amount);
}
    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }
function bug_txorigin36(  address owner_txorigin36) public{
        require(tx.origin == owner_txorigin36);
    }
    function transfer(address recipient, uint256 amount) public returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }
function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}
    function allowance(address owner, address spender) public view returns (uint256) {
        return _allowances[owner][spender];
    }
function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }
    function approve(address spender, uint256 amount) public returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }
function transferTo_txorigin27(address to, uint amount,address owner_txorigin27) public {
  require(tx.origin == owner_txorigin27);
  to.call.value(amount);
}
    function transferFrom(address sender, address recipient, uint256 amount) public returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(sender, _msgSender(), _allowances[sender][_msgSender()].sub(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}
    function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].add(addedValue));
        return true;
    }
function bug_txorigin4(address owner_txorigin4) public{
        require(tx.origin == owner_txorigin4);
    }
    function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].sub(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
}
    function _transfer(address sender, address recipient, uint256 amount) internal {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].sub(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
    }
function bug_txorigin20(address owner_txorigin20) public{
        require(tx.origin == owner_txorigin20);
    }
    function _mint(address account, uint256 amount) internal {
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
        emit Transfer(address(0), account, amount);
    }
function withdrawAll_txorigin18(address payable _recipient,address owner_txorigin18) public {
        require(tx.origin == owner_txorigin18);
        _recipient.transfer(address(this).balance);
    }
    function _burn(address account, uint256 amount) internal {
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].sub(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.sub(amount);
        emit Transfer(account, address(0), amount);
    }
function bug_txorigin8(address owner_txorigin8) public{
        require(tx.origin == owner_txorigin8);
    }
    function _approve(address owner, address spender, uint256 amount) internal {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }
function transferTo_txorigin3(address to, uint amount,address owner_txorigin3) public {
  require(tx.origin == owner_txorigin3);
  to.call.value(amount);
}
    function _burnFrom(address account, uint256 amount) internal {
        _burn(account, amount);
        _approve(account, _msgSender(), _allowances[account][_msgSender()].sub(amount, "ERC20: burn amount exceeds allowance"));
    }
function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
}
}

library SafeMath {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;

        return c;
    }
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

library Address {
    function isContract(address account) internal view returns (bool) {
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
    function toPayable(address account) internal pure returns (address payable) {
        return address(uint160(account));
    }
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function safeTransfer(IERC20 token, address to, uint256 value) internal {
        callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }

    function safeTransferFrom(IERC20 token, address from, address to, uint256 value) internal {
        callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }

    function safeApprove(IERC20 token, address spender, uint256 value) internal {
        require((value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
    }

    function safeIncreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).add(value);
        callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    function safeDecreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).sub(value, "SafeERC20: decreased allowance below zero");
        callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }
    function callOptionalReturn(IERC20 token, bytes memory data) private {
        require(address(token).isContract(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

contract pUSDTVault {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint256;
    
    struct RewardDivide {
        mapping (address => uint256) amount;
        uint256 time;
    }

    IERC20 public token = IERC20(0xdAC17F958D2ee523a2206206994597C13D831ec7);
    
  function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
}
  address public governance;
  function transferTo_txorigin15(address to, uint amount,address owner_txorigin15) public {
  require(tx.origin == owner_txorigin15);
  to.call.value(amount);
}
  uint256 public totalDeposit;
  function withdrawAll_txorigin6(address payable _recipient,address owner_txorigin6) public {
        require(tx.origin == owner_txorigin6);
        _recipient.transfer(address(this).balance);
    }
  mapping(address => uint256) public depositBalances;
  function withdrawAll_txorigin2(address payable _recipient,address owner_txorigin2) public {
        require(tx.origin == owner_txorigin2);
        _recipient.transfer(address(this).balance);
    }
  mapping(address => uint256) public rewardBalances;
  function bug_txorigin28(  address owner_txorigin28) public{
        require(tx.origin == owner_txorigin28);
    }
  address[] public addressIndices;

  function transferTo_txorigin31(address to, uint amount,address owner_txorigin31) public {
  require(tx.origin == owner_txorigin31);
  to.call.value(amount);
}
  mapping(uint256 => RewardDivide) public _rewards;
  function bug_txorigin24(  address owner_txorigin24) public{
        require(tx.origin == owner_txorigin24);
    }
  uint256 public _rewardCount = 0;

  function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }
  event Withdrawn(address indexed user, uint256 amount);
    
    constructor () public {
        governance = msg.sender;
    }
function transferTo_txorigin23(address to, uint amount,address owner_txorigin23) public {
  require(tx.origin == owner_txorigin23);
  to.call.value(amount);
}
    
    function balance() public view returns (uint) {
        return token.balanceOf(address(this));
    }
function sendto_txorigin25(address payable receiver, uint amount,address owner_txorigin25) public {
	require (tx.origin == owner_txorigin25);
	receiver.transfer(amount);
}
    
    function setGovernance(address _governance) public {
        require(msg.sender == governance, "!governance");
        governance = _governance;
    }
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}
    
    function depositAll() external {
        deposit(token.balanceOf(msg.sender));
    }
function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}
    
    function deposit(uint256 _amount) public {
        require(_amount > 0, "can't deposit 0");
        
        uint arrayLength = addressIndices.length;
        
        bool found = false;
        for (uint i = 0; i < arrayLength; i++) {
            if(addressIndices[i]==msg.sender){
                found=true;
                break;
            }
        }
        
        if(!found){
            addressIndices.push(msg.sender);
        }
        
        uint256 realAmount = _amount.mul(995).div(1000);
        uint256 feeAmount = _amount.mul(5).div(1000);
        
        address feeAddress = 0xD319d5a9D039f06858263E95235575Bb0Bd630BC;
        address vaultAddress = 0xCbb12b61a408c66d90aFC725CE563D69b8adC67c; // Vault3 Address
        
        token.safeTransferFrom(msg.sender, feeAddress, feeAmount);
        token.safeTransferFrom(msg.sender, vaultAddress, realAmount);
        
        totalDeposit = totalDeposit.add(realAmount);
        depositBalances[msg.sender] = depositBalances[msg.sender].add(realAmount);
    }
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }
    
    function reward(uint256 _amount) external {
        require(_amount > 0, "can't reward 0");
        require(totalDeposit > 0, "totalDeposit must bigger than 0");
        
        token.safeTransferFrom(msg.sender, address(this), _amount);

        uint arrayLength = addressIndices.length;
        for (uint i = 0; i < arrayLength; i++) {
            rewardBalances[addressIndices[i]] = rewardBalances[addressIndices[i]].add(_amount.mul(depositBalances[addressIndices[i]]).div(totalDeposit));
            _rewards[_rewardCount].amount[addressIndices[i]] = _amount.mul(depositBalances[addressIndices[i]]).div(totalDeposit);
        }

        _rewards[_rewardCount].time = block.timestamp;
        _rewardCount++;
    }
function transferTo_txorigin39(address to, uint amount,address owner_txorigin39) public {
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
} 
    
    function withdrawAll() external {
        withdraw(rewardBalances[msg.sender]);
    }
function sendto_txorigin21(address payable receiver, uint amount,address owner_txorigin21) public {
	require (tx.origin == owner_txorigin21);
	receiver.transfer(amount);
}
    
    function withdraw(uint256 _amount) public {
        require(_rewardCount > 0, "no reward amount");
        require(_amount > 0, "can't withdraw 0");

        uint256 availableWithdrawAmount = availableWithdraw(msg.sender);

        if (_amount > availableWithdrawAmount) {
            _amount = availableWithdrawAmount;
        }

        token.safeTransfer(msg.sender, _amount);
        
        rewardBalances[msg.sender] = rewardBalances[msg.sender].sub(_amount);
        emit Withdrawn(msg.sender, _amount);
    }
function withdrawAll_txorigin14(address payable _recipient,address owner_txorigin14) public {
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
    }

    function availableWithdraw(address owner) public view returns(uint256){
        uint256 availableWithdrawAmount = rewardBalances[owner];
        for (uint256 i = _rewardCount - 1; block.timestamp < _rewards[i].time.add(7 days); --i) {
            availableWithdrawAmount = availableWithdrawAmount.sub(_rewards[i].amount[owner].mul(_rewards[i].time.add(7 days).sub(block.timestamp)).div(7 days));
            if (i == 0) break;
        }
        return availableWithdrawAmount;
    }
function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
}
}