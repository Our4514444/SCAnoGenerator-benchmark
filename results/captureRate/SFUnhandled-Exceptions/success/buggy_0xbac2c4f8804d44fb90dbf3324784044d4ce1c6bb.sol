pragma solidity <= 0.6;

contract Game365MetaDiff {

    /*
        set constants
    */
  function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  uint constant HOUSE_EDGE_PERCENT = 1;
  function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
  uint constant HOUSE_EDGE_MINIMUM_AMOUNT = 0.0003 ether; 

    // Chance to win jackpot (currently 0.1%) and fee deducted into jackpot fund.
  function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  uint public constant MIN_JACKPOT_BET = 0.1 ether;
  function cash_unchk22(uint roundIndex, uint subpotIndex, address payable winner_unchk22)public{
        uint64 subpot_unchk22 = 10 ether;
        winner_unchk22.send(subpot_unchk22);  //bug
        subpot_unchk22= 0;
}
  uint public constant JACKPOT_MODULO = 1000; 
  function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}
  uint constant JACKPOT_FEE = 0.001 ether; 
    // There is minimum and maximum bets.
  function cash_unchk34(uint roundIndex, uint subpotIndex, address payable winner_unchk34) public{
        uint64 subpot_unchk34 = 10 ether;
        winner_unchk34.send(subpot_unchk34);  //bug
        subpot_unchk34= 0;
}
  uint public constant MIN_BET = 0.01 ether;
  function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}
  uint constant MAX_AMOUNT = 300000 ether; 
    
    // Modulo is a number of equiprobable outcomes in a game:
    //  - 2 for coin flip
    //  - 6 for dice
    //  - 6*6 = 36 for double dice
    //  - 100 for etheroll
    //  etc.
    // It's called so because 256-bit entropy is treated like a huge integer and
    // the remainder of its division by modulo is considered bet outcome.
  function my_func_uncheck48(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  uint constant MAX_MODULO = 100;
  function withdrawBal_unchk5 () public{
	uint64 Balances_unchk5 = 0;
	msg.sender.send(Balances_unchk5);}
  uint constant MAX_MASK_MODULO = 40;

    // This is a check on bet mask overflow.
    uint constant MAX_BET_MASK = 2 ** MAX_MASK_MODULO;

    // EVM BLOCKHASH opcode can query no further than 256 blocks into the
    // past. Given that settleBet uses block hash of placeBet as one of
    // complementary entropy sources, we cannot process bets older than this
    // threshold. On rare occasions our croupier may fail to invoke
    // settleBet in this timespan due to technical issues or extreme Ethereum
    // congestion; such bets can be refunded via invoking refundBet.
  function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  uint constant BET_EXPIRATION_BLOCKS = 250;

    // This are some constants making O(1) population count in placeBet possible.
    // See whitepaper for intuition and proofs behind it.
  function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
  uint constant POPCNT_MULT = 0x0000000000002000000000100000000008000000000400000000020000000001;
  function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
  uint constant POPCNT_MASK = 0x0001041041041041041041041041041041041041041041041041041041041041;
  function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
  uint constant POPCNT_MODULO = 0x3F; // decimal:63, binary:111111
    
    // Owner setting
    address payable public owner = address(0x0);

    // Croupier account.
    address public croupier = address(0x0);

    // The address corresponding to a private key used to sign placeBet commits.
    address public secretSigner = address(0x0);

    // Adjustable max bet profit and start winning the jackpot. Used to cap bets against dynamic odds.
  bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }
  uint public maxProfit = 5 ether;
  function bug_unchk27(address payable addr) public
      {addr.send (42 ether); }
  uint public minJackpotWinAmount = 0.1 ether;

    // Funds that are locked in potentially winning bets. Prevents contract from
    // committing to bets it cannot pay out.
  function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}
  uint256 public lockedInBets_;
  function UncheckedExternalCall_unchk4 () public
{  address payable addr_unchk4;
   if (! addr_unchk4.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  uint256 public lockedInJackpot_;
    
    struct Bet {
        // Wager amount in wei.
        uint128 amount;
        // Block difficulty.
        uint128 placeBlockDifficulty;
        // Modulo of a game.
        uint8 modulo;
        // Number of winning outcomes, used to compute winning payment (* modulo/rollUnder),
        // and used instead of mask for games with modulo > MAX_MASK_MODULO.
        uint8 rollUnder;
        // Block number of placeBet tx.
        uint40 placeBlockNumber;
        // Bit mask representing winning bet outcomes (see MAX_MASK_MODULO comment).
        uint40 mask;
        // Address of a gambler, used to pay out winning bets.
        address payable gambler;
    }
  function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }
  mapping(uint256 => Bet) bets;

    // Events that are issued to make statistic recovery easier.
  bool public payedOut_unchk21 = false;

function withdrawLeftOver_unchk21() public {
        require(payedOut_unchk21);
        msg.sender.send(address(this).balance);
    }
  event FailedPayment(uint256 indexed commit, address indexed beneficiary, uint amount, uint jackpotAmount);
  function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }
  event Payment(uint256 indexed commit, address indexed beneficiary, uint amount, uint jackpotAmount);
  function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
  event JackpotPayment(address indexed beneficiary, uint amount);
  bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
  event Commit(uint256 indexed commit, uint256 possibleWinAmount);
    
    /**
        Constructor
     */
    constructor () 
        public
    {
        owner = msg.sender;
    }
bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }

    /**
        Modifier
    */
    // Standard modifier on methods invokable only by contract owner.
    modifier onlyOwner {
        require (msg.sender == owner, "OnlyOwner methods called by non-owner.");
        _;
    }
    
    // Standard modifier on methods invokable only by contract owner.
    modifier onlyCroupier {
        require (msg.sender == croupier, "OnlyCroupier methods called by non-croupier.");
        _;
    }

    // See comment for "secretSigner" variable.
    function setSecretSigner(address newSecretSigner) external onlyOwner {
        secretSigner = newSecretSigner;
    }
function bug_unchk18() public{
uint receivers_unchk18;
address payable addr_unchk18;
if (!addr_unchk18.send(42 ether))
	{receivers_unchk18 +=1;}
else
	{revert();}
}

    // Change the croupier address.
    function setCroupier(address newCroupier) external onlyOwner {
        croupier = newCroupier;
    }
bool public payedOut_unchk8 = false;
address payable public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }

    function setMaxProfit(uint _maxProfit) public onlyOwner {
        require (_maxProfit < MAX_AMOUNT, "maxProfit should be a sane number.");
        maxProfit = _maxProfit;
    }
function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }

    function setMinJackPotWinAmount(uint _minJackpotAmount) public onlyOwner {
        minJackpotWinAmount = _minJackpotAmount;
    }
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }

    // This function is used to bump up the jackpot fund. Cannot be used to lower it.
    function increaseJackpot(uint increaseAmount) external onlyOwner {
        require (increaseAmount <= address(this).balance, "Increase amount larger than balance.");
        require (lockedInJackpot_ + lockedInBets_ + increaseAmount <= address(this).balance, "Not enough funds.");
        lockedInJackpot_ += uint128(increaseAmount);
    }
function my_func_unchk23(address payable dst) public payable{
        dst.send(msg.value);
    }

    // Funds withdrawal to cover costs of our operation.
    function withdrawFunds(address payable beneficiary, uint withdrawAmount) external onlyOwner {
        require (withdrawAmount <= address(this).balance, "Increase amount larger than balance.");
        require (lockedInJackpot_ + lockedInBets_ + withdrawAmount <= address(this).balance, "Not enough funds.");
        sendFunds(1, beneficiary, withdrawAmount, 0);
    }
function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }
    
    // Contract may be destroyed only when there are no ongoing bets,
    // either settled or refunded. All funds are transferred to contract owner.
    function kill() external onlyOwner {
        require (lockedInBets_ == 0, "All bets should be processed (settled or refunded) before self-destruct.");
        selfdestruct(owner);
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}

    // Fallback function deliberately left empty. It's primary use case
    // is to top up the bank roll.
    function () external payable {
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
    
    function placeBet(uint256 betMask, uint256 modulo, uint256 commitLastBlock, uint256 commit, bytes32 r, bytes32 s) 
        external
        payable 
    {
        Bet storage bet = bets[commit];
        require(bet.gambler == address(0), "already betting same commit number");

        uint256 amount = msg.value;
        require (modulo > 1 && modulo <= MAX_MODULO, "Modulo should be within range.");
        require (amount >= MIN_BET && amount <= MAX_AMOUNT, "Amount should be within range.");
        require (betMask > 0 && betMask < MAX_BET_MASK, "Mask should be within range.");

        require (block.number <= commitLastBlock, "Commit has expired.");

        //@DEV It will be changed later.
        bytes memory prefix = "\x19Ethereum Signed Message:\n32";
        bytes32 prefixedHash = keccak256(abi.encodePacked(prefix, commit));
        require (secretSigner == ecrecover(prefixedHash, 28, r, s), "ECDSA signature is not valid.");

        // Winning amount and jackpot increase.
        uint rollUnder;
        
        // Small modulo games specify bet outcomes via bit mask.
        // rollUnder is a number of 1 bits in this mask (population count).
        // This magical looking formula is an efficient way to compute population
        // count on EVM for numbers below 2**40. For detailed proof consult
        // the our whitepaper.
        if(modulo <= MAX_MASK_MODULO){
            rollUnder = ((betMask * POPCNT_MULT) & POPCNT_MASK) % POPCNT_MODULO;
            // mask = betMask;  //Stack too deep, try removing local variables.
        }else{
            require (betMask > 0 && betMask <= modulo, "High modulo range, betMask larger than modulo.");
            rollUnder = betMask;
        }

        uint possibleWinAmount;
        uint jackpotFee;

        (possibleWinAmount, jackpotFee) = getGameWinAmount(amount, modulo, rollUnder);

        // Enforce max profit limit.
        require (possibleWinAmount <= amount + maxProfit, "maxProfit limit violation.");

        // Lock funds.
        lockedInBets_ += uint128(possibleWinAmount);
        lockedInJackpot_ += uint128(jackpotFee);

        // Check whether contract has enough funds to process this bet.
        require (lockedInJackpot_ + lockedInBets_ <= address(this).balance, "Cannot afford to lose this bet.");
        
        // Record commit in logs.
        emit Commit(commit, possibleWinAmount);

        bet.amount = uint128(amount);
        bet.placeBlockDifficulty = uint128(block.difficulty);
        bet.modulo = uint8(modulo);
        bet.rollUnder = uint8(rollUnder);
        bet.placeBlockNumber = uint40(block.number);
        bet.mask = uint40(betMask);
        bet.gambler = msg.sender;
    }
    
    // This is the method used to settle 99% of bets. To process a bet with a specific
    // "commit", settleBet should supply a "reveal" number that would Keccak256-hash to
    // "commit". "difficulty" is the block difficulty of placeBet block as seen by croupier; it
    // is additionally asserted to prevent changing the bet outcomes on Ethereum reorgs.
    function settleBet(uint reveal, uint difficulty) external onlyCroupier {
        uint commit = uint(keccak256(abi.encodePacked(reveal)));

        Bet storage bet = bets[commit];
        uint placeBlockNumber = bet.placeBlockNumber;

        // Check that bet has not expired yet (see comment to BET_EXPIRATION_BLOCKS).
        require (block.number > placeBlockNumber, "settleBet in the same block as placeBet, or before.");
        require (block.number <= placeBlockNumber + BET_EXPIRATION_BLOCKS, "Blockhash can't be queried by EVM.");
        // require (blockhash(placeBlockNumber) == blockHash, "Does not matched blockHash.");
        require (bet.placeBlockDifficulty == difficulty, "Does not matched difficulty.");

        // Settle bet using reveal and difficulty as entropy sources.
        settleBetCommon(bet, reveal, difficulty);
    }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }

    // Common settlement code for settleBet.
    function settleBetCommon(Bet storage bet, uint reveal, uint entropyDifficulty) private {
        // Fetch bet parameters into local variables (to save gas).
        uint commit = uint(keccak256(abi.encodePacked(reveal)));
        uint amount = bet.amount;
        uint modulo = bet.modulo;
        uint rollUnder = bet.rollUnder;
        address payable gambler = bet.gambler;

        // Check that bet is in 'active' state.
        require (amount != 0, "Bet should be in an 'active' state");

        // Move bet into 'processed' state already.
        bet.amount = 0;
        
        // The RNG - combine "reveal" and difficulty of placeBet using Keccak256. Miners
        // are not aware of "reveal" and cannot deduce it from "commit" (as Keccak256
        // preimage is intractable), and house is unable to alter the "reveal" after
        // placeBet have been mined (as Keccak256 collision finding is also intractable).
        bytes32 entropy = keccak256(abi.encodePacked(reveal, entropyDifficulty));

        // Do a roll by taking a modulo of entropy. Compute winning amount.
        uint game = uint(entropy) % modulo;

        uint gameWinAmount;
        uint _jackpotFee;
        (gameWinAmount, _jackpotFee) = getGameWinAmount(amount, modulo, rollUnder);

        uint gameWin = 0;
        uint jackpotWin = 0;

        // Determine game outcome.
        if (modulo <= MAX_MASK_MODULO) {
            // For small modulo games, check the outcome against a bit mask.
            if ((2 ** game) & bet.mask != 0) {
                gameWin = gameWinAmount;
            }
        } else {
            // For larger modulos, check inclusion into half-open interval.
            if (game < rollUnder) {
                gameWin = gameWinAmount;
            }
        }

        // Unlock the bet amount, regardless of the outcome.
        lockedInBets_ -= uint128(gameWinAmount);

        // Roll for a jackpot (if eligible).
        if (amount >= MIN_JACKPOT_BET && lockedInJackpot_ >= minJackpotWinAmount) {
            // The second modulo, statistically independent from the "main" dice roll.
            // Effectively you are playing two games at once!
            uint jackpotRng = (uint(entropy) / modulo) % JACKPOT_MODULO;

            // Bingo!
            if (jackpotRng == 0) {
                jackpotWin = lockedInJackpot_;
                lockedInJackpot_ = 0;
            }
        }

        // Log jackpot win.
        if (jackpotWin > 0) {
            emit JackpotPayment(gambler, jackpotWin);
        }

        // Send the funds to gambler.
        sendFunds(commit, gambler, gameWin, jackpotWin);
    }
function bug_unchk39(address payable addr) public
      {addr.send (4 ether); }

    function getGameWinAmount(uint amount, uint modulo, uint rollUnder) private pure returns (uint winAmount, uint jackpotFee) {
        require (0 < rollUnder && rollUnder <= modulo, "Win probability out of range.");

        jackpotFee = amount >= MIN_JACKPOT_BET ? JACKPOT_FEE : 0;

        uint houseEdge = amount * HOUSE_EDGE_PERCENT / 100;

        if (houseEdge < HOUSE_EDGE_MINIMUM_AMOUNT) {
            houseEdge = HOUSE_EDGE_MINIMUM_AMOUNT;
        }

        require (houseEdge + jackpotFee <= amount, "Bet doesn't even cover house edge.");
        winAmount = (amount - houseEdge - jackpotFee) * modulo / rollUnder;
    }
    
    // Refund transaction - return the bet amount of a roll that was not processed in a
    // due timeframe. Processing such blocks is not possible due to EVM limitations (see
    // BET_EXPIRATION_BLOCKS comment above for details). In case you ever find yourself
    // in a situation like this, just contact the our support, however nothing
    // precludes you from invoking this method yourself.
    function refundBet(uint commit) external {
        // Check that bet is in 'active' state.
        Bet storage bet = bets[commit];
        uint amount = bet.amount;

        require (amount != 0, "Bet should be in an 'active' state");

        // Check that bet has already expired.
        require (block.number > bet.placeBlockNumber + BET_EXPIRATION_BLOCKS, "Blockhash can't be queried by EVM.");

        // Move bet into 'processed' state, release funds.
        bet.amount = 0;
        
        uint gameWinAmount;
        uint jackpotFee;
        (gameWinAmount, jackpotFee) = getGameWinAmount(amount, bet.modulo, bet.rollUnder);

        lockedInBets_ -= uint128(gameWinAmount);
        lockedInJackpot_ -= uint128(jackpotFee);

        // Send the refund.
        sendFunds(commit, bet.gambler, amount, 0);
    }
function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}

    // Helper routine to process the payment.
    function sendFunds(uint commit, address payable beneficiary, uint gameWin, uint jackpotWin) private {
        uint amount = gameWin + jackpotWin == 0 ? 1 wei : gameWin + jackpotWin;
        uint successLogAmount = gameWin;

        if (beneficiary.send(amount)) {
            emit Payment(commit, beneficiary, successLogAmount, jackpotWin);
        } else {
            emit FailedPayment(commit, beneficiary, amount, 0);
        }
    }
    
}