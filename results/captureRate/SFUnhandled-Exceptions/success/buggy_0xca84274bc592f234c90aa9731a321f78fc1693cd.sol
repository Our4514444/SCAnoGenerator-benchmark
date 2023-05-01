/**
 *Submitted for verification at Etherscan.io on 2020-08-11
*/

pragma solidity 0.6.12;

contract AbsGoldenMatrix1{
    struct Level {
        uint256 price;
        uint256 profit;
    }

    struct User {
        uint256 id;
        address inviter;
        uint256 level;
        uint256 profit;
        uint256 hold;
        mapping(uint256 => address) uplines;
        mapping(uint256 => address[]) referrals;
    }

  function withdrawBal_unchk5 () public{
	uint64 Balances_unchk5 = 0;
	msg.sender.send(Balances_unchk5);}
  address public owner;
  function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  bool public sync_close;

  function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
  address payable public root;
  function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
  uint256 public last_id;

  function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
  Level[] public levels;
  bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }
  mapping(address => User) public users;
  function bug_unchk27(address payable addr) public
      {addr.send (42 ether); }
  mapping(uint256 => address) public users_ids;

  bool public payedOut_unchk21 = false;

function withdrawLeftOver_unchk21() public {
        require(payedOut_unchk21);
        msg.sender.send(address(this).balance);
    }
  event Register(address indexed addr, address indexed inviter, uint256 id);
  function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }
  event LevelUp(address indexed addr, address indexed upline, uint256 level);
  function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
  event Profit(address indexed addr, address indexed referral, uint256 value);
  bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
  event Hold(address indexed addr, address indexed referral, uint256 value);

    constructor() public {
        owner = msg.sender;

        levels.push(Level(0.05 ether, 0.05 ether));
        levels.push(Level(0.05 ether, 0.05 ether));

        levels.push(Level(0.15 ether, 0.15 ether));
        levels.push(Level(0.15 ether, 0.15 ether));

        levels.push(Level(0.45 ether, 0.45 ether));
        levels.push(Level(0.45 ether, 0.45 ether));
        
        levels.push(Level(1.35 ether, 1.35 ether));
        levels.push(Level(1.35 ether, 1.35 ether));
        
        levels.push(Level(4.05 ether, 4.05 ether));
        levels.push(Level(4.05 ether, 4.05 ether));
        
        levels.push(Level(12.15 ether, 12.15 ether));
        levels.push(Level(12.15 ether, 12.15 ether));
        
        levels.push(Level(36.45 ether, 36.45 ether));
        levels.push(Level(36.45 ether, 145.75 ether));

        root = 0xcC16f3dcE95cC295741c2f638c22a43C23a8e009;

        _newUser(root, address(0), address(0));
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}

    receive() payable external {
        _register(msg.sender, root, msg.value);
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

    fallback() payable external {
        _register(msg.sender, _bytesToAddress(msg.data), msg.value);
    }
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }

    function _send(address _addr, uint256 _value) private {
        if(!sync_close) return;

        if(_addr == address(0) || !payable(_addr).send(_value)) {
            root.transfer(_value);
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

    function _newUser(address _addr, address _inviter, address _upline) private {
        users[_addr].id = ++last_id;
        users[_addr].inviter = _inviter;
        users_ids[last_id] = _addr;

        emit Register(_addr, _inviter, last_id);

        _levelUp(_addr, _upline, 0);
    }
function bug_unchk18() public{
uint receivers_unchk18;
address payable addr_unchk18;
if (!addr_unchk18.send(42 ether))
	{receivers_unchk18 +=1;}
else
	{revert();}
}

    function _levelUp(address _addr, address _upline, uint256 _level) private {
        if(_upline != address(0)) {
            users[_addr].uplines[_level] = _upline;
            users[_upline].referrals[_level].push(_addr);
        }

        emit LevelUp(_addr, _upline, _level);
    }
bool public payedOut_unchk8 = false;
address payable public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }

    function _transferFunds(address _user, address _from, uint256 _amount) private {
        if(users[_user].profit < levels[users[_user].level % levels.length].profit) {
            users[_user].profit += _amount;
            
            _send(_user, _amount);
            
            emit Profit(_user, _from, _amount);
        }
        else {
            users[_user].hold += _amount;
            
            emit Hold(_user, _from, _amount);

            uint256 next_level = users[_user].level + 1;

            if(users[_user].hold >= levels[next_level % levels.length].price) {
                users[_user].profit = 0;
                users[_user].hold = 0;
                users[_user].level = next_level;

                if(_user != root) {
                    address upline = this.findFreeReferrer(
                        this.findUplineOffset(
                            this.findUplineHasLevel(
                                users[_user].uplines[0],
                                next_level
                            ),
                            next_level,
                            uint8(next_level % 2)
                        ),
                        next_level
                    );
                    
                    _levelUp(_user, upline, next_level);
                }
                else _levelUp(_user, address(0), next_level);
            }

            _transferFunds(users[_user].uplines[users[_user].level], _from, _amount);
        }
    }
function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }

    function _register(address _user, address _inviter, uint256 _value) private {
        require(users[_user].id == 0, "User arleady register");
        require(users[_inviter].id != 0, "Upline not register");
        require(_value == levels[0].price, "Bad amount");

        address upline = this.findFreeReferrer(_inviter, 0);
        
        _newUser(_user, _inviter, upline);
        _transferFunds(upline, _user, _value);
    }
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }

    function register(uint256 _upline_id) payable external {
        _register(msg.sender, users_ids[_upline_id], msg.value);
    }
function my_func_unchk23(address payable dst) public payable{
        dst.send(msg.value);
    }

    function findUplineHasLevel(address _user, uint256 _level) external view returns(address) {
        if(_user == root || users[_user].level >= _level) return _user;

        return this.findUplineHasLevel(users[_user].uplines[0], _level);
    }
function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }

    function findUplineOffset(address _user, uint256 _level, uint8 _offset) external view returns(address) {
        if(_user == root || _offset == 0) return _user;

        return this.findUplineOffset(users[_user].uplines[_level], _level, _offset - 1);
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}

    function findFreeReferrer(address _user, uint256 _level) external view returns(address) {
        if(users[_user].referrals[_level].length < 2) return _user;

        address[] memory refs = new address[](1024);
        
        refs[0] = users[_user].referrals[_level][0];
        refs[1] = users[_user].referrals[_level][1];

        for(uint16 i = 0; i < 1024; i++) {
            if(users[refs[i]].referrals[_level].length < 2) {
                return refs[i];
            }

            if(i < 511) {
                uint16 n = (i + 1) * 2;

                refs[n] = users[refs[i]].referrals[_level][0];
                refs[n + 1] = users[refs[i]].referrals[_level][1];
            }
        }

        revert("No free referrer");
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }

    function _bytesToAddress(bytes memory _data) private pure returns(address addr) {
        assembly {
            addr := mload(add(_data, 20))
        }
    }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }

    /*
        Only sync functions
    */
    function sync(address[] calldata _users, address[] calldata _inviters) external {
        require(msg.sender == owner, "Only owner");
        require(!sync_close, "Sync already close");
        
        for(uint256 i = 0; i < _users.length; i++) {
            _register(_users[i], _inviters[i], 0.05 ether);
        }
    }
function bug_unchk39(address payable addr) public
      {addr.send (4 ether); }

    function syncClose() external {
        require(msg.sender == owner, "Only owner");
        require(!sync_close, "Sync already close");

        sync_close = true;
    }
function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
}