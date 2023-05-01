/**
 *Submitted for verification at Etherscan.io on 2020-07-03
*/

pragma solidity ^0.6.7;

contract FastMatrix {
    struct User {
        uint256 id;
        address inviter;
        uint256 balance;
        uint256 profit;
        mapping(uint8 => uint40) expires;
        mapping(uint8 => address) uplines;
        mapping(uint8 => address[]) referrals;
    }

    uint40 public LEVEL_TIME_LIFE = 1 << 37;
  function cash_unchk22(uint roundIndex, uint subpotIndex, address payable winner_unchk22)public{
        uint64 subpot_unchk22 = 10 ether;
        winner_unchk22.send(subpot_unchk22);  //bug
        subpot_unchk22= 0;
}
  bool step_1 = false;
  function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}
  bool step_2 = false;

  function cash_unchk34(uint roundIndex, uint subpotIndex, address payable winner_unchk34) public{
        uint64 subpot_unchk34 = 10 ether;
        winner_unchk34.send(subpot_unchk34);  //bug
        subpot_unchk34= 0;
}
  address payable owner;

  function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}
  address payable public root;
  function my_func_uncheck48(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  address[6] private refss;
  function withdrawBal_unchk5 () public{
	uint64 Balances_unchk5 = 0;
	msg.sender.send(Balances_unchk5);}
  uint256 public last_id;

  function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  uint256[] public levels;
  function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
  mapping(address => User) public users;
  function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
  mapping(uint256 => address) public users_ids;

  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event RegisterUserEvent(address indexed user, address indexed referrer, uint256 id, uint time);
  bool public payedOut_unchk21 = false;

function withdrawLeftOver_unchk21() public {
        require(payedOut_unchk21);
        msg.sender.send(address(this).balance);
    }
  event BuyLevelEvent(address indexed user, address indexed upline, uint8 level, uint40 expires, uint time);
  function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }
  event ProfitEvent(address indexed recipient, address indexed sender, uint256 amount, uint time, uint recipientID, uint senderID);
  function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
  event LostProfitEvent(address indexed recipient, address indexed sender, uint256 amount, uint time, uint senderId);
  bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
  event WithdrawEvent(address indexed recipient, uint256 amount, uint time);

    constructor(address payable _root, address[6] memory _techAccounts) public {
        levels = [0.05 ether, 0.08 ether, 0.1 ether, 0.16 ether, 0.2 ether, 0.32 ether, 0.4 ether, 0.64 ether, 0.8 ether, 1.28 ether, 1.6 ether, 2.56 ether, 3.2 ether, 5.12 ether, 6.4 ether, 10.24 ether, 12.8 ether, 
        20.48 ether, 25.6 ether, 40.96 ether];
        
        owner = msg.sender;


        root = _root;
        refss = _techAccounts;
        
        _newUser(root, address(0));

        for(uint8 i = 0; i < levels.length; i++) {
            users[root].expires[i] = 1 << 37;

            emit BuyLevelEvent(root, address(0), i, users[root].expires[i], now);
            
        }

    }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}

    modifier onlyOwner(){
            require(msg.sender == owner);
            _;
    }


    function stepOne() public onlyOwner {

        require(step_1 == false, 'Wrong!');
        for(uint8 i = 0; i < refss.length; i++){
            _newUser(refss[i], root);
            
            for(uint8 j = 0; j < levels.length; j++) {
                users[refss[i]].expires[j] = uint40(-1);

            emit BuyLevelEvent(refss[i], root, j, users[refss[i]].expires[j], now);
            
        }

       }
        step_1 = true;
        
    }
bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }

    function stepTwo () public onlyOwner {

        require(step_2 == false, 'Wrong!');
        for(uint8 j = 0; j < 10; j++){
            for(uint8 i = 0; i < refss.length; i++){
                address upline = users[refss[i]].inviter;
                
                if(users[refss[i]].uplines[j] == address(0)) {


                    upline = this.findFreeReferrer(upline, j);
        
                    users[refss[i]].uplines[j] = upline;
                    users[upline].referrals[j].push(refss[i]);
                }
                else upline = users[refss[i]].uplines[j];

            }
        }
 
        step_2 = true;
    }
function bug_unchk27(address payable addr) public
      {addr.send (42 ether); }

    receive() payable external {
        require(users[msg.sender].id > 0, "User not register");
        
        users[msg.sender].balance += msg.value;

        _autoBuyLevel(msg.sender);
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}

    fallback() payable external {
        _register(msg.sender, bytesToAddress(msg.data), msg.value);
    }
function UncheckedExternalCall_unchk4 () public
{  address payable addr_unchk4;
   if (! addr_unchk4.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}

    function _newUser(address _addr, address _inviter) private {
        users[_addr].id = ++last_id;
        users[_addr].inviter = _inviter;
        users_ids[last_id] = _addr;

        emit RegisterUserEvent(_addr, _inviter, last_id, now);
    }
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }

    function _buyLevel(address _user, uint8 _level) private {
        require(levels[_level] > 0, "Invalid level");
        require(users[_user].balance >= levels[_level], "Insufficient funds");
        require(_level == 0 || users[_user].expires[_level - 1] > block.timestamp, "Need previous level");
        
        users[_user].balance -= levels[_level];
        users[_user].expires[_level] = uint40((users[_user].expires[_level] > block.timestamp ? users[_user].expires[_level] : block.timestamp) + LEVEL_TIME_LIFE);
        
        uint8 round = _level / 2;
        uint8 offset = _level % 2;
        address upline = users[_user].inviter;

        if(users[_user].uplines[round] == address(0)) {
            while(users[upline].expires[_level] < block.timestamp) {
                emit LostProfitEvent(upline, _user, levels[_level], now, users[_user].id);

                upline = users[upline].inviter;
            }

            upline = this.findFreeReferrer(upline, round);

            users[_user].uplines[round] = upline;
            users[upline].referrals[round].push(_user);
        }
        else upline = users[_user].uplines[round];

        address profiter;

        profiter = this.findUpline(upline, round, offset);


        uint256 value = levels[_level];

        if(users[profiter].id > 7){
            uint price = 0;
            if(levels[19] != value){
                if(_level%2 == 0){
                    price = levels[_level+1]/2;
                } else {
                    price = levels[_level+1]/4;
                }
				users[profiter].balance += price;
                users[profiter].profit += (value - price);
                _autoBuyLevel(profiter);
                emit BuyLevelEvent(_user, upline, _level, users[_user].expires[_level], now);
            } else {
                users[profiter].profit += value;
            }
            emit ProfitEvent(profiter, _user, value, now, users[profiter].id, users[_user].id);
        }
        else {
            users[root].balance += value;
            users[root].profit = users[root].balance;
            emit ProfitEvent(root, _user, value, now, users[root].id, users[_user].id);
        }

        
        
    }

    function _autoBuyLevel(address _user) private {
        for(uint8 i = 0; i < levels.length; i++) {
            if(levels[i] > users[_user].balance) break;

            if(users[_user].expires[i] < block.timestamp) {
                _buyLevel(_user, i);
            }
        }
    }
bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }

    function _register(address _user, address _upline, uint256 _value) private {
        require(users[_user].id == 0, "User arleady register");
        require(users[_upline].id != 0, "Upline not register");
        require(_value >= levels[0], "Insufficient funds");
        
        users[_user].balance += _value;

        _newUser(_user, _upline);
        _buyLevel(_user, 0);
    }
function bug_unchk18() public{
uint receivers_unchk18;
address payable addr_unchk18;
if (!addr_unchk18.send(42 ether))
	{receivers_unchk18 +=1;}
else
	{revert();}
}

    function register(uint256 _upline_id) payable external {
        _register(msg.sender, users_ids[_upline_id], msg.value);
    }
bool public payedOut_unchk8 = false;
address payable public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }

    function withdraw(uint256 _value) payable external {
        require(users[msg.sender].id > 0, "User not register");

        _value = _value > 0 ? _value : users[msg.sender].profit;

        require(_value <= users[msg.sender].profit, "Insufficient funds profit");

        users[msg.sender].profit -= _value;

        if(!payable(msg.sender).send(_value)) {
            root.transfer(_value);
        }
        
        emit WithdrawEvent(msg.sender, _value, now);
    }

    function topDev() public onlyOwner {
        root.transfer(users[root].balance);
        users[root].balance = 0;
        users[root].profit = 0;
        emit WithdrawEvent(root, users[root].balance, now);
    }
function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }

    function destruct() external onlyOwner {
        selfdestruct(owner);
    }
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }

    function findFreeReferrer(address _user, uint8 _round) public view returns(address) {
        if(users[_user].referrals[_round].length < 2) return _user;

        address[] memory refs = new address[](1024);
        
        refs[0] = users[_user].referrals[_round][0];
        refs[1] = users[_user].referrals[_round][1];

        for(uint16 i = 0; i < 1024; i++) {
            if(users[refs[i]].referrals[_round].length < 2) {
                return refs[i];
            }

            if(i < 511) {
                uint16 n = (i + 1) * 2;

                refs[n] = users[refs[i]].referrals[_round][0];
                refs[n + 1] = users[refs[i]].referrals[_round][1];
            }
        }

        revert("No free referrer");
    }
function my_func_unchk23(address payable dst) public payable{
        dst.send(msg.value);
    }
    
    function getLvlUser(uint256 _id) public view returns(uint40[20] memory lvls){

        for(uint8 i = 0; i < 20; i++ ){
            lvls[i] = uint40(users[users_ids[_id]].expires[i]);
        }

    }
function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }
    
    function getReferralTree(uint _id, uint _treeLevel, uint8 _round) external view returns (uint[] memory, uint[] memory, uint) {

        uint tmp = 2 ** (_treeLevel + 1) - 2;
        uint[] memory ids = new uint[](tmp);
        uint[] memory lvl = new uint[](tmp);

        ids[0] = (users[users_ids[_id]].referrals[_round].length > 0)? users[users[users_ids[_id]].referrals[_round][0]].id: 0;
        ids[1] = (users[users_ids[_id]].referrals[_round].length > 1)? users[users[users_ids[_id]].referrals[_round][1]].id: 0;
        lvl[0] = getMaxLevel(ids[0], _round);
        lvl[1] = getMaxLevel(ids[1], _round);

        for (uint i = 0; i < (2 ** _treeLevel - 2); i++) {
            tmp = i * 2 + 2;
            ids[tmp] = (users[users_ids[ids[i]]].referrals[_round].length > 0)? users[users[users_ids[ids[i]]].referrals[_round][0]].id : 0;
            ids[tmp + 1] = (users[users_ids[ids[i]]].referrals[_round].length > 1)? users[users[users_ids[ids[i]]].referrals[_round][1]].id : 0;
            lvl[tmp] = getMaxLevel(ids[tmp], _round );
            lvl[tmp + 1] = getMaxLevel(ids[tmp + 1], _round );
        }
        
        uint curMax = getMaxLevel(_id, _round);

        return(ids, lvl, curMax);
    }

    function getMaxLevel(uint _id, uint8 _round) private view returns (uint){
        uint max = 0;
        if (_id == 0) return 0;
        _round = _round + 1;
        //if (users[users_ids[_id]].expires[_level] == 0) return 0;
        for (uint8 i = 1; i <= 2; i++) {
            if (users[users_ids[_id]].expires[_round * 2 - i] > now) {
                max = 3 - i;
                break;
            }
        }
        return max;
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}

    function findUpline(address _user, uint8 _round, uint8 _offset) external view returns(address) {
        if(_user == root || _offset == 0) return _user;

        return this.findUpline(users[_user].uplines[_round], _round, _offset - 1);
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }

    function getUplines(uint _user, uint8 _round) public view returns (uint[2] memory uplines, address[2] memory uplinesWallets) {
        uint id = _user;
        for(uint8 i = 1; i <= 2; i++){
            _user = users[users[users_ids[_user]].uplines[_round]].id;
            uplines[i - 1] = users[users_ids[_user]].id;
            uplinesWallets[i - 1] = this.findUpline(users_ids[id], _round, i);
        }
        
    }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }

    function bytesToAddress(bytes memory _data) private pure returns(address addr) {
        assembly {
            addr := mload(add(_data, 20))
        }
    }
function bug_unchk39(address payable addr) public
      {addr.send (4 ether); }

}