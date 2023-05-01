pragma solidity ^0.5.3;

pragma solidity ^0.5.3;

/**
 * @title SafeMath
 * @dev Unsigned math operations with safety checks that revert on error
 */
library SafeMath {
    /**
     * @dev Multiplies two unsigned integers, reverts on overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

    /**
     * @dev Integer division of two unsigned integers truncating the quotient, reverts on division by zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Subtracts two unsigned integers, reverts on overflow (i.e. if subtrahend is greater than minuend).
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Adds two unsigned integers, reverts on overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

    /**
     * @dev Divides two unsigned integers and returns the remainder (unsigned integer modulo),
     * reverts when dividing by zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0);
        return a % b;
    }
}

/// @title Interface for contracts conforming to ERC-721: Non-Fungible Tokens
contract ERC721 {
    // Required methods
    function totalSupply() public view returns (uint256 total);
    function balanceOf(address _owner) public view returns (uint256 balance);
    function ownerOf(uint256 _tokenId) external view returns (address owner);
    function approve(address _to, uint256 _tokenId) external;
    function transfer(address _to, uint256 _tokenId) external;
    function transferFrom(address _from, address _to, uint256 _tokenId) external;

    // Events
  function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address from, address to, uint256 tokenId);
  function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address owner, address approved, uint256 tokenId);

    // Optional
    // function name() public view returns (string name);
    // function symbol() public view returns (string symbol);
    // function tokensOfOwner(address _owner) external view returns (uint256[] tokenIds);
    // function tokenMetadata(uint256 _tokenId, string _preferredTransport) public view returns (string infoUrl);

    // ERC-165 Compatibility (https://github.com/ethereum/EIPs/issues/165)
    function supportsInterface(bytes4 _interfaceID) external view returns (bool);
}

contract KittyCoreInterface is ERC721  {
    uint256 public autoBirthFee;
    address public saleAuction;
    address public siringAuction;
    function breedWithAuto(uint256 _matronId, uint256 _sireId) public payable;
    function createSaleAuction(uint256 _kittyId, uint256 _startingPrice, uint256 _endingPrice, uint256 _duration) external;
    function createSiringAuction(uint256 _kittyId, uint256 _startingPrice, uint256 _endingPrice, uint256 _duration) external;
    function supportsInterface(bytes4 _interfaceID) external view returns (bool);
}

contract AuctionInterface {
    function cancelAuction(uint256 _tokenId) external;
}

contract Ownable {
  address payable public owner;

function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
  event OwnershipTransferred(
    address indexed previousOwner,
    address indexed newOwner
  );

  constructor(address payable _owner) public {
    if(_owner == address(0)) {
      owner = msg.sender;
    } else {
      owner = _owner;
    }
  }

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  function transferOwnership(address payable _newOwner) public onlyOwner {
    _transferOwnership(_newOwner);
  }

  function _transferOwnership(address payable _newOwner) internal {
    require(_newOwner != address(0));
    emit OwnershipTransferred(owner, _newOwner);
    owner = _newOwner;
  }

  function destroy() public onlyOwner {
    selfdestruct(owner);
  }

  function destroyAndSend(address payable _recipient) public onlyOwner {
    selfdestruct(_recipient);
  }
}

contract Pausable is Ownable {
  function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
  event Pause();
  function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
  event Unpause();

    bool public paused = false;

    constructor(address payable _owner) Ownable(_owner) public {}

    modifier whenNotPaused() {
        require(!paused, "Contract paused");
        _;
    }

    modifier whenPaused() {
        require(paused, "Contract should be paused");
        _;
    }

    function pause() public onlyOwner whenNotPaused {
        paused = true;
        emit Pause();
    }

    function unpause() public onlyOwner whenPaused {
        paused = false;
        emit Unpause();
    }
}

contract CKProxy is Pausable {
  KittyCoreInterface public kittyCore;
  AuctionInterface public saleAuction;
  AuctionInterface public siringAuction;

constructor(address payable _owner, address _kittyCoreAddress) Pausable(_owner) public {
    require(_kittyCoreAddress != address(0));
    kittyCore = KittyCoreInterface(_kittyCoreAddress);
    require(kittyCore.supportsInterface(0x9a20483d));

    saleAuction = AuctionInterface(kittyCore.saleAuction());
    siringAuction = AuctionInterface(kittyCore.siringAuction());
  }

  /**
   * Owner can transfer kitty
   */
  function transferKitty(address _to, uint256 _kittyId) external onlyOwner {
    kittyCore.transfer(_to, _kittyId);
  }

  /**
   * Owner can transfer kitty
   */
  function transferKittyBulk(address _to, uint256[] calldata _kittyIds) external onlyOwner {
    for(uint256 i = 0; i < _kittyIds.length; i++) {
      kittyCore.transfer(_to, _kittyIds[i]);
    }
  }

  /**
   * Owner can transferFrom kitty
   */
  function transferKittyFrom(address _from, address _to, uint256 _kittyId) external onlyOwner {
    kittyCore.transferFrom(_from, _to, _kittyId);
  }
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}

  /**
   * Owner can approve kitty
   */
  function approveKitty(address _to, uint256 _kittyId) external  onlyOwner {
    kittyCore.approve(_to, _kittyId);
  }
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}

  /**
   * Owner can start sales auction for kitty owned by contract
   */
  function createSaleAuction(uint256 _kittyId, uint256 _startingPrice, uint256 _endingPrice, uint256 _duration) external onlyOwner {
    kittyCore.createSaleAuction(_kittyId, _startingPrice, _endingPrice, _duration);
  }
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}

  /**
   * Owner can cancel sales auction for kitty owned by contract
   */
  function cancelSaleAuction(uint256 _kittyId) external onlyOwner {
    saleAuction.cancelAuction(_kittyId);
  }
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}

  /**
   * Owner can start siring auction for kitty owned by contract
   */
  function createSiringAuction(uint256 _kittyId, uint256 _startingPrice, uint256 _endingPrice, uint256 _duration) external onlyOwner {
    kittyCore.createSiringAuction(_kittyId, _startingPrice, _endingPrice, _duration);
  }
function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}

  /**
   * Owner can cancel siring auction for kitty owned by contract
   */
  function cancelSiringAuction(uint256 _kittyId) external onlyOwner {
    siringAuction.cancelAuction(_kittyId);
  }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
}

 /**
 * @title SimpleBreeding
 * @dev Simple breeding contract allows dedicated breeder to breed kitties on behalf of owner, while owner retains control over funds and kitties.
 * Breeder gets reward per each successful breed. Breeder can breed when contract is not paused.
 * Owner should transfer kitties and funds to contact to breeding starts and withdraw afterwards.
 * Breeder can only breed kitties owned by contract and cannot transfer funds or kitties itself.
 */

contract SimpleBreeding is CKProxy {
  address payable public breeder;
  uint256 public breederReward;
  uint256 public originalBreederReward;
  uint256 public maxBreedingFee;

function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
  event Breed(address breeder, uint256 matronId, uint256 sireId, uint256 reward);
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
  event MaxBreedingFeeChange(uint256 oldBreedingFee, uint256 newBreedingFee);
function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
  event BreederRewardChange(uint256 oldBreederReward, uint256 newBreederReward);

  constructor(address payable _owner, address payable _breeder, address _kittyCoreAddress, uint256 _breederReward) CKProxy(_owner, _kittyCoreAddress) public {
    require(_breeder != address(0));
    breeder = _breeder;
    maxBreedingFee = kittyCore.autoBirthFee();
    breederReward = _breederReward;
    originalBreederReward = _breederReward;
  }
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}

  /**
   * Contract funds are used to cover breeding fees and pay callee
   */
  function () external payable {}
function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}

  /**
   * Owner can withdraw funds from contract
   */
  function withdraw(uint256 amount) external onlyOwner {
    owner.transfer(amount);
  }
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}

  /**
   * Owner can adjust breedering fee if needed
   */
  function setMaxBreedingFee(
    uint256 _maxBreedingFee
  ) external onlyOwner {
    emit MaxBreedingFeeChange(maxBreedingFee, _maxBreedingFee);
    maxBreedingFee = _maxBreedingFee;
  }
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}

   /**
   * Owner or breeder can change breeder's reward if needed.
   * Breeder can lower reward to make more attractive offer, it cannot set more than was originally agreed.
   * Owner can increase reward to motivate breeder to breed during high gas price, it cannot set less than was set by breeder.
   */
  function setBreederReward(
    uint256 _breederReward
  ) external {
    require(msg.sender == breeder || msg.sender == owner);
    
    if(msg.sender == owner) {
      require(_breederReward >= originalBreederReward || _breederReward > breederReward, 'Reward value is less than required');
    } else if(msg.sender == breeder) {
      require(_breederReward <= originalBreederReward, 'Reward value is more than original');
    }

    emit BreederRewardChange(breederReward, _breederReward);
    breederReward = _breederReward;
  }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}

  /**
   * Breeder can call this function to breed kitties on behalf of owner
   * Owner can breed as well
   */
  function breed(uint256 _matronId, uint256 _sireId) external whenNotPaused {
    require(msg.sender == breeder || msg.sender == owner);
    uint256 fee = kittyCore.autoBirthFee();
    require(fee <= maxBreedingFee);
    kittyCore.breedWithAuto.value(fee)(_matronId, _sireId);

    uint256 reward = 0;
    // breeder can reenter but that's OK, since breeder is payed per successful breed
    if(msg.sender == breeder) {
      reward = breederReward;
      breeder.transfer(reward);
    }

    emit Breed(msg.sender, _matronId, _sireId, reward);
  }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}

  function destroy() public onlyOwner {
    require(kittyCore.balanceOf(address(this)) == 0, 'Contract has tokens');
    selfdestruct(owner);
  }
function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}

  function destroyAndSend(address payable _recipient) public onlyOwner {
    require(kittyCore.balanceOf(address(this)) == 0, 'Contract has tokens');
    selfdestruct(_recipient);
  }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
}

contract SimpleBreedingFactory is Pausable {
    using SafeMath for uint256;

    KittyCoreInterface public kittyCore;
    uint256 public breederReward = 0.001 ether;
    uint256 public commission = 0 wei;
    uint256 public provisionFee;
    mapping (bytes32 => address) public breederToContract;

  function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  event ContractCreated(address contractAddress, address breeder, address owner);
  function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  event ContractRemoved(address contractAddress);

    constructor(address _kittyCoreAddress) Pausable(address(0)) public {
        provisionFee = commission + breederReward;
        kittyCore = KittyCoreInterface(_kittyCoreAddress);
        require(kittyCore.supportsInterface(0x9a20483d), "Invalid contract");
    }
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * Owner can adjust breeder reward
     * Factory contract does not use breeder reward directly, but sets it to Breeding contracts during contract creation
     * Existing contracts won't be affected by the change
     */
    function setBreederReward(uint256 _breederReward) external onlyOwner {
        require(_breederReward > 0, "Breeder reward must be greater than 0");
        breederReward = _breederReward;
        provisionFee = uint256(commission).add(breederReward);
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * Owner can set flat fee for contract creation
     */
    function setCommission(uint256 _commission) external onlyOwner {
        commission = _commission;
        provisionFee = uint256(commission).add(breederReward);
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * Just in case owner can change address of Kitty Core contract
     * Factory contract does not user Kitty Core directly, but sets it to Breeding contracts during contract creation
     * Existing contracts won't be affected by the change
     */
    function setKittyCore(address _kittyCore) external onlyOwner {
        kittyCore = KittyCoreInterface(_kittyCore);
        require(kittyCore.supportsInterface(0x9a20483d), "Invalid contract");
    }
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}

    function () external payable {
        revert("Do not send funds to contract");
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * Owner can withdraw funds from contracts, if any
     * Contract can only gets funds from contraction creation commission
     */
    function withdraw(uint256 amount) external onlyOwner {
        owner.transfer(amount);
    }
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}
    
    /**
     * Create new breeding contract for breeder. This function should be called by user during breeder enrollment process.
     * Message value should be greater than breeder reward + commission. Value excess wil be transfered to created contract.
     * Breeder reward amount is transfered to breeder's address so it can start sending transactions
     * Comission amount stays in the contract
     * When contract is created, provisioning script can get address its address from breederToContract mapping
     */
    function createContract(address payable _breederAddress) external payable whenNotPaused {
        require(msg.value >= provisionFee, "Invalid value");

        // owner's address and breeder's address should uniquely identify contract
        // also we need to avoid situation when existing contract address is overwritten by enrolling breeder by same owner twice,
        // or enrolling same breeder by different owner
        bytes32 key = keccak256(abi.encodePacked(_breederAddress, msg.sender));
        require(breederToContract[key] == address(0), "Breeder already enrolled");
        
        //transfer value excess to new contract, owner can widthdraw later or use it for breeding
        uint256 excess = uint256(msg.value).sub(provisionFee);
        SimpleBreeding newContract = new SimpleBreeding(msg.sender, _breederAddress, address(kittyCore), breederReward);
        breederToContract[key] = address(newContract);
        if(excess > 0) {
            address(newContract).transfer(excess);
        }

        //transfer 1st breeder reward to breeder
        _breederAddress.transfer(breederReward);

        emit ContractCreated(address(newContract), _breederAddress, msg.sender);
    }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * In most cases it does not make sense to delete contract's address. If needed it can be done by owner of factory contract.
     * This will not destroy breeding contract, just remove it address from the mapping, so user can deploy new contract for same breeder
     */
    function removeContract(address _breederAddress, address _ownerAddress) external onlyOwner {
        bytes32 key = keccak256(abi.encodePacked(_breederAddress, _ownerAddress));
        address contractAddress = breederToContract[key];
        require(contractAddress != address(0), "Breeder not enrolled");
        delete breederToContract[key];

        emit ContractRemoved(contractAddress);
    }
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}
}