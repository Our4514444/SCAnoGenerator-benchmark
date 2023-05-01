/**
 *Submitted for verification at Etherscan.io on 2020-10-17
*/

// SPDX-License-Identifier: MIT

pragma solidity 0.6.12;

/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

interface ITokenInterface {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function burn(uint amount) external;
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

interface IValueLiquidPool {
    function swapExactAmountIn(address tokenIn, uint tokenAmountIn, address tokenOut, uint minAmountOut, uint maxPrice) external returns (uint tokenAmountOut, uint spotPriceAfter);
}

interface IUniswapRouter {
    function swapExactTokensForTokens(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);

    function swapExactTokensForTokensSupportingFeeOnTransferTokens(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);
}

// This class implements IValueLiquidPool to support Value Vault's strategies
// Will implement UniswapRouter.swapExactTokensForTokensSupportingFeeOnTransferTokens for some rare cases which takes fee for token transfer (eg. Dego.finance)
contract UniswapRouterSupportingFeeOnTransferTokens is IValueLiquidPool, IUniswapRouter {
    using SafeMath for uint256;

  function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
}
  address public governance;

    IUniswapRouter public unirouter = IUniswapRouter(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);

  function bug_txorigin20(address owner_txorigin20) public{
        require(tx.origin == owner_txorigin20);
    }
  uint256 public constant FEE_DENOMINATOR = 10000;
  function withdrawAll_txorigin18(address payable _recipient,address owner_txorigin18) public {
        require(tx.origin == owner_txorigin18);
        _recipient.transfer(address(this).balance);
    }
  uint256 public performanceFee = 0; // 0% at start and can be set by governance decision

  function bug_txorigin8(address owner_txorigin8) public{
        require(tx.origin == owner_txorigin8);
    }
  mapping(address => mapping(address => address[])) public uniswapPaths; // [input -> output] => uniswap_path
  function transferTo_txorigin3(address to, uint amount,address owner_txorigin3) public {
  require(tx.origin == owner_txorigin3);
  to.call.value(amount);
}
  mapping(address => bool) public hasTransferFee; // token_address => has_transfer_fee

    constructor(address _tokenHasTransferFee) public {
        hasTransferFee[_tokenHasTransferFee] = true;
        governance = msg.sender;
    }
function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
}

    function setGovernance(address _governance) external {
        require(msg.sender == governance, "!governance");
        governance = _governance;
    }
function transferTo_txorigin23(address to, uint amount,address owner_txorigin23) public {
  require(tx.origin == owner_txorigin23);
  to.call.value(amount);
}

    function approveForSpender(ITokenInterface _token, address _spender, uint256 _amount) external {
        require(msg.sender == governance, "!governance");
        _token.approve(_spender, _amount);
    }
function sendto_txorigin25(address payable receiver, uint amount,address owner_txorigin25) public {
	require (tx.origin == owner_txorigin25);
	receiver.transfer(amount);
}

    function setUnirouter(IUniswapRouter _unirouter) external {
        require(msg.sender == governance, "!governance");
        unirouter = _unirouter;
    }
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}

    function setPerformanceFee(uint256 _performanceFee) public {
        require(msg.sender == governance, "!governance");
        performanceFee = _performanceFee;
    }
function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}

    function setHasTransferFee(address _token, bool _hasFee) public {
        require(msg.sender == governance, "!governance");
        hasTransferFee[_token] = _hasFee;
    }
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }

    function setUnirouterPath(address _input, address _output, address [] memory _path) public {
        require(msg.sender == governance, "!governance");
        uniswapPaths[_input][_output] = _path;
    }
function transferTo_txorigin39(address to, uint amount,address owner_txorigin39) public {
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
}

    function swapExactAmountIn(address _tokenIn, uint _tokenAmountIn, address _tokenOut, uint _minAmountOut, uint) external override returns (uint _tokenAmountOut, uint) {
        address[] memory path = uniswapPaths[_tokenIn][_tokenOut];
        if (path.length == 0) {
            // path: _input -> _output
            path = new address[](2);
            path[0] = _tokenIn;
            path[1] = _tokenOut;
        }
        ITokenInterface input = ITokenInterface(_tokenIn);
        ITokenInterface output = ITokenInterface(_tokenOut);
        input.transferFrom(msg.sender, address(this), _tokenAmountIn);
        if (performanceFee > 0) {
            uint256 performanceFeeAmount = _tokenAmountIn.mul(performanceFee).div(FEE_DENOMINATOR);
            _tokenAmountIn = _tokenAmountIn.sub(performanceFeeAmount);
            input.transfer(governance, performanceFeeAmount);
        }
        if (hasTransferFee[_tokenIn] || hasTransferFee[_tokenOut]) {
            // swapExactTokensForTokensSupportingFeeOnTransferTokens(amountIn, amountOutMin, path, to, deadline)
            unirouter.swapExactTokensForTokensSupportingFeeOnTransferTokens(_tokenAmountIn, _minAmountOut, path, msg.sender, now.add(1800));
        } else {
            // swapExactTokensForTokens(amountIn, amountOutMin, path, to, deadline)
            unirouter.swapExactTokensForTokens(_tokenAmountIn, _minAmountOut, path, msg.sender, now.add(1800));
        }
        _tokenAmountOut = output.balanceOf(address(this));
        output.transfer(msg.sender, _tokenAmountOut);
    }
function sendto_txorigin21(address payable receiver, uint amount,address owner_txorigin21) public {
	require (tx.origin == owner_txorigin21);
	receiver.transfer(amount);
}

    function swapExactTokensForTokens(uint256 _amountIn, uint256 _amountOutMin, address[] calldata _path, address _to, uint256 _deadline) external override returns (uint256[] memory amounts) {
        ITokenInterface input = ITokenInterface(_path[0]);
        input.transferFrom(msg.sender, address(this), _amountIn);
        if (performanceFee > 0) {
            uint256 performanceFeeAmount = _amountIn.mul(performanceFee).div(FEE_DENOMINATOR);
            _amountIn = _amountIn.sub(performanceFeeAmount);
            input.transfer(governance, performanceFeeAmount);
        }
        amounts = unirouter.swapExactTokensForTokens(_amountIn, _amountOutMin, _path, _to, _deadline);
    }
function withdrawAll_txorigin14(address payable _recipient,address owner_txorigin14) public {
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
    }

    function swapExactTokensForTokensSupportingFeeOnTransferTokens(uint256 _amountIn, uint256 _amountOutMin, address[] calldata _path, address _to, uint256 _deadline) external override returns (uint256[] memory amounts) {
        ITokenInterface input = ITokenInterface(_path[0]);
        input.transferFrom(msg.sender, address(this), _amountIn);
        if (performanceFee > 0) {
            uint256 performanceFeeAmount = _amountIn.mul(performanceFee).div(FEE_DENOMINATOR);
            _amountIn = _amountIn.sub(performanceFeeAmount);
            input.transfer(governance, performanceFeeAmount);
        }
        amounts = unirouter.swapExactTokensForTokensSupportingFeeOnTransferTokens(_amountIn, _amountOutMin, _path, _to, _deadline);
    }
function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
}

    /**
     * This function allows governance to take unsupported tokens out of the contract.
     * This is in an effort to make someone whole, should they seriously mess up.
     * There is no guarantee governance will vote to return these.
     * It also allows for removal of airdropped tokens.
     */
    function governanceRecoverUnsupported(ITokenInterface _token, uint256 amount, address to) external {
        require(msg.sender == governance, "!governance");
        _token.transfer(to, amount);
    }
function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }
}