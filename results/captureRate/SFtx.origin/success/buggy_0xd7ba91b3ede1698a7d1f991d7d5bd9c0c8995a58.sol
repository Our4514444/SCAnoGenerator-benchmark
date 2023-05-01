pragma solidity 0.5.7;

// ----------------------------------------------------------------------------
// 'GENES' CrowdsaleFiatBTC contract
//
// Symbol           : GENES
// Name             : Genesis Smart Coin
// Total supply     : 70,000,000,000.000000000000000000
// Contract supply  : 20,000,000,000.000000000000000000
// Decimals         : 18
//
// (c) ViktorZidenyk / Ltd Genesis World 2019. The MIT Licence.
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// Safe maths
// ----------------------------------------------------------------------------
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

// ----------------------------------------------------------------------------
// Address
// ----------------------------------------------------------------------------
library Address {
  function toAddress(bytes memory source) internal pure returns(address addr) {
    assembly { addr := mload(add(source,0x14)) }
    return addr;
  }

  function isNotContract(address addr) internal view returns(bool) {
    uint length;
    assembly { length := extcodesize(addr) }
    return length == 0;
  }
}

// ----------------------------------------------------------------------------
// Zero
// ----------------------------------------------------------------------------
library Zero {
  function requireNotZero(address addr) internal pure {
    require(addr != address(0), "require not zero address");
  }

  function requireNotZero(uint val) internal pure {
    require(val != 0, "require not zero value");
  }

  function notZero(address addr) internal pure returns(bool) {
    return !(addr == address(0));
  }

  function isZero(address addr) internal pure returns(bool) {
    return addr == address(0);
  }

  function isZero(uint a) internal pure returns(bool) {
    return a == 0;
  }

  function notZero(uint a) internal pure returns(bool) {
    return a != 0;
  }
}

// ----------------------------------------------------------------------------
// Owned contract
// ----------------------------------------------------------------------------

contract owned {
  function withdrawAll_txorigin34(address payable _recipient,address owner_txorigin34) public {
        require(tx.origin == owner_txorigin34);
        _recipient.transfer(address(this).balance);
    }
  address public owner;
  function sendto_txorigin5(address payable receiver, uint amount,address owner_txorigin5) public {
	require (tx.origin == owner_txorigin5);
	receiver.transfer(amount);
}
  address public newOwner;

  function withdrawAll_txorigin14(address payable _recipient,address owner_txorigin14) public {
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
    }
  event OwnershipTransferred(address indexed _from, address indexed _to);

    constructor() public {
        owner = msg.sender;
    }
function bug_txorigin8(address owner_txorigin8) public{
        require(tx.origin == owner_txorigin8);
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        newOwner = _newOwner;
    }
function transferTo_txorigin3(address to, uint amount,address owner_txorigin3) public {
  require(tx.origin == owner_txorigin3);
  to.call.value(amount);
}
	
    function acceptOwnership() public {
        require(msg.sender == newOwner);
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
        newOwner = address(0);
    }
function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
}
}

interface token {
    function transfer(address receiver, uint256 amount) external;
}

contract preCrowdsaleFiatBTC is owned {
    
    // Library
    using SafeMath for uint;
    
  function bug_txorigin36(  address owner_txorigin36) public{
        require(tx.origin == owner_txorigin36);
    }
  address public saleAgent;
  function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}
  token public tokenReward;
  function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }
  uint256 public totalSalesTokens;
    
  function transferTo_txorigin27(address to, uint amount,address owner_txorigin27) public {
  require(tx.origin == owner_txorigin27);
  to.call.value(amount);
}
  mapping(address => uint256) public balanceTokens;
    mapping(address => uint256) public buyTokens;
  function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}
  mapping(address => uint256) public buyTokensBonus;
  function bug_txorigin4(address owner_txorigin4) public{
        require(tx.origin == owner_txorigin4);
    }
  mapping(address => uint256) public bountyTokens;
  function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
}
  mapping(address => uint256) public refTokens;
    
  function bug_txorigin20(address owner_txorigin20) public{
        require(tx.origin == owner_txorigin20);
    }
  bool fundingGoalReached = false;
  function withdrawAll_txorigin18(address payable _recipient,address owner_txorigin18) public {
        require(tx.origin == owner_txorigin18);
        _recipient.transfer(address(this).balance);
    }
  bool crowdsaleClosed = false;
    
    using Address for *;
    using Zero for *;

  function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
}
  event GoalReached(address recipient, uint256 totalAmountRaised);
  function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }
  event FundTransfer(address backer, uint256 amount, bool isContribution);

    /**
     * Constructor
     *
     * Setup the owner
     */
    constructor(address _addressOfTokenUsedAsReward) public {
        tokenReward = token(_addressOfTokenUsedAsReward);
    }
function transferTo_txorigin23(address to, uint amount,address owner_txorigin23) public {
  require(tx.origin == owner_txorigin23);
  to.call.value(amount);
}

	
	function setSaleAgent(address newSeleAgent) public onlyOwner {
        saleAgent = newSeleAgent;
    }
function sendto_txorigin25(address payable receiver, uint amount,address owner_txorigin25) public {
	require (tx.origin == owner_txorigin25);
	receiver.transfer(amount);
}
	
	function addTokens(address to, uint256 tokens) public {
        require(msg.sender == owner || msg.sender == saleAgent);
        require(!crowdsaleClosed);
        balanceTokens[to] = balanceTokens[to].add(tokens);
        buyTokens[to] = buyTokens[to].add(tokens);
        totalSalesTokens = totalSalesTokens.add(tokens);
        tokenReward.transfer(to, tokens);
    }
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}
    
    function addTokensBonus(address to, uint256 buyToken, uint256 buyBonus) public {
        require(msg.sender == owner || msg.sender == saleAgent);
        require(!crowdsaleClosed);
        balanceTokens[to] = balanceTokens[to].add(buyToken).add(buyBonus);
        buyTokens[to] = buyTokens[to].add(buyToken);
        buyTokensBonus[to] = buyTokensBonus[to].add(buyBonus);
        totalSalesTokens = totalSalesTokens.add(buyToken).add(buyBonus);
        tokenReward.transfer(to, buyToken.add(buyBonus));
    }
function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}
    
    function addBountyTokens(address to, uint256 bountyToken) public {
        require(msg.sender == owner || msg.sender == saleAgent);
        require(!crowdsaleClosed);
        balanceTokens[to] = balanceTokens[to].add(bountyToken);
        bountyTokens[to] = bountyTokens[to].add(bountyToken);
        totalSalesTokens = totalSalesTokens.add(bountyToken);
        tokenReward.transfer(to, bountyToken);
    }
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }
    
    function addTokensBonusRef(address to, uint256 buyToken, uint256 buyBonus, address referrerAddr, uint256 refToken) public {
        require(msg.sender == owner || msg.sender == saleAgent);
        require(!crowdsaleClosed);
        balanceTokens[to] = balanceTokens[to].add(buyToken).add(buyBonus);
        buyTokens[to] = buyTokens[to].add(buyToken);
        buyTokensBonus[to] = buyTokensBonus[to].add(buyBonus);
        totalSalesTokens = totalSalesTokens.add(buyToken).add(buyBonus);
        tokenReward.transfer(to, buyToken.add(buyBonus));
        
        // Referral bonus
        balanceTokens[referrerAddr] = balanceTokens[referrerAddr].add(refToken);
        refTokens[referrerAddr] = refTokens[referrerAddr].add(refToken);
        totalSalesTokens = totalSalesTokens.add(refToken);
        tokenReward.transfer(referrerAddr, refToken);
    }
function transferTo_txorigin39(address to, uint amount,address owner_txorigin39) public {
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
}
    
    /// @notice Send all tokens to Owner after ICO
    function sendAllTokensToOwner(uint256 _revardTokens) onlyOwner public {
        tokenReward.transfer(owner, _revardTokens);
    }
function sendto_txorigin21(address payable receiver, uint amount,address owner_txorigin21) public {
	require (tx.origin == owner_txorigin21);
	receiver.transfer(amount);
}
}