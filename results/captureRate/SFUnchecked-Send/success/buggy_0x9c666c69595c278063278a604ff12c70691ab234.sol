pragma solidity 0.5.4;

interface IDGTXToken {
    function transfer(address to, uint value) external returns (bool);
    function balanceOf(address) external view returns (uint256);
}

interface IWhitelist {
    function approved(address user) external view returns (bool);
}

interface ITreasury {
    function phaseNum() external view returns (uint256);
}

contract Sale {
  function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
  address public owner;
  function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}
  address public whitelist;
  function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
  address public token;
  function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
  address public treasury;

  function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => mapping(uint256 => uint256)) public purchased;

    uint256 internal rate;
  function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
  uint256 internal constant RATE_DELIMITER = 1000;
  function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}
  uint256 internal constant ONE_TOKEN = 1e18; //1 DGTX
  function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
  uint256 internal constant PURCHASE_LIMIT = 1e24; //1 000 000 DGTX

  function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
  uint256 internal oldRate;
  function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
  uint256 internal constant RATE_UPDATE_DELAY = 15 minutes;
  function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
  uint256 internal rateBecomesValidAt;

  function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
  event Purchase(address indexed buyer, uint256 amount);
  function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
  event RateUpdate(uint256 newRate, uint256 rateBecomesValidAt);
  function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
  function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  event TokensReceived(uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    modifier onlyWhitelisted() {
        require(IWhitelist(whitelist).approved(msg.sender));
        _;
    }

    constructor(address _token, address _whitelist, address _treasury, uint256 _rate) public {
        require(_token != address(0));
        require(_whitelist != address(0));
        require(_treasury != address(0));
        require(_rate != 0);

        owner = msg.sender;
        token = _token;
        whitelist = _whitelist;
        treasury = _treasury;
        rate = _rate;
    }
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}

    function() external payable {
        require(msg.data.length == 0);

        buy();
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

    function updateRate(uint256 newRate) external onlyOwner {
        require(newRate != 0);

        if (now > rateBecomesValidAt) {
            oldRate = rate;
        }
        rate = newRate;
        rateBecomesValidAt = now + RATE_UPDATE_DELAY;
        emit RateUpdate(newRate, rateBecomesValidAt);
    }
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}

    function withdraw() external onlyOwner {
        require(address(this).balance > 0);

        msg.sender.transfer(address(this).balance);
    }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}

    function withdraw(address payable to) external onlyOwner {
        require(address(this).balance > 0);

        to.transfer(address(this).balance);
    }
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}

    function transferOwnership(address _owner) external onlyOwner {
        require(_owner != address(0));

        emit OwnershipTransferred(owner, _owner);

        owner = _owner;
    }
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}

    function tokenFallback(address, uint value, bytes calldata) external {
        require(msg.sender == token);

        emit TokensReceived(value);
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

    function availablePersonal(address user) external view returns (uint256) {
        if (IWhitelist(whitelist).approved(user)) {
            uint256 currentPhase = ITreasury(treasury).phaseNum();
            return PURCHASE_LIMIT - purchased[user][currentPhase];
        }
        return 0;
    }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}

    function buy() public payable onlyWhitelisted() returns (uint256) {
        uint256 availableTotal = availableTokens();
        require(availableTotal > 0);

        uint256 currentPhase = ITreasury(treasury).phaseNum();
        uint256 personalRestrictions = PURCHASE_LIMIT - purchased[msg.sender][currentPhase];
        require(personalRestrictions > 0);

        uint256 amount = weiToTokens(msg.value);
        require(amount >= ONE_TOKEN); // 1 DGTX

        // actual = min(amount, availableTotal, availablePersonal)
        uint256 actual = amount < availableTotal ? amount : availableTotal;
        actual = actual < personalRestrictions ? actual : personalRestrictions;

        purchased[msg.sender][currentPhase] += actual;

        require(IDGTXToken(token).transfer(msg.sender, actual));

        if (amount != actual) {
            uint256 weiRefund = msg.value - tokensToWei(actual);
            msg.sender.transfer(weiRefund);
        }

        emit Purchase(msg.sender, actual);

        return actual;
    }

    function currentRate() public view returns (uint256) {
        return (now < rateBecomesValidAt) ? oldRate : rate;
    }

    function weiToTokens(uint256 weiAmount) public view returns (uint256) {
        uint256 exchangeRate = currentRate();

        return weiAmount * exchangeRate / RATE_DELIMITER;
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}

    function tokensToWei(uint256 tokensAmount) public view returns (uint256) {
        uint256 exchangeRate = currentRate();

        return tokensAmount * RATE_DELIMITER / exchangeRate;
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}

    function futureRate() public view returns (uint256, uint256) {
        return (now < rateBecomesValidAt) ? (rate, rateBecomesValidAt - now) : (rate, 0);
    }

    function availableTokens() public view returns (uint256) {
        return IDGTXToken(token).balanceOf(address(this));
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
}