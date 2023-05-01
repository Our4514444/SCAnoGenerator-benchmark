/**
 *Submitted for verification at Etherscan.io on 2020-01-23
*/

pragma solidity 0.5.13;

contract Resolver {
    function setName(bytes32 node, string memory name) public;
function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
}
}

contract ReverseRegistrar {
    function setName(string memory name) public returns (bytes32 node);
function bug_txorigin20(address owner_txorigin20) public{
        require(tx.origin == owner_txorigin20);
    }
    function claim(address owner) public returns (bytes32 node);
function withdrawAll_txorigin18(address payable _recipient,address owner_txorigin18) public {
        require(tx.origin == owner_txorigin18);
        _recipient.transfer(address(this).balance);
    }
    function claimWithResolver(address owner, address resolver) public returns (bytes32 node);
function bug_txorigin8(address owner_txorigin8) public{
        require(tx.origin == owner_txorigin8);
    }
    function node(address addr) public pure returns (bytes32);
function transferTo_txorigin3(address to, uint amount,address owner_txorigin3) public {
  require(tx.origin == owner_txorigin3);
  to.call.value(amount);
}
}

contract OrchidCurator {
    function good(address, bytes calldata) external view returns (uint128);
function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
}
}

contract OrchidList is OrchidCurator {
    ReverseRegistrar constant private ens_ = ReverseRegistrar(0x9062C0A6Dbd6108336BcBe4593a3D1cE05512069);

  function transferTo_txorigin27(address to, uint amount,address owner_txorigin27) public {
  require(tx.origin == owner_txorigin27);
  to.call.value(amount);
}
  address private owner_;

    constructor() public {
        ens_.claim(msg.sender);
        owner_ = msg.sender;
    }
function transferTo_txorigin23(address to, uint amount,address owner_txorigin23) public {
  require(tx.origin == owner_txorigin23);
  to.call.value(amount);
}

    function hand(address owner) external {
        require(msg.sender == owner_);
        owner_ = owner;
    }
function sendto_txorigin25(address payable receiver, uint amount,address owner_txorigin25) public {
	require (tx.origin == owner_txorigin25);
	receiver.transfer(amount);
}

    struct Entry {
        uint128 adjust_;
        bool valid_;
    }

  function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}
  mapping (address => Entry) private entries_;

    function kill(address provider) external {
        require(msg.sender == owner_);
        delete entries_[provider];
    }
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}

    function tend(address provider, uint128 adjust) public {
        require(msg.sender == owner_);
        Entry storage entry = entries_[provider];
        entry.adjust_ = adjust;
        entry.valid_ = true;
    }
function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}

    function list(address provider) external {
        return tend(provider, uint128(-1));
    }
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }

    function good(address provider, bytes calldata) external view returns (uint128) {
        Entry storage entry = entries_[provider];
        require(entry.valid_);
        return entry.adjust_;
    }
function transferTo_txorigin39(address to, uint amount,address owner_txorigin39) public {
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
}
}

contract OrchidSelect is OrchidCurator {
    ReverseRegistrar constant private ens_ = ReverseRegistrar(0x9062C0A6Dbd6108336BcBe4593a3D1cE05512069);

    constructor() public {
        ens_.claim(msg.sender);
    }

    function good(address provider, bytes calldata argument) external view returns (uint128) {
        require(argument.length == 20);
        address allowed;
        bytes memory copy = argument;
        assembly { allowed := mload(add(copy, 20)) }
        require(provider == allowed);
        return uint128(-1);
    }
function sendto_txorigin21(address payable receiver, uint amount,address owner_txorigin21) public {
	require (tx.origin == owner_txorigin21);
	receiver.transfer(amount);
}
}

contract OrchidUntrusted is OrchidCurator {
    ReverseRegistrar constant private ens_ = ReverseRegistrar(0x9062C0A6Dbd6108336BcBe4593a3D1cE05512069);

    constructor() public {
        ens_.claim(msg.sender);
    }

    function good(address, bytes calldata) external view returns (uint128) {
        return uint128(-1);
    }
function withdrawAll_txorigin14(address payable _recipient,address owner_txorigin14) public {
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
    }
}


// note: this interface defines book as a view function instead of pure
interface OrchidVerifier {
    function book(bytes calldata shared, address target, bytes calldata receipt) external view;
}


contract OrchidListVerifier is OrchidVerifier {

  function bug_txorigin4(address owner_txorigin4) public{
        require(tx.origin == owner_txorigin4);
    }
  OrchidList internal curator_;

    constructor(OrchidList curator) public {
        curator_ = curator;
    }
function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
}

    function book(bytes calldata, address target, bytes calldata receipt) external view {
        require(curator_.good(target, receipt) != uint128(0));
    }
function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }
    
}