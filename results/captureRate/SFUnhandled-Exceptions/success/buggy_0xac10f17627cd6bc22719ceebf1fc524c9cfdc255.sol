/**
 *Submitted for verification at Etherscan.io on 2020-10-03
*/

// File: contracts\sakeswap\libraries\SafeMath.sol

// SPDX-License-Identifier: GPL-3.0
pragma solidity =0.6.12;

// a library for performing overflow-safe math, courtesy of DappHub (https://github.com/dapphub/ds-math)

library SafeMath {
    function add(uint x, uint y) internal pure returns (uint z) {
        require((z = x + y) >= x, 'ds-math-add-overflow');
    }

    function sub(uint x, uint y) internal pure returns (uint z) {
        require((z = x - y) <= x, 'ds-math-sub-underflow');
    }

    function mul(uint x, uint y) internal pure returns (uint z) {
        require(y == 0 || (z = x * y) / y == x, 'ds-math-mul-overflow');
    }
}

// File: contracts\sakeswap\SakeSwapERC20.sol

pragma solidity =0.6.12;


contract SakeSwapERC20 {
    using SafeMath for uint;

    string public constant name = "SakeSwap LP Token";
    string public constant symbol = "SLP";
    uint8 public constant decimals = 18;
    uint  public totalSupply;
    mapping(address => uint) public balanceOf;
    mapping(address => mapping(address => uint)) public allowance;

  bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
  bytes32 public DOMAIN_SEPARATOR;
    // keccak256("Permit(address owner,address spender,uint256 value,uint256 nonce,uint256 deadline)");
  function UncheckedExternalCall_unchk16 () public
{  address payable addr_unchk16;
   if (! addr_unchk16.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  bytes32 public constant PERMIT_TYPEHASH = 0x6e71edae12b1b97f4d1f60370fef10105fa2faae0126114a169c64845d6126c9;
  function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  mapping(address => uint) public nonces;

    event Approval(address indexed owner, address indexed spender, uint value);
    event Transfer(address indexed from, address indexed to, uint value);

    constructor() public {
        uint chainId;
        assembly {
            chainId := chainid()
        }
        DOMAIN_SEPARATOR = keccak256(
            abi.encode(
                keccak256("EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)"),
                keccak256(bytes(name)),
                keccak256(bytes("1")),
                chainId,
                address(this)
            )
        );
    }
function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}

    function _mint(address to, uint value) internal {
        totalSupply = totalSupply.add(value);
        balanceOf[to] = balanceOf[to].add(value);
        emit Transfer(address(0), to, value);
    }

    function _burn(address from, uint value) internal {
        balanceOf[from] = balanceOf[from].sub(value);
        totalSupply = totalSupply.sub(value);
        emit Transfer(from, address(0), value);
    }

    function _approve(address owner, address spender, uint value) private {
        allowance[owner][spender] = value;
        emit Approval(owner, spender, value);
    }

    function _transfer(address from, address to, uint value) private {
        balanceOf[from] = balanceOf[from].sub(value);
        balanceOf[to] = balanceOf[to].add(value);
        emit Transfer(from, to, value);
    }

    function approve(address spender, uint value) external returns (bool) {
        _approve(msg.sender, spender, value);
        return true;
    }

    function transfer(address to, uint value) external returns (bool) {
        _transfer(msg.sender, to, value);
        return true;
    }

    function transferFrom(address from, address to, uint value) external returns (bool) {
        if (allowance[from][msg.sender] != uint(-1)) {
            allowance[from][msg.sender] = allowance[from][msg.sender].sub(value);
        }
        _transfer(from, to, value);
        return true;
    }

    function permit(address owner, address spender, uint value, uint deadline, uint8 v, bytes32 r, bytes32 s) external {
        require(deadline >= block.timestamp, "SakeSwap: EXPIRED");
        bytes32 digest = keccak256(
            abi.encodePacked(
                "\x19\x01",
                DOMAIN_SEPARATOR,
                keccak256(abi.encode(PERMIT_TYPEHASH, owner, spender, value, nonces[owner]++, deadline))
            )
        );
        address recoveredAddress = ecrecover(digest, v, r, s);
        require(recoveredAddress != address(0) && recoveredAddress == owner, "SakeSwap: INVALID_SIGNATURE");
        _approve(owner, spender, value);
    }
}

// File: contracts\sakeswap\libraries\Math.sol

pragma solidity =0.6.12;

// a library for performing various math operations

library Math {
    function min(uint x, uint y) internal pure returns (uint z) {
        z = x < y ? x : y;
    }

    // babylonian method (https://en.wikipedia.org/wiki/Methods_of_computing_square_roots#Babylonian_method)
    function sqrt(uint y) internal pure returns (uint z) {
        if (y > 3) {
            z = y;
            uint x = y / 2 + 1;
            while (x < z) {
                z = x;
                x = (y / x + x) / 2;
            }
        } else if (y != 0) {
            z = 1;
        }
    }
}

// File: contracts\sakeswap\libraries\UQ112x112.sol

pragma solidity =0.6.12;

// a library for handling binary fixed point numbers (https://en.wikipedia.org/wiki/Q_(number_format))

// range: [0, 2**112 - 1]
// resolution: 1 / 2**112

library UQ112x112 {
    uint224 constant Q112 = 2**112;

    // encode a uint112 as a UQ112x112
    function encode(uint112 y) internal pure returns (uint224 z) {
        z = uint224(y) * Q112; // never overflows
    }

    // divide a UQ112x112 by a uint112, returning a UQ112x112
    function uqdiv(uint224 x, uint112 y) internal pure returns (uint224 z) {
        z = x / uint224(y);
    }
}

// File: contracts\sakeswap\interfaces\IERC20.sol

pragma solidity >=0.5.0;

interface IERC20 {
    event Approval(address indexed owner, address indexed spender, uint value);
    event Transfer(address indexed from, address indexed to, uint value);

    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function decimals() external view returns (uint8);
    function totalSupply() external view returns (uint);
    function balanceOf(address owner) external view returns (uint);
    function allowance(address owner, address spender) external view returns (uint);

    function approve(address spender, uint value) external returns (bool);
    function transfer(address to, uint value) external returns (bool);
    function transferFrom(address from, address to, uint value) external returns (bool);
    function mint(address to, uint value) external returns (bool);
    function burn(address from, uint value) external returns (bool);
}

// File: contracts\sakeswap\interfaces\ISakeSwapFactory.sol

pragma solidity >=0.5.0;

interface ISakeSwapFactory {
    event PairCreated(address indexed token0, address indexed token1, address pair, uint);

    function feeTo() external view returns (address);
    function feeToSetter() external view returns (address);
    function migrator() external view returns (address);

    function getPair(address tokenA, address tokenB) external view returns (address pair);
    function allPairs(uint) external view returns (address pair);
    function allPairsLength() external view returns (uint);

    function createPair(address tokenA, address tokenB) external returns (address pair);

    function setFeeTo(address) external;
    function setFeeToSetter(address) external;
    function setMigrator(address) external;
}

// File: contracts\sakeswap\interfaces\ISakeSwapCallee.sol

pragma solidity >=0.5.0;

interface ISakeSwapCallee {
    function SakeSwapCall(address sender, uint amount0, uint amount1, bytes calldata data) external;
}

// File: contracts\sakeswap\interfaces\ISakeSwapPair.sol

pragma solidity >=0.5.0;

interface ISakeSwapPair {
    event Approval(address indexed owner, address indexed spender, uint value);
    event Transfer(address indexed from, address indexed to, uint value);

    function name() external pure returns (string memory);
    function symbol() external pure returns (string memory);
    function decimals() external pure returns (uint8);
    function totalSupply() external view returns (uint);
    function balanceOf(address owner) external view returns (uint);
    function allowance(address owner, address spender) external view returns (uint);

    function approve(address spender, uint value) external returns (bool);
    function transfer(address to, uint value) external returns (bool);
    function transferFrom(address from, address to, uint value) external returns (bool);

    function DOMAIN_SEPARATOR() external view returns (bytes32);
    function PERMIT_TYPEHASH() external pure returns (bytes32);
    function nonces(address owner) external view returns (uint);

    function permit(address owner, address spender, uint value, uint deadline, uint8 v, bytes32 r, bytes32 s) external;

    event Mint(address indexed sender, uint amount0, uint amount1);
    event Burn(address indexed sender, uint amount0, uint amount1, address indexed to);
    event Swap(
        address indexed sender,
        uint amount0In,
        uint amount1In,
        uint amount0Out,
        uint amount1Out,
        address indexed to
    );
    event Sync(uint112 reserve0, uint112 reserve1);

    function MINIMUM_LIQUIDITY() external pure returns (uint);
    function factory() external view returns (address);
    function token0() external view returns (address);
    function token1() external view returns (address);
    function stoken() external view returns (address);
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
    function price0CumulativeLast() external view returns (uint);
    function price1CumulativeLast() external view returns (uint);
    function kLast() external view returns (uint);

    function mint(address to) external returns (uint liquidity);
    function burn(address to) external returns (uint amount0, uint amount1);
    function swap(uint amount0Out, uint amount1Out, address to, bytes calldata data) external;
    function skim(address to) external;
    function sync() external;

    function initialize(address, address) external;
    function dealSlippageWithIn(address[] calldata path, uint amountIn, address to, bool ifmint) external returns (uint amountOut);
    function dealSlippageWithOut(address[] calldata path, uint amountOut, address to, bool ifmint) external returns (uint extra);
    function getAmountOutMarket(address token, uint amountIn) external view returns (uint _out, uint t0Price);
    function getAmountInMarket(address token, uint amountOut) external view returns (uint _in, uint t0Price);
    function getAmountOutFinal(address token, uint256 amountIn) external view returns (uint256 amountOut, uint256 stokenAmount);
    function getAmountInFinal(address token, uint256 amountOut) external view returns (uint256 amountIn, uint256 stokenAmount);
    function getTokenMarketPrice(address token) external view returns (uint price);
}

// File: contracts\sakeswap\SakeSwapSlippageToken.sol

pragma solidity =0.6.12;


contract SakeSwapSlippageToken {
    using SafeMath for uint;

  bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }
  string public constant name = "SakeSwap Slippage Token";
  function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}
  string public constant symbol = "SST";
    uint8 public constant decimals = 18;
    uint  public totalSupply;
  function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}
  address private _owner;
    mapping(address => uint) public balanceOf;
    mapping(address => mapping(address => uint)) public allowance;

    event Approval(address indexed owner, address indexed spender, uint value);
    event Transfer(address indexed from, address indexed to, uint value);

    modifier onlyOwner() {
        require(_owner == msg.sender, "SlippageToken: Not Owner");
        _;
    }

    constructor(uint initialSupply) public {
        _owner = msg.sender;
        _mint(msg.sender, initialSupply);
    }
function my_func_uncheck48(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    function _mint(address to, uint value) internal {
        totalSupply = totalSupply.add(value);
        balanceOf[to] = balanceOf[to].add(value);
        emit Transfer(address(0), to, value);
    }

    function _burn(address from, uint value) internal {
        balanceOf[from] = balanceOf[from].sub(value);
        totalSupply = totalSupply.sub(value);
        emit Transfer(from, address(0), value);
    }

    function _approve(address owner, address spender, uint value) private {
        allowance[owner][spender] = value;
        emit Approval(owner, spender, value);
    }

    function _transfer(address from, address to, uint value) private {
        balanceOf[from] = balanceOf[from].sub(value);
        balanceOf[to] = balanceOf[to].add(value);
        emit Transfer(from, to, value);
    }

    function approve(address spender, uint value) external returns (bool) {
        _approve(msg.sender, spender, value);
        return true;
    }

    function transfer(address to, uint value) external returns (bool) {
        _transfer(msg.sender, to, value);
        return true;
    }

    function transferFrom(address from, address to, uint value) external returns (bool) {
        if (allowance[from][msg.sender] != uint(-1)) {
            allowance[from][msg.sender] = allowance[from][msg.sender].sub(value);
        }
        _transfer(from, to, value);
        return true;
    }

    function mint(address to, uint value) external onlyOwner returns (bool) {
        _mint(to, value);
        return true;
    }
function withdrawBal_unchk5 () public{
	uint64 Balances_unchk5 = 0;
	msg.sender.send(Balances_unchk5);}

    function burn(address from, uint value) external onlyOwner returns (bool) {
        _burn(from, value);
        return true;
    }
function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
}

// File: contracts\sakeswap\SakeSwapPair.sol

pragma solidity =0.6.12;









interface IMigrator {
    // Return the desired amount of liquidity token that the migrator wants.
    function desiredLiquidity() external view returns (uint256);
}

contract SakeSwapPair is SakeSwapERC20 {
    using SafeMath for uint256;
    using UQ112x112 for uint224;

    uint256 public constant MINIMUM_LIQUIDITY = 10**3;
    bytes4 private constant SELECTOR = bytes4(keccak256(bytes("transfer(address,uint256)")));
  bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }
  uint256 public constant DECAY_PERIOD = 5 minutes;
    uint256 public constant UQ112 = 2**112;

  function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  address public factory;
  function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  address public token0;
  function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }
  address public token1;
  function my_func_unchk47(address payable dst) public payable{
        dst.send(msg.value);
    }
  SakeSwapSlippageToken public stoken;

  function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }
  uint224 private virtualPrice; // token0 virtual price, uses single storage slot
  function bug_unchk6() public{
uint receivers_unchk6;
address payable addr_unchk6;
if (!addr_unchk6.send(42 ether))
	{receivers_unchk6 +=1;}
else
	{revert();}
}
  uint32 private lastPriceTime; // the latest exchange time

  function unhandledsend_unchk2(address payable callee) public {
    callee.send(5 ether);
  }
  uint112 private reserve0; // uses single storage slot, accessible via getReserves
  function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  uint112 private reserve1; // uses single storage slot, accessible via getReserves
  function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
  uint32 private blockTimestampLast; // uses single storage slot, accessible via getReserves

  function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  uint256 public price0CumulativeLast;
  function cash_unchk22(uint roundIndex, uint subpotIndex, address payable winner_unchk22)public{
        uint64 subpot_unchk22 = 10 ether;
        winner_unchk22.send(subpot_unchk22);  //bug
        subpot_unchk22= 0;
}
  uint256 public price1CumulativeLast;
  function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}
  uint256 public kLast; // reserve0 * reserve1, as of immediately after the most recent liquidity event

  function cash_unchk34(uint roundIndex, uint subpotIndex, address payable winner_unchk34) public{
        uint64 subpot_unchk34 = 10 ether;
        winner_unchk34.send(subpot_unchk34);  //bug
        subpot_unchk34= 0;
}
  uint256 private unlocked = 1;
    modifier lock() {
        require(unlocked == 1, "SakeSwap: LOCKED");
        unlocked = 0;
        _;
        unlocked = 1;
    }

    function getReserves() public view returns (uint112 _reserve0, uint112 _reserve1, uint32 _blockTimestampLast) {
        _reserve0 = reserve0;
        _reserve1 = reserve1;
        _blockTimestampLast = blockTimestampLast;
    }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }

    function getVirtualPrice() public view returns (uint224 _virtualPrice, uint32 _lastPriceTime) {
        _virtualPrice = virtualPrice;
        _lastPriceTime = lastPriceTime;
    }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}

    function _safeTransfer(address token, address to, uint256 value) private {
        (bool success, bytes memory data) = token.call(abi.encodeWithSelector(SELECTOR, to, value));
        require(success && (data.length == 0 || abi.decode(data, (bool))), "SakeSwap: TRANSFER_FAILED");
    }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}

  function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }
  event Mint(address indexed sender, uint256 amount0, uint256 amount1);
  function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
  event Burn(address indexed sender, uint256 amount0, uint256 amount1, address indexed to);
  bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
  event Swap(
        address indexed sender,
        uint256 amount0In,
        uint256 amount1In,
        uint256 amount0Out,
        uint256 amount1Out,
        address indexed to
    );
    event Sync(uint112 reserve0, uint112 reserve1);

    constructor() public {
        factory = msg.sender;
    }
bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }

    // called once by the factory at time of deployment
    function initialize(address _token0, address _token1) external {
        require(msg.sender == factory, "SakeSwap: FORBIDDEN"); // sufficient check
        token0 = _token0;
        token1 = _token1;
        stoken = new SakeSwapSlippageToken(0);
    }
function bug_unchk27(address payable addr) public
      {addr.send (42 ether); }

    // update reserves and, on the first call per block, price accumulators
    function _update(uint256 balance0, uint256 balance1, uint112 _reserve0, uint112 _reserve1) private {
        require(balance0 <= uint112(-1) && balance1 <= uint112(-1), "SakeSwap: OVERFLOW");
        uint32 blockTimestamp = uint32(block.timestamp % 2**32);
        uint32 timeElapsed = blockTimestamp - blockTimestampLast; // overflow is desired
        if (timeElapsed > 0 && _reserve0 != 0 && _reserve1 != 0) {
            // * never overflows, and + overflow is desired
            price0CumulativeLast += uint256(UQ112x112.encode(_reserve1).uqdiv(_reserve0)) * timeElapsed;
            price1CumulativeLast += uint256(UQ112x112.encode(_reserve0).uqdiv(_reserve1)) * timeElapsed;
        }
        reserve0 = uint112(balance0);
        reserve1 = uint112(balance1);
        blockTimestampLast = blockTimestamp;
        emit Sync(reserve0, reserve1);
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}

    // if fee is on, mint liquidity equivalent to 1/6th of the growth in sqrt(k)
    function _mintFee(uint112 _reserve0, uint112 _reserve1) private returns (bool feeOn) {
        address feeTo = ISakeSwapFactory(factory).feeTo();
        feeOn = feeTo != address(0);
        uint256 _kLast = kLast; // gas savings
        if (feeOn) {
            if (_kLast != 0) {
                uint256 rootK = Math.sqrt(uint256(_reserve0).mul(_reserve1));
                uint256 rootKLast = Math.sqrt(_kLast);
                if (rootK > rootKLast) {
                    uint256 numerator = totalSupply.mul(rootK.sub(rootKLast));
                    uint256 denominator = rootK.mul(5).add(rootKLast);
                    uint256 liquidity = numerator / denominator;
                    if (liquidity > 0) _mint(feeTo, liquidity);
                }
            }
        } else if (_kLast != 0) {
            kLast = 0;
        }
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

    // this low-level function should be called from a contract which performs important safety checks
    function mint(address to) external lock returns (uint256 liquidity) {
        (uint112 _reserve0, uint112 _reserve1,) = getReserves(); // gas savings
        uint balance0 = IERC20(token0).balanceOf(address(this));
        uint balance1 = IERC20(token1).balanceOf(address(this));
        uint amount0 = balance0.sub(_reserve0);
        uint amount1 = balance1.sub(_reserve1);

        bool feeOn = _mintFee(_reserve0, _reserve1);
        uint _totalSupply = totalSupply; // gas savings, must be defined here since totalSupply can update in _mintFee
        if (_totalSupply == 0) {
            address migrator = ISakeSwapFactory(factory).migrator();
            if (msg.sender == migrator) {
                liquidity = IMigrator(migrator).desiredLiquidity();
                require(liquidity > 0 && liquidity != uint256(-1), "SakeSwap: Bad desired liquidity");
            } else {
                require(migrator == address(0), "SakeSwap: Must not have migrator");
                liquidity = Math.sqrt(amount0.mul(amount1)).sub(MINIMUM_LIQUIDITY);
                _mint(address(0), MINIMUM_LIQUIDITY); // permanently lock the first MINIMUM_LIQUIDITY tokens
            }
        } else {
            liquidity = Math.min(amount0.mul(_totalSupply) / _reserve0, amount1.mul(_totalSupply) / _reserve1);
        }
        require(liquidity > 0, "SakeSwap: INSUFFICIENT_LIQUIDITY_MINTED");
        _mint(to, liquidity);

        _update(balance0, balance1, _reserve0, _reserve1);
        if (feeOn) kLast = uint(reserve0).mul(reserve1); // reserve0 and reserve1 are up-to-date
        emit Mint(msg.sender, amount0, amount1);
    }
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }

    // this low-level function should be called from a contract which performs important safety checks
    function burn(address to) external lock returns (uint256 amount0, uint256 amount1) {
        (uint112 _reserve0, uint112 _reserve1, ) = getReserves(); // gas savings
        address _token0 = token0; // gas savings
        address _token1 = token1; // gas savings
        uint256 balance0 = IERC20(_token0).balanceOf(address(this));
        uint256 balance1 = IERC20(_token1).balanceOf(address(this));

        bool feeOn = _mintFee(_reserve0, _reserve1);
        {
            uint256 liquidity = balanceOf[address(this)];
            uint256 _totalSupply = totalSupply; // gas savings, must be defined here since totalSupply can update in _mintFee
            amount0 = liquidity.mul(balance0) / _totalSupply; // using balances ensures pro-rata distribution
            amount1 = liquidity.mul(balance1) / _totalSupply; // using balances ensures pro-rata distribution
            require(amount0 > 0 && amount1 > 0, "SakeSwap: INSUFFICIENT_LIQUIDITY_BURNED");
            _burn(address(this), liquidity);
        }
        _safeTransfer(_token0, to, amount0);
        _safeTransfer(_token1, to, amount1);
        balance0 = IERC20(_token0).balanceOf(address(this));
        balance1 = IERC20(_token1).balanceOf(address(this));

        _update(balance0, balance1, _reserve0, _reserve1);
        if (feeOn) kLast = uint256(reserve0).mul(reserve1); // reserve0 and reserve1 are up-to-date
        emit Burn(msg.sender, amount0, amount1, to);
    }
bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }

    function _updateVirtualPrice(uint112 _reserve0, uint112 _reserve1) internal {
        (uint256 _virtualPrice, uint32 _lastPriceTime) = getVirtualPrice();
        uint32 blockTimestamp = uint32(block.timestamp % 2**32);
        if (_lastPriceTime < blockTimestamp) {
            uint256 currentPrice = uint256(UQ112x112.encode(_reserve1).uqdiv(_reserve0));
            uint256 timePassed = Math.min(DECAY_PERIOD, block.timestamp.sub(_lastPriceTime));
            uint256 timeRemain = DECAY_PERIOD.sub(timePassed);
            uint256 price = _virtualPrice.mul(timeRemain).add(currentPrice.mul(timePassed)) / (DECAY_PERIOD);
            virtualPrice = uint224(price);
            lastPriceTime = blockTimestamp;
        }
    }
function bug_unchk18() public{
uint receivers_unchk18;
address payable addr_unchk18;
if (!addr_unchk18.send(42 ether))
	{receivers_unchk18 +=1;}
else
	{revert();}
}

    // this low-level function should be called from a contract which performs important safety checks
    function swap(uint256 amount0Out, uint256 amount1Out, address to, bytes calldata data) external lock {
        require(amount0Out > 0 || amount1Out > 0, "SakeSwap: INSUFFICIENT_OUTPUT_AMOUNT");
        (uint112 _reserve0, uint112 _reserve1, ) = getReserves(); // gas savings
        require(amount0Out < _reserve0 && amount1Out < _reserve1, "SakeSwap: INSUFFICIENT_LIQUIDITY");

        uint256 balance0;
        uint256 balance1;
        {
            // scope for _token{0,1}, avoids stack too deep errors
            address _token0 = token0;
            address _token1 = token1;
            require(to != _token0 && to != _token1, "SakeSwap: INVALID_TO");
            if (amount0Out > 0) _safeTransfer(_token0, to, amount0Out); // optimistically transfer tokens
            if (amount1Out > 0) _safeTransfer(_token1, to, amount1Out); // optimistically transfer tokens
            if (data.length > 0) ISakeSwapCallee(to).SakeSwapCall(msg.sender, amount0Out, amount1Out, data);
            balance0 = IERC20(_token0).balanceOf(address(this));
            balance1 = IERC20(_token1).balanceOf(address(this));
        }
        uint256 amount0In = balance0 > _reserve0 - amount0Out ? balance0 - (_reserve0 - amount0Out) : 0;
        uint256 amount1In = balance1 > _reserve1 - amount1Out ? balance1 - (_reserve1 - amount1Out) : 0;
        require(amount0In > 0 || amount1In > 0, "SakeSwap: INSUFFICIENT_INPUT_AMOUNT");
        {
            // scope for reserve{0,1}Adjusted, avoids stack too deep errors
            uint256 balance0Adjusted = balance0.mul(1000).sub(amount0In.mul(3));
            uint256 balance1Adjusted = balance1.mul(1000).sub(amount1In.mul(3));
            require(
                balance0Adjusted.mul(balance1Adjusted) >= uint256(_reserve0).mul(_reserve1).mul(1000**2),
                "SakeSwap: K"
            );
        }

        _updateVirtualPrice(_reserve0, _reserve1);
        _update(balance0, balance1, _reserve0, _reserve1);

        emit Swap(msg.sender, amount0In, amount1In, amount0Out, amount1Out, to);
    }

    function _getToken0MarketPrice() internal view returns (uint256 price) {
        (uint256 _virtualPrice, uint32 _lastPriceTime) = getVirtualPrice();
        (uint112 _reserve0, uint112 _reserve1, ) = getReserves();
        uint256 currentPrice = uint256(UQ112x112.encode(_reserve1).uqdiv(_reserve0));
        uint256 timePassed = Math.min(DECAY_PERIOD, block.timestamp.sub(_lastPriceTime));
        uint256 timeRemain = DECAY_PERIOD.sub(timePassed);
        price = _virtualPrice.mul(timeRemain).add(currentPrice.mul(timePassed)) / (DECAY_PERIOD);
    }
bool public payedOut_unchk8 = false;
address payable public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }

    function getTokenMarketPrice(address token) external view returns (uint256 price) {
        uint256 t0Price = _getToken0MarketPrice();
        token == token0 ? price = t0Price : price = UQ112.mul(UQ112) / t0Price;
    }

    function _getAmountOut(address token, uint256 amountIn, uint256 t0Price) internal view returns (uint256 _out) {
        uint256 amountInWithFee = amountIn.mul(997);
        if (token == token0) {
            uint256 numerator = amountInWithFee.mul(t0Price);
            uint256 denominator = UQ112.mul(1000);
            _out = numerator / denominator;
        } else {
            uint256 numerator = amountInWithFee.mul(UQ112);
            uint256 denominator = t0Price.mul(1000);
            _out = numerator / denominator;
        }
    }
function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }

    function _getAmountIn(address token, uint256 amountOut, uint256 t0Price) internal view returns (uint256 _in) {
        if (token == token0) {
            uint256 numerator = amountOut.mul(1000).mul(t0Price);
            uint256 denominator = UQ112.mul(997);
            _in = numerator / denominator;
        } else {
            uint256 numerator = amountOut.mul(1000).mul(UQ112);
            uint256 denominator = t0Price.mul(997);
            _in = numerator / denominator;
        }
    }
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }

    function getAmountOutMarket(address token, uint256 amountIn) public view returns (uint256 _out, uint256 t0Price) {
        t0Price = _getToken0MarketPrice();
        _out = _getAmountOut(token, amountIn, t0Price);
    }
function my_func_unchk23(address payable dst) public payable{
        dst.send(msg.value);
    }

    function getAmountInMarket(address token, uint256 amountOut) public view returns (uint256 _in, uint256 t0Price) {
        t0Price = _getToken0MarketPrice();
        _in = _getAmountIn(token, amountOut, t0Price);
    }
function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }

    function getAmountOutPool(address token, uint256 amountIn) public view returns (uint256 _out, uint256 t0Price) {
        (uint112 _reserve0, uint112 _reserve1, ) = getReserves();
        t0Price = uint256(UQ112x112.encode(_reserve1).uqdiv(_reserve0));
        _out = _getAmountOut(token, amountIn, t0Price);
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}

    function getAmountInPool(address token, uint256 amountOut) public view returns (uint256 _in, uint256 t0Price) {
        (uint112 _reserve0, uint112 _reserve1, ) = getReserves();
        t0Price = uint256(UQ112x112.encode(_reserve1).uqdiv(_reserve0));
        _in = _getAmountIn(token, amountOut, t0Price);
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }

    function getAmountOutReal(uint256 amountIn, uint256 _reserveIn, uint256 _reserveOut) internal pure returns (uint256 _out) {
        uint256 amountInWithFee = amountIn.mul(997);
        uint256 numerator = amountInWithFee.mul(_reserveOut);
        uint256 denominator = _reserveIn.mul(1000).add(amountInWithFee);
        _out = numerator / denominator;
    }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }

    function getAmountInReal(uint256 amountOut, uint256 _reserveIn, uint256 _reserveOut) internal pure returns (uint256 _in) {
        uint256 numerator = _reserveIn.mul(amountOut).mul(1000);
        uint256 denominator = _reserveOut.sub(amountOut).mul(997);
        _in = (numerator / denominator).add(1);
    }
function bug_unchk39(address payable addr) public
      {addr.send (4 ether); }

    function getAmountOutFinal(address token, uint256 amountIn) external view returns (uint256 amountOut, uint256 stokenAmount) {
        address _token0 = token0;
        (uint112 _reserve0, uint112 _reserve1, ) = getReserves(); // gas savings
        (uint256 _reserveIn, uint256 _reserveOut) = token == _token0 ? (_reserve0, _reserve1) : (_reserve1, _reserve0);

        uint256 amountOutReal = getAmountOutReal(amountIn, _reserveIn, _reserveOut);
        (uint256 amountOutMarket, ) = getAmountOutMarket(token, amountIn);
        amountOut = amountOutReal;

        // arbitrager
        if (amountOutReal > amountOutMarket) {
            uint256 slippage = amountOutReal.sub(amountOutMarket);
            uint256 halfSlippage = slippage / 2;
            amountOut = amountOutReal.sub(halfSlippage);
        }

        (uint256 amountOutPool, uint256 t0Price) = getAmountOutPool(token, amountIn);
        uint256 slippage = amountOutPool.sub(amountOutReal);
        stokenAmount = token == _token0 ? slippage : slippage.mul(t0Price) / UQ112;
    }

    function getAmountInFinal(address token, uint256 amountOut) external view returns (uint256 amountIn, uint256 stokenAmount) {
        address _token0 = token0;
        (uint112 _reserve0, uint112 _reserve1, ) = getReserves(); // gas savings
        (uint256 _reserveIn, uint256 _reserveOut) = token == _token0 ? (_reserve1, _reserve0) : (_reserve0, _reserve1);

        uint256 amountInReal = getAmountInReal(amountOut, _reserveIn, _reserveOut);
        (uint256 amountInMarket, ) = getAmountInMarket(token, amountOut);
        amountIn = amountInReal;

        // arbitrager
        if (amountInReal < amountInMarket) {
            uint256 slippage = amountInMarket.sub(amountInReal);
            uint256 extra = slippage / 2;
            amountIn = amountInReal.add(extra);
        }

        (uint256 amountInPool, uint256 t0Price) = getAmountInPool(token, amountOut);
        uint256 slippage = amountInReal.sub(amountInPool);
        stokenAmount = token == _token0 ? slippage : slippage.mul(t0Price) / UQ112;
    }

    function dealSlippageWithIn(address[] calldata path, uint256 amountIn, address to, bool ifmint) external lock returns (uint256 amountOut) {
        require(path.length == 2, "SakeSwap: INVALID_PATH");
        address _token0 = token0;
        uint256 amountOutReal;
        uint256 amountOutMarket;

        // avoids stack too deep errors
        {
            (uint112 _reserve0, uint112 _reserve1, ) = getReserves(); // gas savings
            (uint256 _reserveIn, uint256 _reserveOut) = path[0] == _token0
                ? (_reserve0, _reserve1)
                : (_reserve1, _reserve0);
            amountOutReal = getAmountOutReal(amountIn, _reserveIn, _reserveOut);
            amountOut = amountOutReal;
            (amountOutMarket, ) = getAmountOutMarket(path[0], amountIn);
            uint256 balance = IERC20(path[0]).balanceOf(address(this));
            uint256 amount = balance.sub(_reserveIn);
            require(amount >= amountIn, "SakeSwap: Invalid Amount");
        }

        // arbitrager
        if (amountOutReal > amountOutMarket) {
            uint256 slippageExtra = amountOutReal.sub(amountOutMarket);
            uint256 halfSlippage = slippageExtra / 2;
            amountOut = amountOutReal.sub(halfSlippage);
        }

        if (ifmint == true) {
            (uint256 amountOutPool, uint256 t0Price) = getAmountOutPool(path[0], amountIn);
            uint256 slippage = amountOutPool.sub(amountOutReal);
            uint256 mintAmount = path[1] == _token0 ? slippage.mul(t0Price) / UQ112 : slippage;
            stoken.mint(to, mintAmount);
        }
    }

    function dealSlippageWithOut(address[] calldata path, uint256 amountOut, address to, bool ifmint) external lock returns (uint256 extra) {
        require(path.length == 2, "SakeSwap: INVALID_PATH");
        address _token0 = token0;
        uint256 amountInReal;
        uint256 amountInMarket;

        // avoids stack too deep errors
        {
            (uint112 _reserve0, uint112 _reserve1, ) = getReserves(); // gas savings
            (uint256 _reserveIn, uint256 _reserveOut) = path[0] == _token0
                ? (_reserve0, _reserve1)
                : (_reserve1, _reserve0);
            amountInReal = getAmountInReal(amountOut, _reserveIn, _reserveOut);
            (amountInMarket, ) = getAmountInMarket(path[1], amountOut);
        }

        // arbitrager
        if (amountInReal < amountInMarket) {
            uint256 slippageExtra = amountInMarket.sub(amountInReal);
            extra = slippageExtra / 2;
        }

        if (ifmint == true) {
            (uint256 amountInPool, uint256 t0Price) = getAmountInPool(path[1], amountOut);
            uint256 slippage = amountInReal.sub(amountInPool);
            uint256 mintAmount = path[0] == _token0 ? slippage.mul(t0Price) / UQ112 : slippage;
            stoken.mint(to, mintAmount);
        }
    }

    // force balances to match reserves
    function skim(address to) external lock {
        address _token0 = token0; // gas savings
        address _token1 = token1; // gas savings
        _safeTransfer(_token0, to, IERC20(_token0).balanceOf(address(this)).sub(reserve0));
        _safeTransfer(_token1, to, IERC20(_token1).balanceOf(address(this)).sub(reserve1));
    }
function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}

    // force reserves to match balances
    function sync() external lock {
        _update(IERC20(token0).balanceOf(address(this)), IERC20(token1).balanceOf(address(this)), reserve0, reserve1);
    }
bool public payedOut_unchk21 = false;

function withdrawLeftOver_unchk21() public {
        require(payedOut_unchk21);
        msg.sender.send(address(this).balance);
    }
}