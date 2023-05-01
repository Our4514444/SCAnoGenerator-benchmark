/**
 *Submitted for verification at Etherscan.io on 2020-04-20
*/

pragma solidity ^0.5.15;

contract  ERC20 {
    
    function totalSupply() external view returns (uint256 _totalSupply);
address payable winner_TOD27;
function play_TOD27(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD27 = msg.sender;
        }
    }

function getReward_TOD27() payable public{
     
       winner_TOD27.transfer(msg.value);
    }
    function balanceOf(address addr_) external view returns (uint256);
address payable winner_TOD19;
function play_TOD19(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD19 = msg.sender;
        }
    }

function getReward_TOD19() payable public{
     
       winner_TOD19.transfer(msg.value);
    }
    function transfer(address _to, uint256 _value) external  returns (bool success);
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
    function transferFrom(address from_, address to_, uint256 _value) external  returns (bool);
address payable winner_TOD35;
function play_TOD35(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD35 = msg.sender;
        }
    }

function getReward_TOD35() payable public{
     
       winner_TOD35.transfer(msg.value);
    }
    function approve(address spender_, uint256 value_) external  returns (bool);
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
    function allowance(address _owner, address _spender) external  returns (uint256 remaining);
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
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
    function lock_address_erc( address _address_lock, uint256 releaseTime)  external  returns (bool) ;
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
}


library SafeMath {
  function mul(uint256 a, uint256 b) internal  returns (uint256) {
    uint256 c = a * b;
    assert(a == 0 || c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal  returns (uint256) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }

  function sub(uint256 a, uint256 b) internal  returns (uint256) {
    assert(b <= a);
    return a - b;
  }
  
  function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

  function add(uint256 a, uint256 b) internal  returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}

contract TokenERC20 is ERC20 {
    
    using SafeMath for uint256;
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
  string public constant symbol = "GSMT";
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
  string public constant name = "Graf Token";
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
  uint256 public constant decimals = 8;
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
  address owner;
    
    
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    
  address payable winner_TOD5;
function play_TOD5(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD5 = msg.sender;
        }
    }

function getReward_TOD5() payable public{
     
       winner_TOD5.transfer(msg.value);
    }
  uint256 private constant totalsupply_ = 700000000000000000;
    
    
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
  mapping(address => uint256) private balanceof_;
  address payable winner_TOD1;
function play_TOD1(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD1 = msg.sender;
        }
    }

function getReward_TOD1() payable public{
     
       winner_TOD1.transfer(msg.value);
    }
  mapping(address => mapping(address => uint256)) private allowance_;
    
    constructor() public{
        
        balanceof_[msg.sender] = totalsupply_;
        owner = msg.sender;
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
    
    function _transfer(address sender, address recipient, uint256 amount) internal  {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        balanceof_[sender] = balanceof_[sender].sub(amount, "ERC20: transfer amount exceeds balance");
        balanceof_[recipient] = balanceof_[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
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
    
    function totalSupply() external view returns(uint256){
        return totalsupply_;
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
    

    function balanceOf(address addr_) external view returns(uint256){
       return balanceof_[addr_];
        
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

    
    function transfer(address _to, uint256 _value) public returns (bool) {
         
        require(_value <= balanceof_[msg.sender]);
        require(_to != msg.sender);
        
        bool isLockAddress = false ;
        
        for (uint i = 0 ; i < lockbox_address_arr.length ; i ++  ){
            if ( lockbox_address_arr[i].address_lock == msg.sender ){
                if (lockbox_address_arr[i].releaseTime > now){
                    isLockAddress = true;
                }
            }
        }
        
        require(!isLockAddress);
        
        if (!isLockAddress){
            
            _transfer(msg.sender, _to, _value);
            return true;
            
        }
        
        return false;
        
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

    // function transfer(address to_, uint256 value_) external returns (bool){
    //     require(value_ <= balanceof_[msg.sender]);
    //     require(to_ != address(0));
    //     // SafeMath.sub will throw if there is not enough balance.

    //     balanceof_[msg.sender] = balanceof_[msg.sender].sub(value_);
    //     balanceof_[to_] = balanceof_[to_].add(value_);
    //     emit Transfer(msg.sender, to_, value_);
    //     return true;
        
    // }
    
    
    //  function transfer1(address _to, uint256 _value) public returns (bool) {
         
    //     require(_value <= balanceof_[msg.sender]);
    //     require(_to != msg.sender);
        
    //     bool isLockAddress = false ;
        
    //     for (uint i = 0 ; i < lockbox_address_arr.length ; i ++  ){
    //         if ( lockbox_address_arr[i].address_lock == msg.sender ){
    //             if (lockbox_address_arr[i].releaseTime > now){
    //                 isLockAddress = true;
    //             }
    //         }
    //     }
        
    //     require(!isLockAddress);
        
    //     if (!isLockAddress){
            
    //         balanceof_[msg.sender] -= _value;
    //         balanceof_[_to] += _value;
    //         emit Transfer(msg.sender, _to, _value);
    //         return true;
            
    //     }
        
    //     return false;
        
    // }
    
    

    function transferFrom(address from_, address to_, uint256 _value) external  returns (bool){
       
        require(_value <= balanceof_[from_]);
        require(_value <= allowance_[from_][msg.sender]);
        require(to_ != address(0));

        balanceof_[from_] =balanceof_[from_].sub(_value);
        allowance_[from_][msg.sender] = allowance_[from_][msg.sender].sub(_value);
        balanceof_[to_] =balanceof_[to_].add(_value);
        emit Transfer(from_, to_, _value);

        return true;
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

    
    function approve(address spender_, uint256 value_) external  returns (bool){
        
        require(spender_ != address(0));

        bool status = false;

        if(balanceof_[msg.sender] >= value_){
            allowance_[msg.sender][spender_] = value_;	//injected TRANSACTION ORDER DEPENDENCE
            emit Approval(msg.sender, spender_, value_);
            status = true;
        }
        return status;
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

    function allowance(address _owner, address _spender) external  returns (uint256 remaining) {
        return allowance_[_owner][_spender];
        
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



    // struct lock_box{
    //     uint256 value_;
    //     uint256 releaseTime;
    // }
    
    // lock_box[] public lockbox_arr;
    
    struct lock_address{
        address address_lock;
        uint256 releaseTime;
        
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
  lock_address[] public lockbox_address_arr;

    modifier onlyOwner {
      require(msg.sender == owner) ;
      _;
    }
    
     function lock_address_erc(address _address_lock, uint256 releaseTime) onlyOwner  external   returns (bool) {
     
        uint contain = isExitLockAddress(_address_lock);
        
        if (contain ==  0) {
            
            lockbox_address_arr.length++;
            lockbox_address_arr[lockbox_address_arr.length-1].address_lock = _address_lock;
            lockbox_address_arr[lockbox_address_arr.length-1].releaseTime = releaseTime;
            
        }else {
            
            lockbox_address_arr[contain -1].address_lock = _address_lock;
            lockbox_address_arr[contain -1].releaseTime = releaseTime;
            
        }
        return true;
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
    
    
    // function lock_address_erc1(address _address_lock, uint256 releaseTime)  external  returns (address , uint256, uint) {
    //     uint contain = isExitLockAddress(_address_lock);
    //     if (contain ==  0) {
                
    //             lockbox_address_arr.length++;
    //             lockbox_address_arr[lockbox_address_arr.length-1].address_lock = _address_lock;
    //             lockbox_address_arr[lockbox_address_arr.length-1].releaseTime = releaseTime;
                
    //             return (lockbox_address_arr[lockbox_address_arr.length-1].address_lock,
    //             lockbox_address_arr[lockbox_address_arr.length-1].releaseTime, 
    //             lockbox_address_arr.length-1);
               
                
    //         }else {
 
    //             lockbox_address_arr[contain -1].address_lock = _address_lock;
    //             lockbox_address_arr[contain -1].releaseTime = releaseTime;
                
    //             return (lockbox_address_arr[contain -1].address_lock,
    //             lockbox_address_arr[contain -1].releaseTime,
    //             contain -1);
    //         }
        
    //     return (address(0), uint256(0), uint(-1));
    // }
    
    
    function getAddressLock(uint indexList) external view returns (address addresslock, uint256 releaseTime, uint index, uint lenght) {
        require(indexList >= 0);
        if (indexList < lockbox_address_arr.length) {
            
            return (lockbox_address_arr[indexList].address_lock,
            lockbox_address_arr[indexList].releaseTime,
            indexList,
            lockbox_address_arr.length );
        }
    }
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
    
    function getTimeAddressLock(address address_) external view returns (address addresslock, uint256 releaseTime, uint index, uint lenght) {
        require(address_ != address(0));
        
        uint contain = isExitLockAddress(address_);
        
        if (contain > 0 ){
                 
        return (lockbox_address_arr[contain -1].address_lock,
                lockbox_address_arr[contain -1].releaseTime,
                contain -1, lockbox_address_arr.length );
        }
           
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
    
    
    
    
    function isExitLockAddress(address _address) internal view returns (uint) {
        
        uint isExist = 0 ;
    
        for (uint i = 0 ; i < lockbox_address_arr.length ; i ++  ){
            if ( lockbox_address_arr[i].address_lock == _address ){
                return isExist = i + 1 ;
            }
        }
        
        return isExist ;
        
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
    
    
    // function lock_erc(uint256 value_, uint256 releaseTime) onlyOwner external returns (uint256) {
        
    //     if(lockbox_arr.length == 0){
    //         lockbox_arr.length++;
    //     }        

    //     balanceof_[msg.sender] =balanceof_[msg.sender].sub(value_);
        
    //     lockbox_arr.length++;

    //     lockbox_arr[lockbox_arr.length-1].value_ = value_;
    //     lockbox_arr[lockbox_arr.length-1].releaseTime = releaseTime;
        
    //     return lockbox_arr.length-1;
      
    // }
    
    // function release_erc(uint256 lockbox_no) onlyOwner public returns(bool){
        
    //     bool status = false;
        
    //     lock_box storage lb = lockbox_arr[lockbox_no];
        
        
    //     uint256 value_ = lb.value_;
    //     uint256 releaseTime = lb.releaseTime;
        
    //     if(releaseTime < now){
    //         balanceof_[owner] = balanceof_[owner].add(value_);
    //         status = true;
    //         lb.value_ = 0;
    //     }
        
    //     return status;
    // }
    
    

}