pragma solidity ^0.5.1;

contract VotingChallenge {
    struct Team {
        uint fullVotes;
        uint weightedVotes;
    }

    struct Voter {
        uint[2] fullVotes;
        uint[2] weightedVotes;
        address payable[2] referrers;
    }

    VotingChallengeForwarder forwarder;

    uint public challengeDuration;
    uint public challengeStarted;
    address payable public creator;
    uint16 public creatorFee = 17;       // measured in in tenths of a percent
    address payable public cryptoVersusWallet = 0xa0bedE75cfeEF0266f8A31b47074F5f9fBE1df80;
  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  uint16 public cryptoVersusFee = 53;  // measured in in tenths of a percent
  function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
  uint public cryptoVersusPrize;
  function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
  uint public challengePrize;
  function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
  uint public winner;
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  bool public isVotingPeriod = false;
  function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  bool public beforeVoting = true;
  function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
  Team[2] public teams;
  function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}
  mapping( address => Voter ) private voters;

    modifier inVotingPeriod() {
        require(isVotingPeriod);
        _;
    }

    modifier afterVotingPeriod() {
        require(!isVotingPeriod);
        _;
    }

    modifier onlyCreator() {
        require(msg.sender == creator);
        _;
    }

  function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
  event ChallengeBegins(address _creator, uint _challengeDuration);
  function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
  event NewVotesFor(address _participant, uint _candidate, uint _votes, uint _coefficient);
  function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
  event TransferVotes(address _from, address _to, uint _candidateIndex, uint _votes);
  function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
  event EndOfChallenge(uint _winner, uint _winnerVotes, uint _challengePrize);
  function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
  event RewardWasPaid(address _participant, uint _amount);
  function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
  event ReferrerRewardWasPaid(address _via, address _to, uint amount);
  function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  event CreatorRewardWasPaid(address _creator, uint _amount);
  function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  event CryptoVersusRewardWasPaid(address _cryptoVersusWallet, uint _amount);

    constructor(uint _challengeDuration, address _forwarder) public {
        forwarder = VotingChallengeForwarder(_forwarder);
        challengeDuration = _challengeDuration;
        creator = msg.sender;
    }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}

    function getAllVotes() public view returns (uint[2] memory) {
        return [ teams[0].fullVotes, teams[1].fullVotes ];
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}

    function currentCoefficient() public view returns (uint) {  // in 1/1000000
        return 1000000 - 900000 * (now - challengeStarted) / challengeDuration;
    }
function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}

    function timeOver() public view returns (bool) {
        return challengeStarted + challengeDuration <= now;
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}

    function startChallenge() public onlyCreator {
        require(beforeVoting);
        isVotingPeriod = true;
        beforeVoting = false;
        challengeStarted = now;

        emit ChallengeBegins(creator, challengeDuration);
    }
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}

    function voteForCandidate(uint candidate) public payable inVotingPeriod {
        require(0 <= candidate && candidate < 2);
        require(msg.value > 0);
        require(!timeOver());

        uint coefficient = currentCoefficient();
        uint weightedVotes = msg.value * coefficient / 1000000;
        teams[candidate].fullVotes += msg.value;
        teams[candidate].weightedVotes += weightedVotes;
        voters[msg.sender].fullVotes[candidate] += msg.value;
        voters[msg.sender].weightedVotes[candidate] += weightedVotes;

        emit NewVotesFor(msg.sender, candidate, msg.value, coefficient);
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}

    function voteForCandidate(uint candidate, address payable referrer1) public payable inVotingPeriod {
        voters[msg.sender].referrers[0] = referrer1;
        voteForCandidate(candidate);
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

    function voteForCandidate(uint candidate, address payable referrer1, address payable referrer2) public payable inVotingPeriod {
        voters[msg.sender].referrers[1] = referrer2;
        voteForCandidate(candidate, referrer1);
    }
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}

    function checkEndOfChallenge() public inVotingPeriod returns (bool) {
        if (!timeOver())
            return false;

        if (teams[0].fullVotes > teams[1].fullVotes)
            winner = 0;
        else
            winner = 1;

        uint loser = 1 - winner;
        creator.transfer((teams[loser].fullVotes * creatorFee) / 1000);
        cryptoVersusPrize = (teams[loser].fullVotes * cryptoVersusFee) / 1000;
        challengePrize = teams[loser].fullVotes * (1000 - creatorFee - cryptoVersusFee) / 1000;
        isVotingPeriod = false;

        emit EndOfChallenge(winner, teams[winner].fullVotes, challengePrize);
        return true;
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

    function sendReward(address payable to) public afterVotingPeriod {
        uint winnerVotes = voters[to].weightedVotes[winner];
        uint loserVotes = voters[to].fullVotes[1-winner];
        address payable referrer1 = voters[to].referrers[0];
        address payable referrer2 = voters[to].referrers[1];
        uint sum;

        if (winnerVotes > 0) {
            uint reward = challengePrize * winnerVotes / teams[winner].weightedVotes;
            to.transfer(reward + voters[to].fullVotes[winner]);
            if (referrer1 != address(0)) {
                sum = reward / 100 * 2;  // 2%
                forwarder.forward.value(sum)(referrer1, to);
                cryptoVersusPrize -= sum;
                emit ReferrerRewardWasPaid(to, referrer1, sum);
            }
            if (referrer2 != address(0)) {
                sum = reward / 1000 * 2;  // 0.2%
                forwarder.forward.value(sum)(referrer2, to);
                cryptoVersusPrize -= sum;
                emit ReferrerRewardWasPaid(to, referrer2, sum);
            }
            voters[to].fullVotes[winner] = 0;
            voters[to].weightedVotes[winner] = 0;
            emit RewardWasPaid(to, reward);
        }
        if (loserVotes > 0) {
            if (referrer1 != address(0)) {
                sum = loserVotes / 100 * 1;  // 1%
                forwarder.forward.value(sum)(referrer1, to);
                cryptoVersusPrize -= sum;
                emit ReferrerRewardWasPaid(to, referrer1, sum);
            }
            if (referrer2 != address(0)) {
                sum = loserVotes / 1000 * 1;  // 0.1%
                forwarder.forward.value(sum)(referrer2, to);
                cryptoVersusPrize -= sum;
                emit ReferrerRewardWasPaid(to, referrer2, sum);
            }
            voters[to].fullVotes[1-winner] = 0;
            voters[to].weightedVotes[1-winner] = 0;
        }
    }
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}

    function sendCryptoVersusReward() public afterVotingPeriod {
        if (cryptoVersusPrize > 0) {
            uint cryptoVersusReward = cryptoVersusPrize;
            cryptoVersusPrize = 0;
            cryptoVersusWallet.transfer(cryptoVersusReward);

            emit CryptoVersusRewardWasPaid(cryptoVersusWallet, cryptoVersusReward);
        }
    }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}
}

contract VotingChallengeForwarder {
  function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
  mapping ( address => address[] ) public sendersHash;
  function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
  mapping ( address => uint[] ) public sumsHash;

    function forward(address payable to, address sender) public payable {
        to.transfer(msg.value);
        sendersHash[to].push(sender);
        sumsHash[to].push(msg.value);
    }
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}

    function getSendersHash(address user) public view returns (address[] memory) {
        return sendersHash[user];
    }
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}

    function getSumsHash(address user) public view returns (uint[] memory) {
        return sumsHash[user];
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
}