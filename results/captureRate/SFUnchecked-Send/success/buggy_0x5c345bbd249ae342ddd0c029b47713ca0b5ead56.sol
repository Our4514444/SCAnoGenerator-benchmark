/**
 *Submitted for verification at Etherscan.io on 2020-06-25
*/

/**
 *Submitted for verification at Etherscan.io on 2020-06-24
*/

pragma solidity 0.6.6;
pragma experimental ABIEncoderV2;

/* 
    Market Data Oracle

    It is a kind of oracle to bring market data to the Ethereum blockchain.

    The prices renewed once a day. A list of current instruments available at a website or
    through the contract dictionary with the last time and block the price was renewed.
    New requests for price updates are checked every second.

    If you need the prlllllllllllllllllllice to be renewed more often, you can do the following:*
        - send transaction to the contract just before you need it to be updated using
          function requestPriceUpdate (see the contract code or use it on our website)
        - top up the balance of smart contract to pay before for the transactions to renew the price with the frequency
          you need, or on a significant price change using payForSubscription function (find more info on the website)
        - if you top up your previous subscription, you get an additional 5% discount each time till you pay only half of contract's comission. 

    Note: topping up the contract balance by just sending ether directly will be considered as a donation.
          By the way, donations are always appreciated and mentioned on the website. 
          Beneficiary address is public and can be viewed in the contract. 
          If 'finalized' flag is up, there is no possibility to change it even for the author.
          All profits are shared amoung tokenHolders of this service. 
          If you want to earn profits of this service, check beneficiary address contract or our website.

    Examples:

      exchangeRate er = exchangeRate(contractAdress);

      uint eth = er.getPrice('eth');        // returns price of Ether in USD cents.
      uint btc = er.getPrice('btc')         // returns price of Bitcoin in USD cents.
      uint brent = er.getPrice('Brent')     // returns price of Brent in USD cents.

    Please, visit https://exchangeratedata.ru for more information.

    @author Nagornykh Dmitry 
    e-mail: nagor@academ.org 
    telegram: @hypermosu
    *My cat helped to type this line (the word "prlllllllllllllllllllice"). It's name is Liquid.
*/

contract exchangeRateContract {
    
    subscription[] subscriptions;
    
    uint public subscriptionsCount;
    uint public instrumentsCount;

    //================== discounts =====================
    mapping(address => uint) public discounts;

    //================== discounts =====================
    uint constant public updOnePriceGasCost = 84928;
    uint constant public updSeveralPricesCost = 87742;
    uint constant public updAdditionalPrice = 22700;
    
    uint public minSubscrTxNum = 100;
    
    uint[3] public gasPrices;

    address payable public author;
    address payable public beneficiary;
    address payable public updater;

    bool public finalized;
    
    mapping(string => Instrument) public instruments;
    mapping(uint => string) public dictinary;

    modifier onlyAuthor{
        require(msg.sender == author, "This function is for author only");
        _;
    }

    modifier onlyUpdater{
        require(msg.sender == updater, "This function is for updater only");
        _;
    }

  function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
  event priceUpdateRequest (address payer, uint block, string symbol, uint gasPrice);
  function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
  event updateSeveralPricesRequest (uint block, string[] symbols, uint gasPrice);
  function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
  event priceUpdated (address payer, string symbol, uint newPrice, uint timeStamp, uint block);
  function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
  event Donation (address donator, uint value, uint blockNumber);
  function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  event SubscriptionPayed (address subscirber, uint subscriptionID);
  function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  event ProfitEvent (uint profit);

    function changeBeneficiaryAddress(address payable newAddress) public onlyAuthor returns (bool){
        if (!finalized){
            beneficiary = newAddress;
            return true;
        }
        return false;
    }
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
    
    function finalize() public onlyAuthor returns (bool){
        if (!finalized){
            finalized = true;
            return true;
        }
        return false;
    }
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
    
    function setDiscount(address payer, uint value) public onlyAuthor {
        require (value>0 && value<100, "Invalid discount value");
        discounts[payer] = value;
    }
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}

    function changeUpdaterAddress (address payable newAddress) public onlyAuthor{
        updater = newAddress;
    }
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
    
    function changeMinSubscrTxNum (uint value) public onlyAuthor{
        minSubscrTxNum = value;
    }
function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}

    function topUpSubscription (uint subscriptionID) public payable {
        require (containsSubscription(subscriptionID), "There is no subscription with such ID");
        subscription memory s = getSubscribtion(subscriptionID);
        require (msg.value > 2 * minSubscrTxNum * (updSeveralPricesCost + updAdditionalPrice * s.symbols.length) * tx.gasprice, 'Too little transactions ordered');
        if (discounts[s.payer] == 0)
            discounts[s.payer] = 100;
            
        if (discounts[s.payer] > 50) 
            discounts[s.payer] -=5;
        s.remainingBalance += msg.value;
    }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}

    function payForSubscription(string memory email, uint[] memory frequencies, uint[] memory priceDifferences, string[] memory symbols, uint txSpeed) public payable {
        require (frequencies.length == priceDifferences.length && frequencies.length == symbols.length, '1rrays should have similar length. For more information visit webSite');
        require(symbols.length>0 && instrumentsCount >= symbols.length, 'Invalid array size. For more information visit webSite');
        require (txSpeed>0 && txSpeed<4, 'Wrong txSpeed. Use only 1/2/3' );
        require (msg.value > 2 * minSubscrTxNum * (updSeveralPricesCost + updAdditionalPrice * symbols.length) * tx.gasprice, 'Too little transactions ordered');
        subscription storage s; 
        
        for (uint i = 0; i<priceDifferences.length; i++)
            require (priceDifferences[i]<100, 'priceDifferences should be less then 100');
        
        s.email = email;
        s.symbols = symbols;
        s.frequencies = frequencies;
        s.priceDifferences = priceDifferences;
        s.txSpeed = txSpeed;
        s.remainingBalance = msg.value;
        s.payer = msg.sender;
        s.timeStamp = now;
        s.ID = ++subscriptionsCount;
        s.index = subscriptions.length;
        
        subscriptions.push(s);
        
        emit SubscriptionPayed (msg.sender,s.ID);
    }
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
    
    function containsSubscription (uint subscriptionID) public view returns (bool){
        for (uint i = 0; i< subscriptions.length; i++)
            if (subscriptionID == subscriptions[i].ID)
            return true;
        return false;
    }
function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}
    
    function getSubscribtion(uint subscriptionID) public view returns (subscription memory s) {
        for (uint i = 0; i< subscriptions.length; i++) {
            if (subscriptionID == subscriptions[i].ID) {
                return subscriptions[i];
            }
        }
    }
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
    
    function getInstrument(string memory symbol) public view returns (Instrument memory inst) {
        return instruments[symbol];
    }
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
    
    function requestPriceUpdate(string memory symbol) public payable {
        uint cost = 2*updOnePriceGasCost*tx.gasprice;
        require (msg.value>=cost, "You need to pass more ether to request new price. For more information visit webSite");
        if (msg.value>cost)
            author.transfer(msg.value - cost);
        emit priceUpdateRequest (msg.sender, block.number, symbol, tx.gasprice);
    }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}

    function requestPricesUpdateWithSymbols (string[] memory symbols) public payable {
        require (symbols.length>=1, "Symbols array must contain at least 1 element. For more information visit webSite");
        uint cost = 2 * (symbols.length * updAdditionalPrice + updSeveralPricesCost) * tx.gasprice;
        require (msg.value>= cost, "You need to pass more ether to request new price. For more information visit webSite");
        if (msg.value> cost)
            author.transfer(msg.value - cost);
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
    
    function removeSubscription (uint index) internal {
        require(index < subscriptions.length,"Index is out of range");
        subscriptions[index] = subscriptions[subscriptions.length-1];
        subscriptions[index].index = index;
        delete subscriptions[subscriptions.length-1];
    }
function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}
    
    function updateSeveralPrices(address payer, uint[] memory timeStamps, string[] memory symbols, uint[] memory prices, uint[3] memory currentGasPrices, uint subscriptionID) public onlyUpdater{

        uint cost = (updSeveralPricesCost + symbols.length * updAdditionalPrice) * tx.gasprice;
        require (timeStamps.length == symbols.length && symbols.length == prices.length, "Symbols, timeStamps and prices arrays have different size. For more information visit webSite");
        require (address(this).balance > 2 * cost,'Contract has insufficient balance. For more information visit webSite');

        subscription memory s;

        if (subscriptionID != 0 && payer == address(0x0)) {
            s = subscriptions[subscriptionID];
            uint profit = transferProfit (s.payer, cost);
            updater.transfer(cost);
            if (s.remainingBalance >= profit+cost)
            s.remainingBalance -= (profit + cost);
            else {
            removeSubscription(s.index);
            }
        } else {
            transferProfit (payer, cost);
            updater.transfer(cost);
        }
        

        gasPrices = currentGasPrices;

        for (uint i=0; i<symbols.length; i++)
            updPrice (payer, symbols[i], prices[i], timeStamps[i]);
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}

    function transferProfit (address payer, uint cost) internal returns (uint profit){
        uint prof = cost; 
        if (discounts[payer]>0)
            prof = cost * discounts[payer] / 100; 
        if (prof>0) {
            beneficiary.transfer(prof);
            emit ProfitEvent(prof);
            return prof;
        }
    }
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}

    function updateSinglePrice(address payer, string memory symbol, uint timeStamp, uint newPrice) public onlyUpdater returns (bool success){
        uint cost = updOnePriceGasCost*tx.gasprice;
        require (address(this).balance > 2 * cost ,'Contract has insufficient balance. For more information visit webSite');
        updPrice (payer, symbol, newPrice, timeStamp);
        transferProfit (payer, cost);
        updater.transfer(cost);
        return true;
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}

    function updPrice(address payer, string memory symbol, uint newPrice, uint timeStamp) internal {
        require (instruments[symbol].block > 0, "Symbol not found in the dictinary. For more information visit webSite");
        instruments[symbol].timeStamp = timeStamp;
        instruments[symbol].price = newPrice;
        instruments[symbol].block = block.number;
        emit priceUpdated (payer, symbol, newPrice, timeStamp, block.number);
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

    constructor() public {
        author = msg.sender;
        beneficiary = msg.sender;
        updater = msg.sender;
    }
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}

    
    //!!!!!!!!!!!!!!!!!!!!!!!!!!onlyUpdater
    function addInstrument(string memory symbol, string memory name, uint decimals) public {
        require (instruments[symbol].block == 0, "Symbol already exist, use updateInstrument");
        dictinary[instrumentsCount] = symbol;
        instruments[symbol].name = name;
        instruments[symbol].decimals = decimals;
        instruments[symbol].block = 1;
        instrumentsCount++;
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

    //!!!!!!!!!!!!!!!!!!!!!!!!!!onlyUpdater
    function updateInstrument(string memory symbol, string memory name, uint decimals) public {
        instruments[symbol].name = name;
        instruments[symbol].decimals = decimals;
    }
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}

    function getDictonarySymbol(uint id) public view returns (string memory symbol) {
        return dictinary[id];
    }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}

    function getPrice(string memory symbol) public view returns (uint256) {
        return instruments[symbol].price;
    }
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}

    function timeStamp(string memory symbol) public view returns (uint256) {
        return instruments[symbol].timeStamp;
    }
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}

    function getDecimals(string memory symbol) public view returns (uint decimals) {
        return instruments[symbol].decimals;
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

    function getBlockNumber(string memory symbol) public view returns (uint blockNumber) {
        return instruments[symbol].block;
    }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}

    receive() external payable {
        if (msg.sender != author) {
            beneficiary.transfer(msg.value);
            emit Donation (msg.sender, msg.value, block.number);
        }
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}

}

struct subscription{
        uint index;
        uint ID;
        string email;
        string[] symbols;     // symbols to update
        uint[] frequencies;  // how often proceed updates
        uint[] priceDifferences; // update price, if it changed significantly (in percent)
        address payer;
        uint remainingBalance;
        uint txSpeed;
        uint timeStamp; // time of creation
}
    
struct Instrument {
        string name;    // full name of an instrument or pair
        uint price;     // price of an instrument in US dollars
        uint decimals;  // to use the price in your smart contracts or elsewhere, you need to divide it by 10^decimals
        uint timeStamp; // time of last price update
        uint block;     // block number of last price update
}