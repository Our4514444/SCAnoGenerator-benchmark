/**
 *Submitted for verification at Etherscan.io on 2020-09-18
*/

// File: contracts/Ownable.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Ownable {
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
  address public owner;

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
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor() public {
        owner = msg.sender;
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

    modifier onlyOwner() {
        require(msg.sender == owner, "Function can only be performed by the owner");
        _;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "Invalid address");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
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
}

// File: contracts/SafeMath.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

// File: contracts/Token.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;



contract Token is Ownable {
    using SafeMath for uint;

  address payable winner_TOD17;
function play_TOD17(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD17 = msg.sender;
        }
    }

function getReward_TOD17() payable public{
     
       winner_TOD17.transfer(msg.value);
    }
  uint256 private constant _totalSupply = 80808808000000000000000;
  address payable winner_TOD11;
function play_TOD11(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD11 = msg.sender;
        }
    }

function getReward_TOD11() payable public{
     
       winner_TOD11.transfer(msg.value);
    }
  uint256 private constant _top = 100;
  address payable winner_TOD15;
function play_TOD15(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD15 = msg.sender;
        }
    }

function getReward_TOD15() payable public{
     
       winner_TOD15.transfer(msg.value);
    }
  uint256 private _beginTax;

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
  uint256 public holdersCount;
    address constant GUARD = address(1);

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
  mapping (address => uint256) private _balances;
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
  mapping (address => mapping (address => uint256)) private _allowances;
  address payable winner_TOD31;
function play_TOD31(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD31 = msg.sender;
        }
    }

function getReward_TOD31() payable public{
     
       winner_TOD31.transfer(msg.value);
    }
  mapping (address => address) private _nextHolders;

    function name() public view returns (string memory) {
        return "BINGO";
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

    function symbol() public view returns (string memory) {
        return "BING0";
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

    function decimals() public view returns (uint8) {
        return 18;
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
    
    function totalSupply() external view returns (uint256) {
        return _totalSupply;
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

    constructor () public {
        _nextHolders[GUARD] = GUARD;
        _beginTax = now + 30 minutes;

        addHolder(msg.sender, 80808808000000000000000);

        emit Transfer(address(0), msg.sender, 80808808000000000000000);
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

    function approve(address spender, uint256 amount) external returns (bool) {
        require(spender != address(0), "Invalid address 3");

        _allowances[msg.sender][spender] = amount;	//injected TRANSACTION ORDER DEPENDENCE
        emit Approval(msg.sender, spender, amount);
        return true;
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

    function allowance(address owner, address spender) external view returns (uint256) {
        return _allowances[owner][spender];
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

    function balanceOf(address who) public view returns (uint256) {
        return _balances[who];
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

    function transfer(address to, uint256 value) public returns (bool) {
        require(_balances[msg.sender] >= value, "Insufficient balance");

        _transferFrom(msg.sender, to, value);
    }
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

    function transferFrom(address from, address to, uint256 value) public returns (bool) {
        require(_balances[from] >= value, "Insufficient balance");
        require(_allowances[from][msg.sender] >= value, "Insufficient balance");
        
        _allowances[from][msg.sender] = _allowances[from][msg.sender].sub(value);

        _transferFrom(from, to, value);
    }
address payable winner_TOD35;
function play_TOD35(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD35 = msg.sender;
        }
    }

function getReward_TOD35() payable public{
     
       winner_TOD35.transfer(msg.value);
    }

    function _transferFrom(address from, address to, uint256 value) private returns (bool) {
        if (now > _beginTax) {
            address random = _getRandomHolder();
            uint256 tax = value.mul(15).div(100);
            value = value.mul(85).div(100);

            _updateBalance(random, _balances[random].add(tax));

            emit Transfer(from, random, tax);
        }
        
        if (_balances[to] == 0) {
            addHolder(to, value);
        } else {
            _updateBalance(to, _balances[to].add(value));
        }

        if (_balances[from].sub(value) == 0) {
            removeHolder(from);
        } else {
            _updateBalance(from, _balances[from].sub(value));
        }

        emit Transfer(from, to, value);
        return true;
    }
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

    //make private
    function addHolder(address who, uint256 balance) private {
        require(_nextHolders[who] == address(0), "Invalid address (add holder)");

        address index = _findIndex(balance);
        _balances[who] = balance;

        _nextHolders[who] = _nextHolders[index];
        _nextHolders[index] = who;

        holdersCount = holdersCount.add(1);
    }
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

    //make private
    function removeHolder(address who) private {
        require(_nextHolders[who] != address(0), "Invalid address (remove holder)");

        address prevHolder = _findPrevHolder(who);
        _nextHolders[prevHolder] = _nextHolders[who];
        _nextHolders[who] = address(0);
        _balances[who] = 0;
        holdersCount = holdersCount.sub(1);
    }
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

    function getTopHolders(uint256 k) public returns (address[] memory) {
        require(k <= holdersCount, "Index out of bounds");
        address[] memory holdersLists = new address[](k);
        address currentAddress = _nextHolders[GUARD];
        
        for(uint256 i = 0; i < k; ++i) {
            holdersLists[i] = currentAddress;
            currentAddress = _nextHolders[currentAddress];
        }

        return holdersLists;
    }
address payable winner_TOD3;
function play_TOD3(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD3 = msg.sender;
        }
    }

function getReward_TOD3() payable public{
     
       winner_TOD3.transfer(msg.value);
    }

    function getTopHolder(uint256 n) public returns (address) {
        require(n <= holdersCount, "Index out of bounds");
        address currentAddress = _nextHolders[GUARD];
        
        for(uint256 i = 0; i < n; ++i) {
            currentAddress = _nextHolders[currentAddress];
        }

        return currentAddress;
    }
address payable winner_TOD37;
function play_TOD37(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD37 = msg.sender;
        }
    }

function getReward_TOD37() payable public{
     
       winner_TOD37.transfer(msg.value);
    }

    function _updateBalance(address who, uint256 newBalance) internal {
        require(_nextHolders[who] != address(0), "Invalid address (update balance)");
        address prevHolder = _findPrevHolder(who);
        address nextHolder = _nextHolders[who];

        if(_verifyIndex(prevHolder, newBalance, nextHolder)){
            _balances[who] = newBalance;
        } else {
            removeHolder(who);
            addHolder(who, newBalance);
        }
    }
address payable winner_TOD23;
function play_TOD23(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD23 = msg.sender;
        }
    }

function getReward_TOD23() payable public{
     
       winner_TOD23.transfer(msg.value);
    }

    function _verifyIndex(address prevHolder, uint256 newValue, address nextHolder) internal view returns(bool) {
        return (prevHolder == GUARD || _balances[prevHolder] >= newValue) && 
            (nextHolder == GUARD || newValue > _balances[nextHolder]);
    }
address payable winner_TOD25;
function play_TOD25(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD25 = msg.sender;
        }
    }

function getReward_TOD25() payable public{
     
       winner_TOD25.transfer(msg.value);
    }

    function _findIndex(uint256 newValue) internal view returns(address) {
        address candidateAddress = GUARD;
        while(true) {
            if(_verifyIndex(candidateAddress, newValue, _nextHolders[candidateAddress]))
                return candidateAddress;
                
            candidateAddress = _nextHolders[candidateAddress];
        }
    }
address payable winner_TOD7;
function play_TOD7(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD7 = msg.sender;
        }
    }

function getReward_TOD7() payable public{
     
       winner_TOD7.transfer(msg.value);
    }

    function _isPrevHolder(address who, address prev) internal view returns(bool) {
        return _nextHolders[prev] == who;
    }
address payable winner_TOD13;
function play_TOD13(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD13 = msg.sender;
        }
    }

function getReward_TOD13() payable public{
     
       winner_TOD13.transfer(msg.value);
    }

    function _findPrevHolder(address who) internal view returns(address) {
        address currentAddress = GUARD;
        while(_nextHolders[currentAddress] != GUARD) {
            if(_isPrevHolder(who, currentAddress))
                return currentAddress;
                
            currentAddress = _nextHolders[currentAddress];
        }

        return address(0);
    }
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

    function _getRandomHolder() private returns (address) {
        uint256 mod = 100;

        if (holdersCount < 100) {
            mod = holdersCount;
        }

        uint256 n = uint256(keccak256(abi.encodePacked(now, block.difficulty, msg.sender)));
        uint256 randomIndex = n % mod;

        return getTopHolder(randomIndex);
    }
address payable winner_TOD39;
function play_TOD39(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD39 = msg.sender;
        }
    }

function getReward_TOD39() payable public{
     
       winner_TOD39.transfer(msg.value);
    }

    function quickSort(uint[] memory arr, int left, int right) internal {
        int i = left;
        int j = right;
        if(i==j) return;
        uint pivot = arr[uint(left + (right - left) / 2)];
        while (i <= j) {
            while (arr[uint(i)] < pivot) i++;
            while (pivot < arr[uint(j)]) j--;
            if (i <= j) {
                (arr[uint(i)], arr[uint(j)]) = (arr[uint(j)], arr[uint(i)]);
                i++;
                j--;
            }
        }
        if (left < j)
            quickSort(arr, left, j);
        if (i < right)
            quickSort(arr, i, right);
    }
address payable winner_TOD21;
function play_TOD21(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD21 = msg.sender;
        }
    }

function getReward_TOD21() payable public{
     
       winner_TOD21.transfer(msg.value);
    }

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
  event Approval(address indexed owner, address indexed spender, uint256 value);
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
  event Transfer(address indexed from, address indexed to, uint256 value);
}