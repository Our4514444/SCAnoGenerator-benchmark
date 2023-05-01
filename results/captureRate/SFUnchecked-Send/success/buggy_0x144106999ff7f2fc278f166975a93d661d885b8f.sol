pragma solidity 0.5.4;


contract Ownable {
  function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
  address public owner;
  function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
  address public pendingOwner;

  function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
    * @dev Throws if called by any account other than the owner.
    */
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    /**
     * @dev Modifier throws if called by any account other than the pendingOwner.
     */
    modifier onlyPendingOwner() {
        require(msg.sender == pendingOwner);
        _;
    }

    constructor() public {
        owner = msg.sender;
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev Allows the current owner to set the pendingOwner address.
     * @param newOwner The address to transfer ownership to.
     */
    function transferOwnership(address newOwner) onlyOwner public {
        pendingOwner = newOwner;
    }
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev Allows the pendingOwner address to finalize the transfer.
     */
    function claimOwnership() onlyPendingOwner public {
        emit OwnershipTransferred(owner, pendingOwner);
        owner = pendingOwner;
        pendingOwner = address(0);
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
}


contract FastnFurious is Ownable {
    using SafeMath for uint;
    
    // round => winner
  function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
  mapping(uint => address payable) public winners;
    
    // round => gain
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  mapping(uint => uint) public balances;
    
  function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  uint public minBet = 0.1 ether; // 0.1 ether;
    
  function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
  uint public startTime = 1551780000; // 03.05.2019 10:00:00
  function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}
  uint public roundTime = 300; // 5 min in sec
    
  function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
  address payable public wallet;
  function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
  address payable public jackpot;
    
  function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
  uint public walletPercent = 20;
  function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
  uint public nextRoundPercent = 15;
  function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}
  uint public jackpotPercent = 15;
        
    constructor (address payable _wallet, address payable _jackpot) public {
        require(_wallet != address(0));
        require(_jackpot != address(0));
        
    	wallet = _wallet;
    	jackpot = _jackpot;  
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
    
    function () external payable {
        require(gasleft() > 150000);
        setBet(msg.sender);
    }
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
    
    function setBet(address payable _player) public payable {
        require(msg.value >= minBet);
        
        uint currentRound = getCurrentRound();
        
        uint previosRound = getPreviosRound();
        if (balances[previosRound] > 0) {
        	
        	uint gain = balances[previosRound];
        	balances[previosRound] = 0;
    
            address payable winner = getWinner(previosRound); 
            winner.transfer(gain);
        }

        uint amount = msg.value;
        uint toWallet = amount.mul(walletPercent).div(100);
        uint toNextRound = amount.mul(nextRoundPercent).div(100);
        uint toJackpot = amount.mul(jackpotPercent).div(100);

        winners[currentRound] = _player;
        
        balances[currentRound] = balances[currentRound].add(amount).sub(toWallet).sub(toNextRound).sub(toJackpot);
        balances[currentRound.add(1)] = balances[currentRound.add(1)].add(toNextRound);
        
        jackpot.transfer(toJackpot);
        wallet.transfer(toWallet);
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
    
    function getWinner(uint _round) public view returns (address payable) {
        if (winners[_round] != address(0)) return winners[_round];
        else return wallet;
    }
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}
    
    function getGain(uint _round) public {
	    require(_round < getCurrentRound());
        require(msg.sender == getWinner(_round));
        
    	uint gain = balances[_round];
    	balances[_round] = 0;

        address(msg.sender).transfer(gain);
    }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}
    
    function changeRoundTime(uint _time) onlyOwner public {
        roundTime = _time;
    }
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}
    
    function changeStartTime(uint _time) onlyOwner public {
        startTime = _time;    
    }
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
    
    function changeWallet(address payable _wallet) onlyOwner public {
        wallet = _wallet;
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

    function changeJackpot(address payable _jackpot) onlyOwner public {
        jackpot = _jackpot;
    }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
    
    function changeMinimalBet(uint _minBet) onlyOwner public {
        minBet = _minBet;
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
    
    function changePercents(uint _toWinner, uint _toNextRound, uint _toWallet, uint _toJackPot) onlyOwner public {
        uint total = _toWinner.add(_toNextRound).add(_toWallet).add(_toJackPot);
        require(total == 100);
        
        walletPercent = _toWallet;
        nextRoundPercent = _toNextRound;
        jackpotPercent = _toJackPot;
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
    
    function getCurrentRound() public view returns (uint) {
        return now.sub(startTime).div(roundTime).add(1); // start round is 1
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
    
    function getPreviosRound() public view returns (uint) {
        return getCurrentRound().sub(1);    
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
    
    function getRoundBalance(uint _round) public view returns (uint) {
        return balances[_round];
    }
function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
    
    function getRoundByTime(uint _time) public view returns (uint) {
        return _time.sub(startTime).div(roundTime);
    }
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
}

/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {

    /**
    * @dev Multiplies two numbers, throws on overflow.
    */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

    /**
    * @dev Integer division of two numbers, truncating the quotient.
    */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }

    /**
    * @dev Subtracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
    */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    /**
    * @dev Adds two numbers, throws on overflow.
    */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}