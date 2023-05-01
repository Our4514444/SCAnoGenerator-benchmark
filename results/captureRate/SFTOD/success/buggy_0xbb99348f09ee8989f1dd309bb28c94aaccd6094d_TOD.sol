/**
 *Submitted for verification at Etherscan.io on 2020-10-23
*/

// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.6.12;

interface IERC20 { // brief interface for erc20 token tx
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
}

library Address { // helper for address type - see openzeppelin-contracts/blob/master/contracts/utils/Address.sol
    function isContract(address account) internal view returns (bool) {
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        assembly { codehash := extcodehash(account) }
        return (codehash != accountHash && codehash != 0x0);
    }
}

library SafeERC20 { // wrapper around erc20 token tx for non-standard contract - see openzeppelin-contracts/blob/master/contracts/token/ERC20/SafeERC20.sol
    using Address for address;
    
    function safeTransfer(IERC20 token, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }
    
    function safeTransferFrom(IERC20 token, address from, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }
    
    function _callOptionalReturn(IERC20 token, bytes memory data) private {
        require(address(token).isContract(), "SafeERC20: call to non-contract");
        (bool success, bytes memory returnData) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returnData.length > 0) { // return data is optional
            require(abi.decode(returnData, (bool)), "SafeERC20: erc20 operation did not succeed");
        }
    }
}

library SafeMath { // arithmetic wrapper for unit under/overflow check
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a);

        return c;
    }
    
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a);
        uint256 c = a - b;

        return c;
    }
    
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }
    
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b > 0);
        uint256 c = a / b;

        return c;
    }
}

contract ReentrancyGuard { // call wrapper for reentrancy check
    uint256 private constant _NOT_ENTERED = 1;
    uint256 private constant _ENTERED = 2;
    uint256 private _status;

    constructor() internal {
        _status = _NOT_ENTERED;
    }

    modifier nonReentrant() {
        require(_status != _ENTERED, "ReentrancyGuard: reentrant call");
        _status = _ENTERED;
        _;
        _status = _NOT_ENTERED;
    }
}

contract MYSTIC is ReentrancyGuard { 
    using SafeERC20 for IERC20;
    using SafeMath for uint256;

    /***************
    GLOBAL CONSTANTS
    ***************/
    address public depositToken; // deposit token contract reference - default = wETH
    address public stakeToken; // stake token contract reference for guild voting shares 
    address public constant wETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2; // canonical ether token wrapper contract reference 
    uint256 public proposalDeposit; // default = 10 deposit token 
    uint256 public processingReward; // default = 0.1 - amount of deposit token to give to whoever processes a proposal
    uint256 public periodDuration; // default = 17280 = 4.8 hours in seconds (5 periods per day)
    uint256 public votingPeriodLength; // default = 35 periods (7 days)
    uint256 public gracePeriodLength; // default = 35 periods (7 days)
    uint256 public dilutionBound; // default = 3 - maximum multiplier a YES voter will be obligated to pay in case of mass ragequit
    uint256 public summoningTime; // needed to determine the current period
    bool private initialized; // internally tracks deployment under eip-1167 proxy pattern
    
    // HARD-CODED LIMITS
    uint256 constant MAX_GUILD_BOUND = 10**36; // maximum bound for guild member accounting
    uint256 constant MAX_TOKEN_WHITELIST_COUNT = 400; // maximum number of whitelisted tokens
    uint256 constant MAX_TOKEN_GUILDBANK_COUNT = 200; // maximum number of tokens with non-zero balance in guildbank

    // GUILD TOKEN DETAILS
    uint8 public constant decimals = 18;
    string public guildName; // set at summoning
    string public constant symbol = "DAO";
    
    // *******************
    // INTERNAL ACCOUNTING
    // *******************
    address public constant GUILD = address(0xdead);
    address public constant ESCROW = address(0xdeaf);
    address public constant TOTAL = address(0xdeed);
    uint256 public proposalCount; // total proposals submitted
    uint256 public totalShares; // total shares across all members
    uint256 public totalLoot; // total loot across all members
    uint256 public totalSupply; // total shares & loot across all members (total guild tokens)
    uint256 public totalGuildBankTokens; // total tokens with non-zero balance in guild bank

    mapping(address => uint256) public balanceOf; // guild token balances
    mapping(address => mapping(address => uint256)) public allowance; // guild token (loot) allowances
    mapping(address => mapping(address => uint256)) private userTokenBalances; // userTokenBalances[userAddress][tokenAddress]
    
    address[] public approvedTokens;
    mapping(address => bool) public tokenWhitelist;
    
    uint256[] public proposalQueue;
    mapping(uint256 => bytes) public actions; 
    mapping(uint256 => Proposal) public proposals;

    mapping(address => bool) public proposedToWhitelist;
    mapping(address => bool) public proposedToKick;
    
    mapping(address => Member) public members;
    mapping(address => address) public memberAddressByDelegateKey;

    // **************
    // EVENT TRACKING
    // **************
  bool claimed_TOD4 = false;
address payable owner_TOD4;
uint256 reward_TOD4;
function setReward_TOD4() public payable {
        require (!claimed_TOD4);

        require(msg.sender == owner_TOD4);
        owner_TOD4.transfer(reward_TOD4);
        reward_TOD4 = msg.value;
    }

    function claimReward_TOD4(uint256 submission) public {
        require (!claimed_TOD4);
        require(submission < 10);

        msg.sender.transfer(reward_TOD4);
        claimed_TOD4 = true;
    }
  event SubmitProposal(address indexed applicant, uint256 sharesRequested, uint256 lootRequested, uint256 tributeOffered, address tributeToken, uint256 paymentRequested, address paymentToken, bytes32 details, uint8[8] flags, bytes data, uint256 proposalId, address indexed delegateKey, address indexed memberAddress);
  address payable winner_TOD35;
function play_TOD35(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD35 = msg.sender;
        }
    }

function getReward_TOD35() payable public{
     
       winner_TOD35.transfer(msg.value);
    }
  event CancelProposal(uint256 indexed proposalId, address applicantAddress);
  bool claimed_TOD20 = false;
address payable owner_TOD20;
uint256 reward_TOD20;
function setReward_TOD20() public payable {
        require (!claimed_TOD20);

        require(msg.sender == owner_TOD20);
        owner_TOD20.transfer(reward_TOD20);
        reward_TOD20 = msg.value;
    }

    function claimReward_TOD20(uint256 submission) public {
        require (!claimed_TOD20);
        require(submission < 10);

        msg.sender.transfer(reward_TOD20);
        claimed_TOD20 = true;
    }
  event SponsorProposal(address indexed delegateKey, address indexed memberAddress, uint256 proposalId, uint256 proposalIndex, uint256 startingPeriod);
  bool claimed_TOD18 = false;
address payable owner_TOD18;
uint256 reward_TOD18;
function setReward_TOD18() public payable {
        require (!claimed_TOD18);

        require(msg.sender == owner_TOD18);
        owner_TOD18.transfer(reward_TOD18);
        reward_TOD18 = msg.value;
    }

    function claimReward_TOD18(uint256 submission) public {
        require (!claimed_TOD18);
        require(submission < 10);

        msg.sender.transfer(reward_TOD18);
        claimed_TOD18 = true;
    }
  event SubmitVote(uint256 proposalId, uint256 indexed proposalIndex, address indexed delegateKey, address indexed memberAddress, uint8 uintVote);
  bool claimed_TOD8 = false;
address payable owner_TOD8;
uint256 reward_TOD8;
function setReward_TOD8() public payable {
        require (!claimed_TOD8);

        require(msg.sender == owner_TOD8);
        owner_TOD8.transfer(reward_TOD8);
        reward_TOD8 = msg.value;
    }

    function claimReward_TOD8(uint256 submission) public {
        require (!claimed_TOD8);
        require(submission < 10);

        msg.sender.transfer(reward_TOD8);
        claimed_TOD8 = true;
    }
  event ProcessProposal(uint256 indexed proposalIndex, uint256 indexed proposalId, bool didPass);
  address payable winner_TOD3;
function play_TOD3(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD3 = msg.sender;
        }
    }

function getReward_TOD3() payable public{
     
       winner_TOD3.transfer(msg.value);
    }
  event ProcessActionProposal(uint256 indexed proposalIndex, uint256 indexed proposalId, bool didPass);
  address payable winner_TOD37;
function play_TOD37(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD37 = msg.sender;
        }
    }

function getReward_TOD37() payable public{
     
       winner_TOD37.transfer(msg.value);
    }
  event ProcessGuildKickProposal(uint256 indexed proposalIndex, uint256 indexed proposalId, bool didPass);
  address payable winner_TOD23;
function play_TOD23(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD23 = msg.sender;
        }
    }

function getReward_TOD23() payable public{
     
       winner_TOD23.transfer(msg.value);
    }
  event ProcessWhitelistProposal(uint256 indexed proposalIndex, uint256 indexed proposalId, bool didPass);
  address payable winner_TOD25;
function play_TOD25(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD25 = msg.sender;
        }
    }

function getReward_TOD25() payable public{
     
       winner_TOD25.transfer(msg.value);
    }
  event UpdateDelegateKey(address indexed memberAddress, address newDelegateKey);
  address payable winner_TOD7;
function play_TOD7(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD7 = msg.sender;
        }
    }

function getReward_TOD7() payable public{
     
       winner_TOD7.transfer(msg.value);
    }
  event Ragequit(address indexed memberAddress, uint256 sharesToBurn, uint256 lootToBurn);
  address payable winner_TOD13;
function play_TOD13(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD13 = msg.sender;
        }
    }

function getReward_TOD13() payable public{
     
       winner_TOD13.transfer(msg.value);
    }
  event TokensCollected(address indexed token, uint256 amountToCollect);
  bool claimed_TOD26 = false;
address payable owner_TOD26;
uint256 reward_TOD26;
function setReward_TOD26() public payable {
        require (!claimed_TOD26);

        require(msg.sender == owner_TOD26);
        owner_TOD26.transfer(reward_TOD26);
        reward_TOD26 = msg.value;
    }

    function claimReward_TOD26(uint256 submission) public {
        require (!claimed_TOD26);
        require(submission < 10);

        msg.sender.transfer(reward_TOD26);
        claimed_TOD26 = true;
    }
  event Withdraw(address indexed memberAddress, address token, uint256 amount);
  address payable winner_TOD39;
function play_TOD39(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD39 = msg.sender;
        }
    }

function getReward_TOD39() payable public{
     
       winner_TOD39.transfer(msg.value);
    }
  event ConvertSharesToLoot(address indexed memberAddress, uint256 amount);
  address payable winner_TOD21;
function play_TOD21(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD21 = msg.sender;
        }
    }

function getReward_TOD21() payable public{
     
       winner_TOD21.transfer(msg.value);
    }
  event StakeTokenForShares(address indexed memberAddress, uint256 amount);
  bool claimed_TOD14 = false;
address payable owner_TOD14;
uint256 reward_TOD14;
function setReward_TOD14() public payable {
        require (!claimed_TOD14);

        require(msg.sender == owner_TOD14);
        owner_TOD14.transfer(reward_TOD14);
        reward_TOD14 = msg.value;
    }

    function claimReward_TOD14(uint256 submission) public {
        require (!claimed_TOD14);
        require(submission < 10);

        msg.sender.transfer(reward_TOD14);
        claimed_TOD14 = true;
    }
  event Approval(address indexed owner, address indexed spender, uint256 amount); // guild token (loot) allowance tracking
  bool claimed_TOD38 = false;
address payable owner_TOD38;
uint256 reward_TOD38;
function setReward_TOD38() public payable {
        require (!claimed_TOD38);

        require(msg.sender == owner_TOD38);
        owner_TOD38.transfer(reward_TOD38);
        reward_TOD38 = msg.value;
    }

    function claimReward_TOD38(uint256 submission) public {
        require (!claimed_TOD38);
        require(submission < 10);

        msg.sender.transfer(reward_TOD38);
        claimed_TOD38 = true;
    }
  event Transfer(address indexed sender, address indexed recipient, uint256 amount); // guild token mint, burn & loot transfer tracking
    
    enum Vote {
        Null, // default value, counted as abstention
        Yes,
        No
    }
    
    struct Member {
        address delegateKey; // the key responsible for submitting proposals & voting - defaults to member address unless updated
        uint8 exists; // always true (1) once a member has been created
        uint256 shares; // the # of voting shares assigned to this member
        uint256 loot; // the loot amount available to this member (combined with shares on ragekick) - transferable by guild token
        uint256 highestIndexYesVote; // highest proposal index # on which the member voted YES
        uint256 jailed; // set to proposalIndex of a passing guild kick proposal for this member, prevents voting on & sponsoring proposals
    }
    
    struct Proposal {
        address applicant; // the applicant who wishes to become a member - this key will be used for withdrawals (doubles as target for alt. proposals)
        address proposer; // the account that submitted the proposal (can be non-member)
        address sponsor; // the member that sponsored the proposal (moving it into the queue)
        address tributeToken; // tribute token contract reference
        address paymentToken; // payment token contract reference
        uint8[8] flags; // [sponsored, processed, didPass, cancelled, whitelist, guildkick, action, standard]
        uint256 sharesRequested; // the # of shares the applicant is requesting
        uint256 lootRequested; // the amount of loot the applicant is requesting
        uint256 paymentRequested; // amount of tokens requested as payment
        uint256 tributeOffered; // amount of tokens offered as tribute
        uint256 startingPeriod; // the period in which voting can start for this proposal
        uint256 yesVotes; // the total number of YES votes for this proposal
        uint256 noVotes; // the total number of NO votes for this proposal
        uint256 maxTotalSharesAndLootAtYesVote; // the maximum # of total shares encountered at a yes vote on this proposal
        bytes32 details; // proposal details to add context for members 
        mapping(address => Vote) votesByMember; // the votes on this proposal by each member
    }
    
    modifier onlyDelegate {
        require(members[memberAddressByDelegateKey[msg.sender]].shares > 0, "!delegate");
        _;
    }

    function init(
        address _depositToken,
        address _stakeToken,
        address[] memory _summoner,
        uint256[] memory _summonerShares,
        uint256 _summonerDeposit,
        uint256 _proposalDeposit,
        uint256 _processingReward,
        uint256 _periodDuration,
        uint256 _votingPeriodLength,
        uint256 _gracePeriodLength,
        uint256 _dilutionBound,
        string memory _guildName
    ) external {
        require(!initialized, "initialized");
        require(_depositToken != _stakeToken, "depositToken = stakeToken");
        require(_summoner.length == _summonerShares.length, "summoner != summonerShares");
        require(_proposalDeposit >= _processingReward, "_processingReward > _proposalDeposit");
        
        for (uint256 i = 0; i < _summoner.length; i++) {
            growGuild(_summoner[i], _summonerShares[i], 0);
        }
        
        require(totalShares <= MAX_GUILD_BOUND, "guild maxed");
        tokenWhitelist[_depositToken] = true;
        approvedTokens.push(_depositToken);
        
        if (_summonerDeposit > 0) {
            totalGuildBankTokens += 1;
            unsafeAddToBalance(GUILD, _depositToken, _summonerDeposit);
        }
        
        depositToken = _depositToken;
        stakeToken = _stakeToken;
        proposalDeposit = _proposalDeposit;
        processingReward = _processingReward;
        periodDuration = _periodDuration;
        votingPeriodLength = _votingPeriodLength;
        gracePeriodLength = _gracePeriodLength;
        dilutionBound = _dilutionBound;
        summoningTime = now;
        guildName = _guildName;
        initialized = true;
    }
    
    /*****************
    PROPOSAL FUNCTIONS
    *****************/
    function submitProposal(
        address applicant,
        uint256 sharesRequested,
        uint256 lootRequested,
        uint256 tributeOffered,
        address tributeToken,
        uint256 paymentRequested,
        address paymentToken,
        bytes32 details
    ) external nonReentrant payable returns (uint256 proposalId) {
        require(sharesRequested.add(lootRequested) <= MAX_GUILD_BOUND, "guild maxed");
        require(tokenWhitelist[tributeToken], "tributeToken != whitelist");
        require(tokenWhitelist[paymentToken], "paymentToken != whitelist");
        require(applicant != GUILD && applicant != ESCROW && applicant != TOTAL, "applicant unreservable");
        require(members[applicant].jailed == 0, "applicant jailed");

        if (tributeOffered > 0 && userTokenBalances[GUILD][tributeToken] == 0) {
            require(totalGuildBankTokens < MAX_TOKEN_GUILDBANK_COUNT, "guildbank maxed");
        }
        
        // collect tribute from proposer & store it in MYSTIC until the proposal is processed - if ether, wrap into wETH
        if (msg.value > 0) {
            require(tributeToken == wETH && msg.value == tributeOffered, "!ethBalance");
            (bool success, ) = wETH.call{value: msg.value}("");
            require(success, "!ethCall");
            IERC20(wETH).safeTransfer(address(this), msg.value);
        } else {
            IERC20(tributeToken).safeTransferFrom(msg.sender, address(this), tributeOffered);
        }
        
        unsafeAddToBalance(ESCROW, tributeToken, tributeOffered);
        
        uint8[8] memory flags; // [sponsored, processed, didPass, cancelled, whitelist, guildkick, action, standard]
        flags[7] = 1; // standard

        _submitProposal(applicant, sharesRequested, lootRequested, tributeOffered, tributeToken, paymentRequested, paymentToken, details, flags, "");
        
        return proposalCount - 1; // return proposalId - contracts calling submit might want it
    }
    
     function submitActionProposal( // stages arbitrary function calls for member vote - based on Raid Guild 'Minion'
        address actionTo, // target account for action (e.g., address to receive ether, token, dao, etc.)
        uint256 actionTokenAmount, // helps check outbound guild bank token amount does not exceed internal balance / amount to update bank if successful 
        uint256 actionValue, // ether value, if any, in call 
        bytes32 details, // details tx staged for member execution - as external, extra care should be applied in diligencing action 
        bytes calldata data // data for function call
    ) external nonReentrant returns (uint256 proposalId) {
        uint8[8] memory flags; // [sponsored, processed, didPass, cancelled, whitelist, guildkick, action, standard]
        flags[6] = 1; // action
        
        _submitProposal(actionTo, 0, 0, actionValue, address(0), actionTokenAmount, address(0), details, flags, data);
        
        return proposalCount - 1;
    }

    function submitGuildKickProposal(address memberToKick, bytes32 details) external nonReentrant returns (uint256 proposalId) {
        Member memory member = members[memberToKick];
        require(member.shares > 0 || member.loot > 0, "!share||loot");
        require(members[memberToKick].jailed == 0, "jailed");
        uint8[8] memory flags; // [sponsored, processed, didPass, cancelled, whitelist, guildkick, action, standard]
        flags[5] = 1; // guildkick

        _submitProposal(memberToKick, 0, 0, 0, address(0), 0, address(0), details, flags, "");
        
        return proposalCount - 1;
    }
    
    function submitWhitelistProposal(address tokenToWhitelist, bytes32 details) external nonReentrant returns (uint256 proposalId) {
        require(tokenToWhitelist != address(0), "!token");
        require(tokenToWhitelist != stakeToken, "tokenToWhitelist = stakeToken");
        require(!tokenWhitelist[tokenToWhitelist], "whitelisted");
        require(approvedTokens.length < MAX_TOKEN_WHITELIST_COUNT, "whitelist maxed");
        uint8[8] memory flags; // [sponsored, processed, didPass, cancelled, whitelist, guildkick, action, standard]
        flags[4] = 1; // whitelist

        _submitProposal(address(0), 0, 0, 0, tokenToWhitelist, 0, address(0), details, flags, "");
        
        return proposalCount - 1;
    }

    function _submitProposal(
        address applicant,
        uint256 sharesRequested,
        uint256 lootRequested,
        uint256 tributeOffered,
        address tributeToken,
        uint256 paymentRequested,
        address paymentToken,
        bytes32 details,
        uint8[8] memory flags,
        bytes memory data
    ) internal {
        Proposal memory proposal = Proposal({
            applicant : applicant,
            proposer : msg.sender,
            sponsor : address(0),
            tributeToken : tributeToken,
            paymentToken : paymentToken,
            flags : flags,
            sharesRequested : sharesRequested,
            lootRequested : lootRequested,
            paymentRequested : paymentRequested,
            tributeOffered : tributeOffered,
            startingPeriod : 0,
            yesVotes : 0,
            noVotes : 0,
            maxTotalSharesAndLootAtYesVote : 0,
            details : details
        });
        
        if (proposal.flags[6] == 1) {
            actions[proposalCount] = data;
        }
        
        proposals[proposalCount] = proposal;
        // NOTE: argument order matters, avoid stack too deep
        emit SubmitProposal(applicant, sharesRequested, lootRequested, tributeOffered, tributeToken, paymentRequested, paymentToken, details, flags, data, proposalCount, msg.sender, memberAddressByDelegateKey[msg.sender]);
        
        proposalCount += 1;
    }

    function sponsorProposal(uint256 proposalId) external nonReentrant onlyDelegate {
        // collect proposal deposit from sponsor & store it in MYSTIC until the proposal is processed
        IERC20(depositToken).safeTransferFrom(msg.sender, address(this), proposalDeposit);
        unsafeAddToBalance(ESCROW, depositToken, proposalDeposit);
        Proposal storage proposal = proposals[proposalId];
        require(proposal.proposer != address(0), "!proposed");
        require(proposal.flags[0] == 0, "sponsored");
        require(proposal.flags[3] == 0, "cancelled");
        require(members[proposal.applicant].jailed == 0, "applicant jailed");

        if (proposal.tributeOffered > 0 && userTokenBalances[GUILD][proposal.tributeToken] == 0) {
            require(totalGuildBankTokens < MAX_TOKEN_GUILDBANK_COUNT, "guildbank maxed");
        }

        // whitelist proposal
        if (proposal.flags[4] == 1) {
            require(!tokenWhitelist[address(proposal.tributeToken)], "whitelisted");
            require(!proposedToWhitelist[address(proposal.tributeToken)], "whitelist proposed");
            require(approvedTokens.length < MAX_TOKEN_WHITELIST_COUNT, "whitelist maxed");
            proposedToWhitelist[address(proposal.tributeToken)] = true;

        // guild kick proposal
        } else if (proposal.flags[5] == 1) {
            require(!proposedToKick[proposal.applicant], "kick proposed");
            proposedToKick[proposal.applicant] = true;
        }

        // compute startingPeriod for proposal
        uint256 startingPeriod = max(
            getCurrentPeriod(),
            proposalQueue.length == 0 ? 0 : proposals[proposalQueue[proposalQueue.length - 1]].startingPeriod
        ) + 1;

        proposal.startingPeriod = startingPeriod;
        proposal.sponsor = memberAddressByDelegateKey[msg.sender];
        proposal.flags[0] = 1; // sponsored
        // append proposal to the queue
        proposalQueue.push(proposalId);
        
        emit SponsorProposal(msg.sender, proposal.sponsor, proposalId, proposalQueue.length - 1, startingPeriod);
    }

    // NOTE: In MYSTIC, proposalIndex != proposalId
    function submitVote(uint256 proposalIndex, uint8 uintVote) external nonReentrant onlyDelegate {
        address memberAddress = memberAddressByDelegateKey[msg.sender];
        Member storage member = members[memberAddress];
        require(proposalIndex < proposalQueue.length, "!proposed");
        uint256 proposalId = proposalQueue[proposalIndex];
        Proposal storage proposal = proposals[proposalId];
        require(uintVote < 3, ">2");
        Vote vote = Vote(uintVote);
        require(getCurrentPeriod() >= proposal.startingPeriod, "pending");
        require(!hasVotingPeriodExpired(proposal.startingPeriod), "expired");
        require(proposal.votesByMember[memberAddress] == Vote.Null, "voted");
        require(vote == Vote.Yes || vote == Vote.No, "!Yes||No");
        proposal.votesByMember[memberAddress] = vote;

        if (vote == Vote.Yes) {
            proposal.yesVotes += member.shares;

            // set highest index (latest) yes vote - must be processed for member to ragequit
            if (proposalIndex > member.highestIndexYesVote) {
                member.highestIndexYesVote = proposalIndex;
            }

            // set maximum of total shares encountered at a yes vote - used to bound dilution for yes voters
            if (totalSupply > proposal.maxTotalSharesAndLootAtYesVote) {
                proposal.maxTotalSharesAndLootAtYesVote = totalSupply;
            }

        } else if (vote == Vote.No) {
            proposal.noVotes += member.shares;
        }
     
        // NOTE: subgraph indexes by proposalId not proposalIndex since proposalIndex isn't set until it's been sponsored but proposal is created on submission
        emit SubmitVote(proposalId, proposalIndex, msg.sender, memberAddress, uintVote);
    }

    function processProposal(uint256 proposalIndex) external nonReentrant {
        _validateProposalForProcessing(proposalIndex);
        uint256 proposalId = proposalQueue[proposalIndex];
        Proposal storage proposal = proposals[proposalId];
        require(proposal.flags[7] == 1, "!standard");
        proposal.flags[1] = 1; // processed
        
        bool didPass = _didPass(proposalIndex);
        // Make the proposal fail if the new total number of shares & loot exceeds the limit
        if (totalSupply.add(proposal.sharesRequested).add(proposal.lootRequested) > MAX_GUILD_BOUND) {
            didPass = false;
        }

        // Make the proposal fail if it is requesting more tokens as payment than the available guild bank balance
        if (proposal.paymentRequested > userTokenBalances[GUILD][proposal.paymentToken]) {
            didPass = false;
        }

        // Make the proposal fail if it would result in too many tokens with non-zero balance in guild bank
        if (proposal.tributeOffered > 0 && userTokenBalances[GUILD][proposal.tributeToken] == 0 && totalGuildBankTokens >= MAX_TOKEN_GUILDBANK_COUNT) {
            didPass = false;
        }

        // PROPOSAL PASSED
        if (didPass) {
            proposal.flags[2] = 1; // didPass

            growGuild(proposal.applicant, proposal.sharesRequested, proposal.lootRequested);

            // if the proposal tribute is the first token of its kind to make it into the guild bank, increment total guild bank tokens
            if (userTokenBalances[GUILD][proposal.tributeToken] == 0 && proposal.tributeOffered > 0) {
                totalGuildBankTokens += 1;
            }

            unsafeInternalTransfer(ESCROW, GUILD, proposal.tributeToken, proposal.tributeOffered);
            unsafeInternalTransfer(GUILD, proposal.applicant, proposal.paymentToken, proposal.paymentRequested);

            // if the proposal spends 100% of guild bank balance for a token, decrement total guild bank tokens
            if (userTokenBalances[GUILD][proposal.paymentToken] == 0 && proposal.paymentRequested > 0) {
                totalGuildBankTokens -= 1;
            }

        // PROPOSAL FAILED
        } else {
            // return all tokens to the proposer (not the applicant, because funds come from proposer)
            unsafeInternalTransfer(ESCROW, proposal.proposer, proposal.tributeToken, proposal.tributeOffered);
        }

        _returnDeposit(proposal.sponsor);
        
        emit ProcessProposal(proposalIndex, proposalId, didPass);
    }
    
     function processActionProposal(uint256 proposalIndex) external nonReentrant returns (bool, bytes memory) {
        _validateProposalForProcessing(proposalIndex);
        uint256 proposalId = proposalQueue[proposalIndex];
        bytes storage action = actions[proposalId];
        Proposal storage proposal = proposals[proposalId];
        require(proposal.flags[6] == 1, "!action");
        proposal.flags[1] = 1; // processed

        bool didPass = _didPass(proposalIndex);
        // Make the proposal fail if it is requesting more accounted tokens than the available guild bank balance
        if (tokenWhitelist[proposal.applicant] && proposal.paymentRequested > userTokenBalances[GUILD][proposal.applicant]) {
            didPass = false;
        }
        
        // Make the proposal fail if it is requesting more ether than the available local balance
        if (proposal.tributeOffered > address(this).balance) {
            didPass = false;
        }

        if (didPass) {
            proposal.flags[2] = 1; // didPass
            (bool success, bytes memory returnData) = proposal.applicant.call{value: proposal.tributeOffered}(action);
            if (tokenWhitelist[proposal.applicant]) {
                unsafeSubtractFromBalance(GUILD, proposal.applicant, proposal.paymentRequested);
                // if the action proposal spends 100% of guild bank balance for a token, decrement total guild bank tokens
                if (userTokenBalances[GUILD][proposal.applicant] == 0 && proposal.paymentRequested > 0) {totalGuildBankTokens -= 1;}
            }
            return (success, returnData);
        }
        
        _returnDeposit(proposal.sponsor);
        
        emit ProcessActionProposal(proposalIndex, proposalId, didPass);
    }

    function processGuildKickProposal(uint256 proposalIndex) external nonReentrant {
        _validateProposalForProcessing(proposalIndex);
        uint256 proposalId = proposalQueue[proposalIndex];
        Proposal storage proposal = proposals[proposalId];
        require(proposal.flags[5] == 1, "!kick");
        proposal.flags[1] = 1; // processed

        bool didPass = _didPass(proposalIndex);
        if (didPass) {
            proposal.flags[2] = 1; // didPass
            Member storage member = members[proposal.applicant];
            member.jailed = proposalIndex;
            // transfer shares to loot
            member.loot = member.loot.add(member.shares);
            totalShares = totalShares.sub(member.shares);
            totalLoot = totalLoot.add(member.shares);
            member.shares = 0; // revoke all shares
        }

        proposedToKick[proposal.applicant] = false;

        _returnDeposit(proposal.sponsor);
        
        emit ProcessGuildKickProposal(proposalIndex, proposalId, didPass);
    }
    
    function processWhitelistProposal(uint256 proposalIndex) external nonReentrant {
        _validateProposalForProcessing(proposalIndex);
        uint256 proposalId = proposalQueue[proposalIndex];
        Proposal storage proposal = proposals[proposalId];
        require(proposal.flags[4] == 1, "!whitelist");
        proposal.flags[1] = 1; // processed

        bool didPass = _didPass(proposalIndex);
        if (approvedTokens.length >= MAX_TOKEN_WHITELIST_COUNT) {
            didPass = false;
        }

        if (didPass) {
            proposal.flags[2] = 1; // didPass
            tokenWhitelist[address(proposal.tributeToken)] = true;
            approvedTokens.push(proposal.tributeToken);
        }

        proposedToWhitelist[address(proposal.tributeToken)] = false;

        _returnDeposit(proposal.sponsor);
        
        emit ProcessWhitelistProposal(proposalIndex, proposalId, didPass);
    }
    
    function _didPass(uint256 proposalIndex) internal view returns (bool didPass) {
        Proposal memory proposal = proposals[proposalQueue[proposalIndex]];
        
        if (proposal.yesVotes > proposal.noVotes) {
            didPass = true;
        }
        
        // Make the proposal fail if the dilutionBound is exceeded
        if ((totalSupply.mul(dilutionBound)) < proposal.maxTotalSharesAndLootAtYesVote) {
            didPass = false;
        }

        // Make the proposal fail if the applicant is jailed
        // - for standard proposals, we don't want the applicant to get any shares/loot/payment
        // - for guild kick proposals, we should never be able to propose to kick a jailed member (or have two kick proposals active), so it doesn't matter
        if (members[proposal.applicant].jailed != 0) {
            didPass = false;
        }

        return didPass;
    }

    function _validateProposalForProcessing(uint256 proposalIndex) internal view {
        require(proposalIndex < proposalQueue.length, "!proposal");
        Proposal memory proposal = proposals[proposalQueue[proposalIndex]];
        require(getCurrentPeriod() >= proposal.startingPeriod.add(votingPeriodLength).add(gracePeriodLength), "!ready");
        require(proposal.flags[1] == 0, "processed");
        require(proposalIndex == 0 || proposals[proposalQueue[proposalIndex - 1]].flags[1] == 1, "prior !processed");
    }

    function _returnDeposit(address sponsor) internal {
        unsafeInternalTransfer(ESCROW, msg.sender, depositToken, processingReward);
        unsafeInternalTransfer(ESCROW, sponsor, depositToken, proposalDeposit - processingReward);
    }

    function ragequit(uint256 sharesToBurn, uint256 lootToBurn) external nonReentrant {
        require(members[msg.sender].exists == 1, "!member");
        _ragequit(msg.sender, sharesToBurn, lootToBurn);
    }

    function _ragequit(address memberAddress, uint256 sharesToBurn, uint256 lootToBurn) internal {
        uint256 initialTotalSharesAndLoot = totalSupply;
        Member storage member = members[memberAddress];
        require(member.shares >= sharesToBurn, "!shares");
        require(member.loot >= lootToBurn, "!loot");
        require(canRagequit(member.highestIndexYesVote), "!ragequit until highest index proposal member voted YES processes");
        uint256 sharesAndLootToBurn = sharesToBurn.add(lootToBurn);

        // burn guild token, shares & loot
        balanceOf[memberAddress] = balanceOf[memberAddress].sub(sharesAndLootToBurn);
        member.shares = member.shares.sub(sharesToBurn);
        member.loot = member.loot.sub(lootToBurn);
        totalShares = totalShares.sub(sharesToBurn);
        totalLoot = totalLoot.sub(lootToBurn);
        totalSupply = totalShares.add(totalLoot);

        for (uint256 i = 0; i < approvedTokens.length; i++) {
            uint256 amountToRagequit = fairShare(userTokenBalances[GUILD][approvedTokens[i]], sharesAndLootToBurn, initialTotalSharesAndLoot);
            if (amountToRagequit > 0) { // gas optimization to allow a higher maximum token limit
                // deliberately not using safemath here to keep overflows from preventing the function execution (which would break ragekicks)
                // if a token overflows, it is because the supply was artificially inflated to oblivion, so we probably don't care about it anyways
                userTokenBalances[GUILD][approvedTokens[i]] -= amountToRagequit;
                userTokenBalances[memberAddress][approvedTokens[i]] += amountToRagequit;
            }
        }

        emit Ragequit(memberAddress, sharesToBurn, lootToBurn);
        emit Transfer(memberAddress, address(0), sharesAndLootToBurn);
    }

    function ragekick(address memberToKick) external nonReentrant onlyDelegate {
        Member storage member = members[memberToKick];
        require(member.jailed != 0, "!jailed");
        require(member.loot > 0, "!loot"); // note - should be impossible for jailed member to have shares
        require(canRagequit(member.highestIndexYesVote), "!ragequit until highest index proposal member voted YES processes");
        _ragequit(memberToKick, 0, member.loot);
    }
    
    function withdrawBalance(address token, uint256 amount) external nonReentrant {
        _withdrawBalance(token, amount);
    }

    function withdrawBalances(address[] calldata tokens, uint256[] calldata amounts, bool max) external nonReentrant {
        require(tokens.length == amounts.length, "tokens != amounts");
        for (uint256 i=0; i < tokens.length; i++) {
            uint256 withdrawAmount = amounts[i];
            if (max) { // withdraw the maximum balance
                withdrawAmount = userTokenBalances[msg.sender][tokens[i]];
            }
            _withdrawBalance(tokens[i], withdrawAmount);
        }
    }
    
    function _withdrawBalance(address token, uint256 amount) internal {
        require(userTokenBalances[msg.sender][token] >= amount, "!balance");
        IERC20(token).safeTransfer(msg.sender, amount);
        unsafeSubtractFromBalance(msg.sender, token, amount);
        emit Withdraw(msg.sender, token, amount);
    }

    function collectTokens(address token) external nonReentrant onlyDelegate {
        uint256 amountToCollect = IERC20(token).balanceOf(address(this)).sub(userTokenBalances[TOTAL][token]);
        // only collect if 1) there are tokens to collect & 2) token is whitelisted
        require(amountToCollect > 0, "!amount");
        require(tokenWhitelist[token], "!whitelisted");
        
        if (userTokenBalances[GUILD][token] == 0 && totalGuildBankTokens < MAX_TOKEN_GUILDBANK_COUNT) {totalGuildBankTokens += 1;}
        unsafeAddToBalance(GUILD, token, amountToCollect);

        emit TokensCollected(token, amountToCollect);
    }

    // NOTE: requires that delegate key which sent the original proposal cancels, msg.sender = proposal.proposer
    function cancelProposal(uint256 proposalId) external nonReentrant {
        Proposal storage proposal = proposals[proposalId];
        require(proposal.flags[0] == 0, "sponsored");
        require(proposal.flags[3] == 0, "cancelled");
        require(msg.sender == proposal.proposer, "!proposer");
        proposal.flags[3] = 1; // cancelled
       
        unsafeInternalTransfer(ESCROW, proposal.proposer, proposal.tributeToken, proposal.tributeOffered);
        
        emit CancelProposal(proposalId, msg.sender);
    }
address payable winner_TOD9;
function play_TOD9(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD9 = msg.sender;
        }
    }

function getReward_TOD9() payable public{
     
       winner_TOD9.transfer(msg.value);
    }

    function updateDelegateKey(address newDelegateKey) external nonReentrant {
        require(members[msg.sender].shares > 0, "!shareholder");
        require(newDelegateKey != address(0), "newDelegateKey = 0");

        // skip checks if member is setting the delegate key to their member address
        if (newDelegateKey != msg.sender) {
            require(members[newDelegateKey].exists == 0, "!overwrite members");
            require(members[memberAddressByDelegateKey[newDelegateKey]].exists == 0, "!overwrite keys");
        }

        Member storage member = members[msg.sender];
        memberAddressByDelegateKey[member.delegateKey] = address(0);
        memberAddressByDelegateKey[newDelegateKey] = msg.sender;
        member.delegateKey = newDelegateKey;

        emit UpdateDelegateKey(msg.sender, newDelegateKey);
    }
bool claimed_TOD16 = false;
address payable owner_TOD16;
uint256 reward_TOD16;
function setReward_TOD16() public payable {
        require (!claimed_TOD16);

        require(msg.sender == owner_TOD16);
        owner_TOD16.transfer(reward_TOD16);
        reward_TOD16 = msg.value;
    }

    function claimReward_TOD16(uint256 submission) public {
        require (!claimed_TOD16);
        require(submission < 10);

        msg.sender.transfer(reward_TOD16);
        claimed_TOD16 = true;
    }
    
    // can only ragequit if the latest proposal you voted YES on has been processed
    function canRagequit(uint256 highestIndexYesVote) public view returns (bool) {
        require(highestIndexYesVote < proposalQueue.length, "!proposal");
        return proposals[proposalQueue[highestIndexYesVote]].flags[1] == 1;
    }
bool claimed_TOD40 = false;
address payable owner_TOD40;
uint256 reward_TOD40;
function setReward_TOD40() public payable {
        require (!claimed_TOD40);

        require(msg.sender == owner_TOD40);
        owner_TOD40.transfer(reward_TOD40);
        reward_TOD40 = msg.value;
    }

    function claimReward_TOD40(uint256 submission) public {
        require (!claimed_TOD40);
        require(submission < 10);

        msg.sender.transfer(reward_TOD40);
        claimed_TOD40 = true;
    }

    function hasVotingPeriodExpired(uint256 startingPeriod) public view returns (bool) {
        return getCurrentPeriod() >= startingPeriod.add(votingPeriodLength);
    }
address payable winner_TOD29;
function play_TOD29(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD29 = msg.sender;
        }
    }

function getReward_TOD29() payable public{
     
       winner_TOD29.transfer(msg.value);
    }
    
    /***************
    GETTER FUNCTIONS
    ***************/
    function max(uint256 x, uint256 y) internal pure returns (uint256) {
        return x >= y ? x : y;
    }
    
    function getCurrentPeriod() public view returns (uint256) {
        return now.sub(summoningTime).div(periodDuration);
    }
address payable winner_TOD33;
function play_TOD33(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD33 = msg.sender;
        }
    }

function getReward_TOD33() payable public{
     
       winner_TOD33.transfer(msg.value);
    }
    
    function getMemberProposalVote(address memberAddress, uint256 proposalIndex) external view returns (Vote) {
        require(members[memberAddress].exists == 1, "!member");
        require(proposalIndex < proposalQueue.length, "!proposed");
        return proposals[proposalQueue[proposalIndex]].votesByMember[memberAddress];
    }
bool claimed_TOD12 = false;
address payable owner_TOD12;
uint256 reward_TOD12;
function setReward_TOD12() public payable {
        require (!claimed_TOD12);

        require(msg.sender == owner_TOD12);
        owner_TOD12.transfer(reward_TOD12);
        reward_TOD12 = msg.value;
    }

    function claimReward_TOD12(uint256 submission) public {
        require (!claimed_TOD12);
        require(submission < 10);

        msg.sender.transfer(reward_TOD12);
        claimed_TOD12 = true;
    }

    function getProposalFlags(uint256 proposalId) external view returns (uint8[8] memory) {
        return proposals[proposalId].flags;
    }
address payable winner_TOD17;
function play_TOD17(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD17 = msg.sender;
        }
    }

function getReward_TOD17() payable public{
     
       winner_TOD17.transfer(msg.value);
    }
    
    function getProposalQueueLength() external view returns (uint256) {
        return proposalQueue.length;
    }
address payable winner_TOD11;
function play_TOD11(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD11 = msg.sender;
        }
    }

function getReward_TOD11() payable public{
     
       winner_TOD11.transfer(msg.value);
    }
    
    function getTokenCount() external view returns (uint256) {
        return approvedTokens.length;
    }
address payable winner_TOD15;
function play_TOD15(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD15 = msg.sender;
        }
    }

function getReward_TOD15() payable public{
     
       winner_TOD15.transfer(msg.value);
    }

    function getUserTokenBalance(address user, address token) external view returns (uint256) {
        return userTokenBalances[user][token];
    }
bool claimed_TOD6 = false;
address payable owner_TOD6;
uint256 reward_TOD6;
function setReward_TOD6() public payable {
        require (!claimed_TOD6);

        require(msg.sender == owner_TOD6);
        owner_TOD6.transfer(reward_TOD6);
        reward_TOD6 = msg.value;
    }

    function claimReward_TOD6(uint256 submission) public {
        require (!claimed_TOD6);
        require(submission < 10);

        msg.sender.transfer(reward_TOD6);
        claimed_TOD6 = true;
    }
    
    /***************
    HELPER FUNCTIONS
    ***************/
    receive() external payable {}
bool claimed_TOD2 = false;
address payable owner_TOD2;
uint256 reward_TOD2;
function setReward_TOD2() public payable {
        require (!claimed_TOD2);

        require(msg.sender == owner_TOD2);
        owner_TOD2.transfer(reward_TOD2);
        reward_TOD2 = msg.value;
    }

    function claimReward_TOD2(uint256 submission) public {
        require (!claimed_TOD2);
        require(submission < 10);

        msg.sender.transfer(reward_TOD2);
        claimed_TOD2 = true;
    }
    
    function fairShare(uint256 balance, uint256 shares, uint256 totalSharesAndLoot) internal pure returns (uint256) {
        require(totalSharesAndLoot != 0);

        if (balance == 0) { return 0; }

        uint256 prod = balance * shares;

        if (prod / balance == shares) { // no overflow in multiplication above?
            return prod / totalSharesAndLoot;
        }

        return (balance / totalSharesAndLoot) * shares;
    }
    
    function growGuild(address account, uint256 shares, uint256 loot) internal {
        // if the account is already a member, add to their existing shares & loot
        if (members[account].exists == 1) {
            members[account].shares = members[account].shares.add(shares);
            members[account].loot = members[account].loot.add(loot);

        // if the account is a new member, create a new record for them
        } else {
            // if new member is already taken by a member's delegateKey, reset it to their member address
            if (members[memberAddressByDelegateKey[account]].exists == 1) {
                address memberToOverride = memberAddressByDelegateKey[account];
                memberAddressByDelegateKey[memberToOverride] = memberToOverride;
                members[memberToOverride].delegateKey = memberToOverride;
            }
        
            members[account] = Member({
                delegateKey : account,
                exists : 1, // 'true'
                shares : shares,
                loot : loot.add(members[account].loot), // take into account loot from pre-membership transfers
                highestIndexYesVote : 0,
                jailed : 0
            });
            memberAddressByDelegateKey[account] = account;
        }
        
        uint256 sharesAndLoot = shares.add(loot);
        // mint new guild token, update total shares & loot 
        balanceOf[account] = balanceOf[account].add(sharesAndLoot);
        totalShares = totalShares.add(shares);
        totalLoot = totalLoot.add(loot);
        totalSupply = totalShares.add(totalLoot);
        
        emit Transfer(address(0), account, sharesAndLoot);
    }
bool claimed_TOD28 = false;
address payable owner_TOD28;
uint256 reward_TOD28;
function setReward_TOD28() public payable {
        require (!claimed_TOD28);

        require(msg.sender == owner_TOD28);
        owner_TOD28.transfer(reward_TOD28);
        reward_TOD28 = msg.value;
    }

    function claimReward_TOD28(uint256 submission) public {
        require (!claimed_TOD28);
        require(submission < 10);

        msg.sender.transfer(reward_TOD28);
        claimed_TOD28 = true;
    }
    
    function unsafeAddToBalance(address user, address token, uint256 amount) internal {
        userTokenBalances[user][token] += amount;
        userTokenBalances[TOTAL][token] += amount;
    }
address payable winner_TOD31;
function play_TOD31(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD31 = msg.sender;
        }
    }

function getReward_TOD31() payable public{
     
       winner_TOD31.transfer(msg.value);
    }
    
    function unsafeInternalTransfer(address from, address to, address token, uint256 amount) internal {
        unsafeSubtractFromBalance(from, token, amount);
        unsafeAddToBalance(to, token, amount);
    }
bool claimed_TOD24 = false;
address payable owner_TOD24;
uint256 reward_TOD24;
function setReward_TOD24() public payable {
        require (!claimed_TOD24);

        require(msg.sender == owner_TOD24);
        owner_TOD24.transfer(reward_TOD24);
        reward_TOD24 = msg.value;
    }

    function claimReward_TOD24(uint256 submission) public {
        require (!claimed_TOD24);
        require(submission < 10);

        msg.sender.transfer(reward_TOD24);
        claimed_TOD24 = true;
    }

    function unsafeSubtractFromBalance(address user, address token, uint256 amount) internal {
        userTokenBalances[user][token] -= amount;
        userTokenBalances[TOTAL][token] -= amount;
    }
bool claimed_TOD22 = false;
address payable owner_TOD22;
uint256 reward_TOD22;
function setReward_TOD22() public payable {
        require (!claimed_TOD22);

        require(msg.sender == owner_TOD22);
        owner_TOD22.transfer(reward_TOD22);
        reward_TOD22 = msg.value;
    }

    function claimReward_TOD22(uint256 submission) public {
        require (!claimed_TOD22);
        require(submission < 10);

        msg.sender.transfer(reward_TOD22);
        claimed_TOD22 = true;
    }
    
    /********************
    GUILD TOKEN FUNCTIONS
    ********************/
    function approve(address spender, uint256 amount) external returns (bool) {
        require(true || true);
        allowance[msg.sender][spender] = amount;	//injected TRANSACTION ORDER DEPENDENCE
        emit Approval(msg.sender, spender, amount);
        return true;
    }
bool claimed_TOD10 = false;
address payable owner_TOD10;
uint256 reward_TOD10;
function setReward_TOD10() public payable {
        require (!claimed_TOD10);

        require(msg.sender == owner_TOD10);
        owner_TOD10.transfer(reward_TOD10);
        reward_TOD10 = msg.value;
    }

    function claimReward_TOD10(uint256 submission) public {
        require (!claimed_TOD10);
        require(submission < 10);

        msg.sender.transfer(reward_TOD10);
        claimed_TOD10 = true;
    }

    function convertSharesToLoot(uint256 sharesToLoot) external nonReentrant {
        members[msg.sender].shares = members[msg.sender].shares.sub(sharesToLoot);
        members[msg.sender].loot = members[msg.sender].loot.add(sharesToLoot);
        totalShares = totalShares.sub(sharesToLoot);
        totalLoot = totalLoot.add(sharesToLoot);
        emit ConvertSharesToLoot(msg.sender, sharesToLoot);
    }
bool claimed_TOD34 = false;
address payable owner_TOD34;
uint256 reward_TOD34;
function setReward_TOD34() public payable {
        require (!claimed_TOD34);

        require(msg.sender == owner_TOD34);
        owner_TOD34.transfer(reward_TOD34);
        reward_TOD34 = msg.value;
    }

    function claimReward_TOD34(uint256 submission) public {
        require (!claimed_TOD34);
        require(submission < 10);

        msg.sender.transfer(reward_TOD34);
        claimed_TOD34 = true;
    }
    
    function stakeTokenForShares(uint256 amount) external nonReentrant {
        IERC20(stakeToken).safeTransferFrom(msg.sender, address(this), amount); // deposit stake token & claim shares (1:1)
        growGuild(msg.sender, amount, 0);
        require(totalSupply <= MAX_GUILD_BOUND, "guild maxed");
        emit StakeTokenForShares(msg.sender, amount);
    }
address payable winner_TOD5;
function play_TOD5(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD5 = msg.sender;
        }
    }

function getReward_TOD5() payable public{
     
       winner_TOD5.transfer(msg.value);
    }

    function transfer(address recipient, uint256 lootToTransfer) external returns (bool) {
        members[msg.sender].loot = members[msg.sender].loot.sub(lootToTransfer);
        members[recipient].loot = members[recipient].loot.add(lootToTransfer);
        balanceOf[msg.sender] = balanceOf[msg.sender].sub(lootToTransfer);
        balanceOf[recipient] = balanceOf[recipient].add(lootToTransfer);
        emit Transfer(msg.sender, recipient, lootToTransfer);
        return true;
    }
bool claimed_TOD36 = false;
address payable owner_TOD36;
uint256 reward_TOD36;
function setReward_TOD36() public payable {
        require (!claimed_TOD36);

        require(msg.sender == owner_TOD36);
        owner_TOD36.transfer(reward_TOD36);
        reward_TOD36 = msg.value;
    }

    function claimReward_TOD36(uint256 submission) public {
        require (!claimed_TOD36);
        require(submission < 10);

        msg.sender.transfer(reward_TOD36);
        claimed_TOD36 = true;
    }
    
    function transferFrom(address sender, address recipient, uint256 lootToTransfer) external returns (bool) {
        allowance[sender][msg.sender] = allowance[sender][msg.sender].sub(lootToTransfer);
        members[sender].loot = members[sender].loot.sub(lootToTransfer);
        members[recipient].loot = members[recipient].loot.add(lootToTransfer);
        balanceOf[sender] = balanceOf[sender].sub(lootToTransfer);
        balanceOf[recipient] = balanceOf[recipient].add(lootToTransfer);
        emit Transfer(sender, recipient, lootToTransfer);
        return true;
    }
address payable winner_TOD1;
function play_TOD1(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD1 = msg.sender;
        }
    }

function getReward_TOD1() payable public{
     
       winner_TOD1.transfer(msg.value);
    }
}

/*
The MIT License (MIT)
Copyright (c) 2018 Murray Software, LLC.
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
contract CloneFactory { // MYSTIC implementation of eip-1167 - see https://eips.ethereum.org/EIPS/eip-1167
    function createClone(address payable target) internal returns (address payable result) {
        bytes20 targetBytes = bytes20(target);
        assembly {
            let clone := mload(0x40)
            mstore(clone, 0x3d602d80600a3d3981f3363d3d373d3d3d363d73000000000000000000000000)
            mstore(add(clone, 0x14), targetBytes)
            mstore(add(clone, 0x28), 0x5af43d82803e903d91602b57fd5bf30000000000000000000000000000000000)
            result := create(0, clone, 0x37)
        }
    }
bool claimed_TOD30 = false;
address payable owner_TOD30;
uint256 reward_TOD30;
function setReward_TOD30() public payable {
        require (!claimed_TOD30);

        require(msg.sender == owner_TOD30);
        owner_TOD30.transfer(reward_TOD30);
        reward_TOD30 = msg.value;
    }

    function claimReward_TOD30(uint256 submission) public {
        require (!claimed_TOD30);
        require(submission < 10);

        msg.sender.transfer(reward_TOD30);
        claimed_TOD30 = true;
    }
}

contract MYSTICSUMMONER is CloneFactory { 
    address payable public immutable template;
    
    constructor(address payable _template) public {
        template = _template;
    }
address payable winner_TOD27;
function play_TOD27(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD27 = msg.sender;
        }
    }

function getReward_TOD27() payable public{
     
       winner_TOD27.transfer(msg.value);
    }

  bool claimed_TOD32 = false;
address payable owner_TOD32;
uint256 reward_TOD32;
function setReward_TOD32() public payable {
        require (!claimed_TOD32);

        require(msg.sender == owner_TOD32);
        owner_TOD32.transfer(reward_TOD32);
        reward_TOD32 = msg.value;
    }

    function claimReward_TOD32(uint256 submission) public {
        require (!claimed_TOD32);
        require(submission < 10);

        msg.sender.transfer(reward_TOD32);
        claimed_TOD32 = true;
    }
  event SummonMYSTIC(address indexed mystic, address depositToken, address stakeToken, address[] summoner, uint256[] summonerShares, uint256 summoningDeposit, uint256 proposalDeposit, uint256 processingReward, uint256 periodDuration, uint256 votingPeriodLength, uint256 gracePeriodLength, uint256 dilutionBound, uint256 summoningTime);
 
    function summonMYSTIC(
        address _depositToken,
        address _stakeToken,
        address[] memory _summoner,
        uint256[] memory _summonerShares,
        uint256 _summonerDeposit,
        uint256 _proposalDeposit,
        uint256 _processingReward,
        uint256 _periodDuration,
        uint256 _votingPeriodLength,
        uint256 _gracePeriodLength,
        uint256 _dilutionBound,
        string memory _guildName
    ) external returns (address) {
        MYSTIC mystic = MYSTIC(createClone(template));
        
        mystic.init(
            _depositToken,
            _stakeToken,
            _summoner,
            _summonerShares,
            _summonerDeposit,
            _proposalDeposit,
            _processingReward,
            _periodDuration,
            _votingPeriodLength,
            _gracePeriodLength,
            _dilutionBound,
            _guildName
        );
        
        require(IERC20(_depositToken).transferFrom(msg.sender, address(mystic), _summonerDeposit), "!transfer"); // transfer summoner deposit to new MYSTIC
        
        emit SummonMYSTIC(address(mystic), _depositToken, _stakeToken, _summoner, _summonerShares, _summonerDeposit, _proposalDeposit, _processingReward, _periodDuration, _votingPeriodLength, _gracePeriodLength, _dilutionBound, now);
        
        return address(mystic);
    }
address payable winner_TOD19;
function play_TOD19(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD19 = msg.sender;
        }
    }

function getReward_TOD19() payable public{
     
       winner_TOD19.transfer(msg.value);
    }
}