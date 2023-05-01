pragma solidity ^0.5.7;

interface TokenInterface {
    function allowance(address, address) external view returns (uint);
    function balanceOf(address) external view returns (uint);
    function approve(address, uint) external;
    function transfer(address, uint) external returns (bool);
    function transferFrom(address, address, uint) external returns (bool);
    function deposit() external payable;
    function withdraw(uint) external;
}

interface KyberInterface {
    function trade(
        address src,
        uint srcAmount,
        address dest,
        address destAddress,
        uint maxDestAmount,
        uint minConversionRate,
        address walletId
        ) external payable returns (uint);

    function getExpectedRate(
        address src,
        address dest,
        uint srcQty
        ) external view returns (uint, uint);
}

interface Eth2DaiInterface {
    function getBuyAmount(address dest, address src, uint srcAmt) external view returns(uint);
	function getPayAmount(address src, address dest, uint destAmt) external view returns (uint);
	function sellAllAmount(
        address src,
        uint srcAmt,
        address dest,
        uint minDest
    ) external returns (uint destAmt);
	function buyAllAmount(
        address dest,
        uint destAmt,
        address src,
        uint maxSrc
    ) external returns (uint srcAmt);
}


contract DSMath {

    function add(uint x, uint y) internal pure returns (uint z) {
        require((z = x + y) >= x, "math-not-safe");
    }
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}

    function sub(uint x, uint y) internal pure returns (uint z) {
        require((z = x - y) <= x, "ds-math-sub-underflow");
    }
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}

    function mul(uint x, uint y) internal pure returns (uint z) {
        require(y == 0 || (z = x * y) / y == x, "math-not-safe");
    }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}

    uint constant WAD = 10 ** 18;
    uint constant RAY = 10 ** 27;

    function rmul(uint x, uint y) internal pure returns (uint z) {
        z = add(mul(x, y), RAY / 2) / RAY;
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}

    function rdiv(uint x, uint y) internal pure returns (uint z) {
        z = add(mul(x, RAY), y / 2) / y;
    }
function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}

    function wmul(uint x, uint y) internal pure returns (uint z) {
        z = add(mul(x, y), WAD / 2) / WAD;
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}

    function wdiv(uint x, uint y) internal pure returns (uint z) {
        z = add(mul(x, WAD), y / 2) / y;
    }
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}

}


contract Helper is DSMath {

    address public eth2daiAddr = 0x39755357759cE0d7f32dC8dC45414CCa409AE24e;
    address public kyberAddr = 0x818E6FECD516Ecc3849DAf6845e3EC868087B755;
  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  address public ethAddr = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;
  function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
  address public wethAddr = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
  function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
  address public daiAddr = 0x89d24A6b4CcB1B6fAA2625fE562bDD9a23260359;
  function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
  address public adminOne = 0xa7615CD307F323172331865181DC8b80a2834324;
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  address public adminTwo = 0x7284a8451d9a0e7Dc62B3a71C0593eA2eC5c5638;
  function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  uint public maxSplitAmtEth = 60000000000000000000;
  function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
  uint public maxSplitAmtDai = 20000000000000000000000;
  function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}
  uint public cut = 997500000000000000; // 0.25% charge

    function setAllowance(TokenInterface _token, address _spender) internal {
        if (_token.allowance(address(this), _spender) != uint(-1)) {
            _token.approve(_spender, uint(-1));
        }
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}

    modifier isAdmin {
        require(msg.sender == adminOne || msg.sender == adminTwo, "Not an Admin");
        _;
    }

}


contract AdminStuffs is Helper {

    function setSplitEth(uint amt) public isAdmin {
        maxSplitAmtEth = amt;
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

    function setSplitDai(uint amt) public isAdmin {
        maxSplitAmtDai = amt;
    }
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}

    function withdrawToken(address token) public isAdmin {
        uint daiBal = TokenInterface(token).balanceOf(address(this));
        TokenInterface(token).transfer(msg.sender, daiBal);
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

    function withdrawEth() public payable isAdmin {
        msg.sender.transfer(address(this).balance);
    }
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}

    function changeFee(uint amt) public isAdmin {
        if (amt > 997000000000000000) {
            cut = 997000000000000000; // maximum fees can be 0.3%. Minimum 0%
        } else {
            cut = amt;
        }
    }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}

}


contract SplitHelper is AdminStuffs {

    function getBest(address src, address dest, uint srcAmt) public view returns (uint bestExchange, uint destAmt) {
        uint finalSrcAmt = srcAmt;
        if (src == daiAddr) {
            finalSrcAmt = wmul(srcAmt, cut);
        }
        uint eth2DaiPrice = getRateEth2Dai(src, dest, finalSrcAmt);
        uint kyberPrice = getRateKyber(src, dest, finalSrcAmt);
        if (eth2DaiPrice > kyberPrice) {
            destAmt = eth2DaiPrice;
            bestExchange = 0;
        } else if (kyberPrice >= eth2DaiPrice) {
            destAmt = kyberPrice;
            bestExchange = 1;
        }
        if (dest == daiAddr) {
            destAmt = wmul(destAmt, cut);
        }
        require(destAmt != 0, "Dest Amt = 0");
    }
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}

    function getRateEth2Dai(address src, address dest, uint srcAmt) internal view returns (uint destAmt) {
        if (src == ethAddr) {
            destAmt = Eth2DaiInterface(eth2daiAddr).getBuyAmount(dest, wethAddr, srcAmt);
        } else if (dest == ethAddr) {
            destAmt = Eth2DaiInterface(eth2daiAddr).getBuyAmount(wethAddr, src, srcAmt);
        }
    }
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}

    function getRateKyber(address src, address dest, uint srcAmt) internal view returns (uint destAmt) {
        (uint kyberPrice,) = KyberInterface(kyberAddr).getExpectedRate(src, dest, srcAmt);
        destAmt = wmul(srcAmt, kyberPrice);
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

}


contract SplitResolver is SplitHelper {

  function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  event LogEthToDai(uint srcAmt, uint destAmt);
  function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  event LogDaiToEth(uint srcAmt, uint destAmt);

    function ethToDaiLoop(uint srcAmt, uint splitAmt, uint finalAmt) internal returns (uint destAmt) {
        if (srcAmt > splitAmt) {
            uint amtToSwap = splitAmt;
            uint nextSrcAmt = srcAmt - splitAmt;
            (uint bestExchange,) = getBest(ethAddr, daiAddr, amtToSwap);
            uint daiBought = finalAmt;
            if (bestExchange == 0) {
                daiBought += swapEth2Dai(wethAddr, daiAddr, amtToSwap);
            } else if (bestExchange == 1) {
                daiBought += swapKyber(ethAddr, daiAddr, amtToSwap);
            }
            destAmt = ethToDaiLoop(nextSrcAmt, splitAmt, daiBought);
        } else if (srcAmt > 0) {
            destAmt = finalAmt;
            destAmt += swapKyber(ethAddr, daiAddr, srcAmt);
        } else {
            destAmt = finalAmt;
        }
    }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}

    function daiToEthLoop(uint srcAmt, uint splitAmt, uint finalAmt) internal returns (uint destAmt) {
        if (srcAmt > splitAmt) {
            uint amtToSwap = splitAmt;
            uint nextSrcAmt = srcAmt - splitAmt;
            (uint bestExchange,) = getBest(daiAddr, ethAddr, amtToSwap);
            uint ethBought = finalAmt;
            if (bestExchange == 0) {
                ethBought += swapEth2Dai(daiAddr, wethAddr, amtToSwap);
            } else if (bestExchange == 1) {
                ethBought += swapKyber(daiAddr, ethAddr, amtToSwap);
            }
            destAmt = daiToEthLoop(nextSrcAmt, splitAmt, ethBought);
        } else if (srcAmt > 0) {
            destAmt = finalAmt;
            destAmt += swapKyber(daiAddr, ethAddr, srcAmt);
            TokenInterface wethContract = TokenInterface(wethAddr);
            uint balanceWeth = wethContract.balanceOf(address(this));
            if (balanceWeth > 0) {
                wethContract.withdraw(balanceWeth);
            }
        } else {
            TokenInterface wethContract = TokenInterface(wethAddr);
            uint balanceWeth = wethContract.balanceOf(address(this));
            if (balanceWeth > 0) {
                wethContract.withdraw(balanceWeth);
            }
            destAmt = finalAmt;
        }
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}

    function swapEth2Dai(address src, address dest, uint srcAmt) internal returns (uint destAmt) {
        if (src == wethAddr) {
            TokenInterface(wethAddr).deposit.value(srcAmt)();
        }
        destAmt = Eth2DaiInterface(eth2daiAddr).sellAllAmount(
                src,
                srcAmt,
                dest,
                0
            );
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}

    function swapKyber(address src, address dest, uint srcAmt) internal returns (uint destAmt) {
        uint ethAmt = src == ethAddr ? srcAmt : 0;
        destAmt = KyberInterface(kyberAddr).trade.value(ethAmt)(
                src,
                srcAmt,
                dest,
                address(this),
                2**255,
                0,
                adminOne
            );
    }

}


contract SplitSwap is SplitResolver {

    function ethToDaiSwap(uint splitAmt, uint slippageAmt) public payable returns (uint destAmt) { // srcAmt = msg.value
        require(maxSplitAmtEth >= splitAmt, "split amt > max");
        destAmt = ethToDaiLoop(msg.value, splitAmt, 0);
        destAmt = wmul(destAmt, cut);
        require(destAmt > slippageAmt, "Dest Amt < slippage");
        require(TokenInterface(daiAddr).transfer(msg.sender, destAmt), "Not enough DAI to transfer");
        emit LogEthToDai(msg.value, destAmt);
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}

    function daiToEthSwap(uint srcAmt, uint splitAmt, uint slippageAmt) public returns (uint destAmt) {
        require(maxSplitAmtDai >= splitAmt, "split amt > max");
        require(TokenInterface(daiAddr).transferFrom(msg.sender, address(this), srcAmt), "Token Approved?");
        uint finalSrcAmt = wmul(srcAmt, cut);
        destAmt = daiToEthLoop(finalSrcAmt, splitAmt, 0);
        require(destAmt > slippageAmt, "Dest Amt < slippage");
        msg.sender.transfer(destAmt);
        emit LogDaiToEth(finalSrcAmt, destAmt);
    }

}


contract InstaSwap is SplitSwap {

    constructor() public {
        setAllowance(TokenInterface(daiAddr), eth2daiAddr);
        setAllowance(TokenInterface(daiAddr), kyberAddr);
        setAllowance(TokenInterface(wethAddr), eth2daiAddr);
        setAllowance(TokenInterface(wethAddr), wethAddr);
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

    function() external payable {}
function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}

}