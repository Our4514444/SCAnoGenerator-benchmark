/**
 *Submitted for verification at Etherscan.io on 2020-10-04
*/

// File: contracts/zeppelin/SafeMath.sol

pragma solidity >= 0.5.0 < 0.7.0;

/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {
    /**
    * @dev Subtracts two numbers, reverts on overflow (i.e. if subtrahend is greater than minuend).
    */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

    /**
    * @dev Adds two numbers, reverts on overflow.
    */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

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
}

// File: contracts/MWGImplementation.sol

//SPDX-License-Identifier: MIT
pragma solidity >= 0.5.0 < 0.7.0;


contract MWGImplementation {
    /**
     * MATH
     */

    using SafeMath for uint256;

    /**
     * DATA
     */

    // INITIALIZATION DATA
    bool private initialized;

    // ERC20 BASIC DATA
    mapping(address => uint256) internal balances;
    uint256 internal totalSupply_;
    string public constant name = "Motiwala Gold"; // solium-disable-line
    string public constant symbol = "MWG"; // solium-disable-line uppercase
    uint8 public constant decimals = 18; // solium-disable-line uppercase

    // ERC20 DATA
    mapping(address => mapping(address => uint256)) internal allowed;

    // OWNER DATA
    address public owner;
    address public proposedOwner;

    // PAUSABILITY DATA
    bool public paused;

    // ASSET PROTECTION DATA
    address public assetProtectionRole;
    mapping(address => bool) internal frozen;

    // SUPPLY CONTROL DATA
    address public supplyController;

    // DELEGATED TRANSFER DATA
    address public betaDelegateWhitelister;
    mapping(address => bool) internal betaDelegateWhitelist;
    mapping(address => uint256) internal nextSeqs;
    // EIP191 header for EIP712 prefix
    string constant internal EIP191_HEADER = "\x19\x01";
    // Hash of the EIP712 Domain Separator Schema
    bytes32 constant internal EIP712_DOMAIN_SEPARATOR_SCHEMA_HASH = keccak256(
        "EIP712Domain(string name,address verifyingContract)"
    );
    bytes32 constant internal EIP712_DELEGATED_TRANSFER_SCHEMA_HASH = keccak256(
        "BetaDelegatedTransfer(address to,uint256 value,uint256 serviceFee,uint256 seq,uint256 deadline)"
    );
    // Hash of the EIP712 Domain Separator data
    // solhint-disable-next-line var-name-mixedcase
    bytes32 public EIP712_DOMAIN_HASH;

    // FEE CONTROLLER DATA
    // fee decimals is only set for informational purposes.
    // 1 feeRate = .000001 oz of gold
    uint8 public constant feeDecimals = 6;

    // feeRate is measured in 100th of a basis point (parts per 1,000,000)
    // ex: a fee rate of 200 = 0.02% of an oz of gold
    uint256 public constant feeParts = 1000000;
    uint256 public feeRate;
    address public feeController;
    address public feeRecipient;

    string public constant version = "1.0.0";

    /**
     * EVENTS
     */

    // ERC20 BASIC EVENTS
  function bug_intou36(uint8 p_intou36) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou36;   // overflow bug
}
  event Transfer(address indexed from, address indexed to, uint256 value);

    // ERC20 EVENTS
  mapping(address => uint) public lockTime_intou1;

function increaseLockTime_intou1(uint _secondsToIncrease) public {
        lockTime_intou1[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_ovrflow1() public {
        require(now > lockTime_intou1[msg.sender]);    
        uint transferValue_intou1 = 10;           
        msg.sender.transfer(transferValue_intou1);
    }
  event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );

    // OWNABLE EVENTS
  mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  //bug
    balances_intou30[msg.sender] -= _value;  //bug
    balances_intou30[_to] += _value;  //bug
    return true;
  }
  event OwnershipTransferProposed(
        address indexed currentOwner,
        address indexed proposedOwner
    );
  function bug_intou27() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  event OwnershipTransferDisregarded(
        address indexed oldProposedOwner
    );
  function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  event OwnershipTransferred(
        address indexed oldOwner,
        address indexed newOwner
    );

    // PAUSABLE EVENTS
  function bug_intou4(uint8 p_intou4) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou4;   // overflow bug
}
  event Pause();
  function bug_intou35() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  event Unpause();

    // ASSET PROTECTION EVENTS
  function bug_intou20(uint8 p_intou20) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou20;   // overflow bug
}
  event AddressFrozen(address indexed addr);
  mapping(address => uint) balances_intou18;

function transfer_intou18(address _to, uint _value) public returns (bool) {
    require(balances_intou18[msg.sender] - _value >= 0);  //bug
    balances_intou18[msg.sender] -= _value;  //bug
    balances_intou18[_to] += _value;  //bug
    return true;
  }
  event AddressUnfrozen(address indexed addr);
  function bug_intou8(uint8 p_intou8) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou8;   // overflow bug
}
  event FrozenAddressWiped(address indexed addr);
  function bug_intou3() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  event AssetProtectionRoleSet (
        address indexed oldAssetProtectionRole,
        address indexed newAssetProtectionRole
    );

    // SUPPLY CONTROL EVENTS
  mapping(address => uint) public lockTime_intou37;

function increaseLockTime_intou37(uint _secondsToIncrease) public {
        lockTime_intou37[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou37() public {
        require(now > lockTime_intou37[msg.sender]);    
        uint transferValue_intou37 = 10;           
        msg.sender.transfer(transferValue_intou37);
    }
  event SupplyIncreased(address indexed to, uint256 value);
  function bug_intou23() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  event SupplyDecreased(address indexed from, uint256 value);
  mapping(address => uint) public lockTime_intou25;

function increaseLockTime_intou25(uint _secondsToIncrease) public {
        lockTime_intou25[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou25() public {
        require(now > lockTime_intou25[msg.sender]);    
        uint transferValue_intou25 = 10;           
        msg.sender.transfer(transferValue_intou25);
    }
  event SupplyControllerSet(
        address indexed oldSupplyController,
        address indexed newSupplyController
    );

    // DELEGATED TRANSFER EVENTS
  function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  event BetaDelegatedTransfer(
        address indexed from, address indexed to, uint256 value, uint256 seq, uint256 serviceFee
    );
  mapping(address => uint) public lockTime_intou13;

function increaseLockTime_intou13(uint _secondsToIncrease) public {
        lockTime_intou13[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou13() public {
        require(now > lockTime_intou13[msg.sender]);    
        uint transferValue_intou13 = 10;           
        msg.sender.transfer(transferValue_intou13);
    }
  event BetaDelegateWhitelisterSet(
        address indexed oldWhitelister,
        address indexed newWhitelister
    );
  mapping(address => uint) balances_intou26;

function transfer_intou26(address _to, uint _value) public returns (bool) {
    require(balances_intou26[msg.sender] - _value >= 0);  //bug
    balances_intou26[msg.sender] -= _value;  //bug
    balances_intou26[_to] += _value;  //bug
    return true;
  }
  event BetaDelegateWhitelisted(address indexed newDelegate);
  function bug_intou39() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  event BetaDelegateUnwhitelisted(address indexed oldDelegate);

    // FEE CONTROLLER EVENTS
  mapping(address => uint) public lockTime_intou21;

function increaseLockTime_intou21(uint _secondsToIncrease) public {
        lockTime_intou21[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou21() public {
        require(now > lockTime_intou21[msg.sender]);    
        uint transferValue_intou21 = 10;           
        msg.sender.transfer(transferValue_intou21);
    }
  event FeeCollected(address indexed from, address indexed to, uint256 value);
  mapping(address => uint) balances_intou14;

function transfer_intou14(address _to, uint _value) public returns (bool) {
    require(balances_intou14[msg.sender] - _value >= 0);  //bug
    balances_intou14[msg.sender] -= _value;  //bug
    balances_intou14[_to] += _value;  //bug
    return true;
  }
  event FeeRateSet(
        uint256 indexed oldFeeRate,
        uint256 indexed newFeeRate
    );
  mapping(address => uint) balances_intou38;

function transfer_intou38(address _to, uint _value) public returns (bool) {
    require(balances_intou38[msg.sender] - _value >= 0);  //bug
    balances_intou38[msg.sender] -= _value;  //bug
    balances_intou38[_to] += _value;  //bug
    return true;
  }
  event FeeControllerSet(
        address indexed oldFeeController,
        address indexed newFeeController
    );
  function bug_intou32(uint8 p_intou32) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou32;   // overflow bug
}
  event FeeRecipientSet(
        address indexed oldFeeRecipient,
        address indexed newFeeRecipient
    );

    /**
     * FUNCTIONALITY
     */

    // INITIALIZATION FUNCTIONALITY

    /**
     * @dev sets 0 initial tokens, the owner, the supplyController,
     * the fee controller and fee recipient.
     * this serves as the constructor for the proxy but compiles to the
     * memory model of the Implementation contract.
     */
    function initialize() public {
        require(!initialized, "already initialized");
        owner = msg.sender;
        proposedOwner = address(0);
        assetProtectionRole = address(0);
        totalSupply_ = 0;
        supplyController = msg.sender;
        feeRate = 0;
        feeController = msg.sender;
        feeRecipient = msg.sender;
        initializeDomainSeparator();
        initialized = true;
    }

    /**
     * The constructor is used here to ensure that the implementation
     * contract is initialized. An uncontrolled implementation
     * contract might lead to misleading state
     * for users who accidentally interact with it.
     */
    // constructor() public {
    //     initialize();
    //     pause();
    // }

    /**
     * @dev To be called when upgrading the contract using upgradeAndCall to add delegated transfers
     */
    function initializeDomainSeparator() public {
        // hash the name context with the contract address
        EIP712_DOMAIN_HASH = keccak256(abi.encodePacked(// solium-disable-line
                EIP712_DOMAIN_SEPARATOR_SCHEMA_HASH, keccak256(bytes(name)), bytes32(uint256(address(this)))                ));
                // bytes32(address(this))

        // EIP712_DOMAIN_HASH = keccak256(abi.encodePacked(// solium-disable-line
        //         EIP712_DOMAIN_SEPARATOR_SCHEMA_HASH,
        //         keccak256(bytes(name)),
        //         bytes32(address(this))
        //     ));

    }

    // ERC20 BASIC FUNCTIONALITY

    /**
    * @dev Total number of tokens in existence
    */
    function totalSupply() public view returns (uint256) {
        return totalSupply_;
    }

    /**
    * @dev Transfer token to a specified address from msg.sender
    * Transfer additionally sends the fee to the fee controller
    * Note: the use of Safemath ensures that _value is nonnegative.
    * @param _to The address to transfer to.
    * @param _value The amount to be transferred.
    */
    function transfer(address _to, uint256 _value) public whenNotPaused returns (bool) {
        require(_to != address(0), "cannot transfer to address zero");
        require(!frozen[_to] && !frozen[msg.sender], "address frozen");
        require(_value <= balances[msg.sender], "insufficient funds");

        _transfer(msg.sender, _to, _value);
        return true;
    }

    /**
    * @dev Gets the balance of the specified address.
    * @param _addr The address to query the the balance of.
    * @return An uint256 representing the amount owned by the passed address.
    */
    function balanceOf(address _addr) public view returns (uint256) {
        return balances[_addr];
    }

    // ERC20 FUNCTIONALITY

    /**
     * @dev Transfer tokens from one address to another
     * @param _from address The address which you want to send tokens from
     * @param _to address The address which you want to transfer to
     * @param _value uint256 the amount of tokens to be transferred
     */
    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    )
    public
    whenNotPaused
    returns (bool)
    {
        require(_to != address(0), "cannot transfer to address zero");
        require(!frozen[_to] && !frozen[_from] && !frozen[msg.sender], "address frozen");
        require(_value <= balances[_from], "insufficient funds");
        require(_value <= allowed[_from][msg.sender], "insufficient allowance");

        allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
        _transfer(_from, _to, _value);

        return true;
    }

    /**
     * @dev Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
     * Beware that changing an allowance with this method brings the risk that someone may use both the old
     * and the new allowance by unfortunate transaction ordering. One possible solution to mitigate this
     * race condition is to first reduce the spender's allowance to 0 and set the desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     * @param _spender The address which will spend the funds.
     * @param _value The amount of tokens to be spent.
     */
    function approve(address _spender, uint256 _value) public whenNotPaused returns (bool) {
        require(!frozen[_spender] && !frozen[msg.sender], "address frozen");
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    /**
     * @dev Function to check the amount of tokens that an owner allowed to a spender.
     * @param _owner address The address which owns the funds.
     * @param _spender address The address which will spend the funds.
     * @return A uint256 specifying the amount of tokens still available for the spender.
     */
    function allowance(
        address _owner,
        address _spender
    )
    public
    view
    returns (uint256)
    {
        return allowed[_owner][_spender];
    }

    function _transfer(address _from, address _to, uint256 _value) internal returns (uint256) {
        uint256 _fee = getFeeFor(_value);
        uint256 _principle = _value.sub(_fee);
        balances[_from] = balances[_from].sub(_value);
        balances[_to] = balances[_to].add(_principle);
        emit Transfer(_from, _to, _principle);
        emit Transfer(_from, feeRecipient, _fee);
        if (_fee > 0) {
            balances[feeRecipient] = balances[feeRecipient].add(_fee);
            emit FeeCollected(_from, feeRecipient, _fee);
        }

        return _principle;
    }

    // OWNER FUNCTIONALITY

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(msg.sender == owner, "onlyOwner");
        _;
    }

    /**
     * @dev Allows the current owner to begin transferring control of the contract to a proposedOwner
     * @param _proposedOwner The address to transfer ownership to.
     */
    function proposeOwner(address _proposedOwner) public onlyOwner {
        require(_proposedOwner != address(0), "cannot transfer ownership to address zero");
        require(msg.sender != _proposedOwner, "caller already is owner");
        proposedOwner = _proposedOwner;
        emit OwnershipTransferProposed(owner, proposedOwner);
    }

    /**
     * @dev Allows the current owner or proposed owner to cancel transferring control of the contract to a proposedOwner
     */
    function disregardProposeOwner() public {
        require(msg.sender == proposedOwner || msg.sender == owner, "only proposedOwner or owner");
        require(proposedOwner != address(0), "can only disregard a proposed owner that was previously set");
        address _oldProposedOwner = proposedOwner;
        proposedOwner = address(0);
        emit OwnershipTransferDisregarded(_oldProposedOwner);
    }

    /**
     * @dev Allows the proposed owner to complete transferring control of the contract to the proposedOwner.
     */
    function claimOwnership() public {
        require(msg.sender == proposedOwner, "onlyProposedOwner");
        address _oldOwner = owner;
        owner = proposedOwner;
        proposedOwner = address(0);
        emit OwnershipTransferred(_oldOwner, owner);
    }

    /**
     * @dev Reclaim all MTW at the contract address.
     * This sends the MTW tokens that this contract add holding to the owner.
     * Note: this is not affected by freeze constraints.
     */
    function reclaimMTW() external onlyOwner {
        uint256 _balance = balances[address(this)];
        balances[address(this)] = 0;
        balances[owner] = balances[owner].add(_balance);
        emit Transfer(address(this), owner, _balance);
    }

    // PAUSABILITY FUNCTIONALITY

    /**
     * @dev Modifier to make a function callable only when the contract is not paused.
     */
    modifier whenNotPaused() {
        require(!paused, "whenNotPaused");
        _;
    }

    /**
     * @dev called by the owner to pause, triggers stopped state
     */
    function pause() public onlyOwner {
        require(!paused, "already paused");
        paused = true;
        emit Pause();
    }

    /**
     * @dev called by the owner to unpause, returns to normal state
     */
    function unpause() public onlyOwner {
        require(paused, "already unpaused");
        paused = false;
        emit Unpause();
    }

    // ASSET PROTECTION FUNCTIONALITY

    /**
     * @dev Sets a new asset protection role address.
     * @param _newAssetProtectionRole The new address allowed to freeze/unfreeze addresses and seize their tokens.
     */
    function setAssetProtectionRole(address _newAssetProtectionRole) public {
        require(msg.sender == assetProtectionRole || msg.sender == owner, "only assetProtectionRole or Owner");
        emit AssetProtectionRoleSet(assetProtectionRole, _newAssetProtectionRole);
        assetProtectionRole = _newAssetProtectionRole;
    }

    modifier onlyAssetProtectionRole() {
        require(msg.sender == assetProtectionRole, "onlyAssetProtectionRole");
        _;
    }

    /**
     * @dev Freezes an address balance from being transferred.
     * @param _addr The new address to freeze.
     */
    function freeze(address _addr) public onlyAssetProtectionRole {
        require(!frozen[_addr], "address already frozen");
        frozen[_addr] = true;
        emit AddressFrozen(_addr);
    }

    /**
     * @dev Unfreezes an address balance allowing transfer.
     * @param _addr The new address to unfreeze.
     */
    function unfreeze(address _addr) public onlyAssetProtectionRole {
        require(frozen[_addr], "address already unfrozen");
        frozen[_addr] = false;
        emit AddressUnfrozen(_addr);
    }
mapping(address => uint) public lockTime_intou9;

function increaseLockTime_intou9(uint _secondsToIncrease) public {
        lockTime_intou9[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou9() public {
        require(now > lockTime_intou9[msg.sender]);    
        uint transferValue_intou9 = 10;           
        msg.sender.transfer(transferValue_intou9);
    }

    /**
     * @dev Wipes the balance of a frozen address, burning the tokens
     * and setting the approval to zero.
     * @param _addr The new frozen address to wipe.
     */
    function wipeFrozenAddress(address _addr) public onlyAssetProtectionRole {
        require(frozen[_addr], "address is not frozen");
        uint256 _balance = balances[_addr];
        balances[_addr] = 0;
        totalSupply_ = totalSupply_.sub(_balance);
        emit FrozenAddressWiped(_addr);
        emit SupplyDecreased(_addr, _balance);
        emit Transfer(_addr, address(0), _balance);
    }
function bug_intou16(uint8 p_intou16) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou16;   // overflow bug
}

    /**
    * @dev Gets whether the address is currently frozen.
    * @param _addr The address to check if frozen.
    * @return A bool representing whether the given address is frozen.
    */
    function isFrozen(address _addr) public view returns (bool) {
        return frozen[_addr];
    }
function bug_intou40(uint8 p_intou40) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou40;   // overflow bug
}

    // SUPPLY CONTROL FUNCTIONALITY

    /**
     * @dev Sets a new supply controller address.
     * @param _newSupplyController The address allowed to burn/mint tokens to control supply.
     */
    function setSupplyController(address _newSupplyController) public {
        require(msg.sender == supplyController || msg.sender == owner, "only SupplyController or Owner");
        require(_newSupplyController != address(0), "cannot set supply controller to address zero");
        emit SupplyControllerSet(supplyController, _newSupplyController);
        supplyController = _newSupplyController;
    }
mapping(address => uint) public lockTime_intou29;

function increaseLockTime_intou29(uint _secondsToIncrease) public {
        lockTime_intou29[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou29() public {
        require(now > lockTime_intou29[msg.sender]);    
        uint transferValue_intou29 = 10;           
        msg.sender.transfer(transferValue_intou29);
    }

    modifier onlySupplyController() {
        require(msg.sender == supplyController, "onlySupplyController");
        _;
    }

    /**
     * @dev Increases the total supply by minting the specified number of tokens to the supply controller account.
     * @param _value The number of tokens to add.
     * @return A boolean that indicates if the operation was successful.
     */
    function increaseSupply(uint256 _value) public onlySupplyController returns (bool success) {
        totalSupply_ = totalSupply_.add(_value);
        balances[supplyController] = balances[supplyController].add(_value);
        emit SupplyIncreased(supplyController, _value);
        emit Transfer(address(0), supplyController, _value);
        return true;
    }
mapping(address => uint) public lockTime_intou33;

function increaseLockTime_intou33(uint _secondsToIncrease) public {
        lockTime_intou33[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou33() public {
        require(now > lockTime_intou33[msg.sender]);    
        uint transferValue_intou33 = 10;           
        msg.sender.transfer(transferValue_intou33);
    }

    /**
     * @dev Decreases the total supply by burning the specified number of tokens from the supply controller account.
     * @param _value The number of tokens to remove.
     * @return A boolean that indicates if the operation was successful.
     */
    function decreaseSupply(uint256 _value) public onlySupplyController returns (bool success) {
        require(_value <= balances[supplyController], "not enough supply");
        balances[supplyController] = balances[supplyController].sub(_value);
        totalSupply_ = totalSupply_.sub(_value);
        emit SupplyDecreased(supplyController, _value);
        emit Transfer(supplyController, address(0), _value);
        return true;
    }
function bug_intou12(uint8 p_intou12) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou12;   // overflow bug
}

    // DELEGATED TRANSFER FUNCTIONALITY

    /**
     * @dev returns the next seq for a target address.
     * The transactor must submit nextSeqOf(transactor) in the next transaction for it to be valid.
     * Note: that the seq context is specific to this smart contract.
     * @param target The target address.
     * @return the seq.
     */
    //
    function nextSeqOf(address target) public view returns (uint256) {
        return nextSeqs[target];
    }
mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
    }

    /**
     * @dev Performs a transfer on behalf of the from address, identified by its signature on the delegatedTransfer msg.
     * Splits a signature byte array into r,s,v for convenience.
     * @param sig the signature of the delgatedTransfer msg.
     * @param to The address to transfer to.
     * @param value The amount to be transferred.
     * @param serviceFee an optional ERC20 service fee paid to the executor of betaDelegatedTransfer by the from address.
     * @param seq a sequencing number included by the from address specific to this contract to protect from replays.
     * @param deadline a block number after which the pre-signed transaction has expired.
     * @return A boolean that indicates if the operation was successful.
     */
    function betaDelegatedTransfer(
        bytes memory sig, address to, uint256 value, uint256 serviceFee, uint256 seq, uint256 deadline
    ) public returns (bool) {
        require(sig.length == 65, "signature should have length 65");
        bytes32 r;
        bytes32 s;
        uint8 v;
        assembly {
            r := mload(add(sig, 32))
            s := mload(add(sig, 64))
            v := byte(0, mload(add(sig, 96)))
        }
        require(_betaDelegatedTransfer(r, s, v, to, value, serviceFee, seq, deadline), "failed transfer");
        return true;
    }
function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    /**
     * @dev Performs a transfer on behalf of the from address, identified by its signature on the betaDelegatedTransfer msg.
     * Note: both the delegate and transactor sign in the service fees. The transactor, however,
     * has no control over the gas price, and therefore no control over the transaction time.
     * Beta prefix chosen to avoid a name clash with an emerging standard in ERC865 or elsewhere.
     * Internal to the contract - see betaDelegatedTransfer and betaDelegatedTransferBatch.
     * @param r the r signature of the delgatedTransfer msg.
     * @param s the s signature of the delgatedTransfer msg.
     * @param v the v signature of the delgatedTransfer msg.
     * @param to The address to transfer to.
     * @param value The amount to be transferred.
     * @param serviceFee an optional ERC20 service fee paid to the delegate of betaDelegatedTransfer by the from address.
     * @param seq a sequencing number included by the from address specific to this contract to protect from replays.
     * @param deadline a block number after which the pre-signed transaction has expired.
     * @return A boolean that indicates if the operation was successful.
     */
    function _betaDelegatedTransfer(
        bytes32 r, bytes32 s, uint8 v, address to, uint256 value, uint256 serviceFee, uint256 seq, uint256 deadline
    ) internal whenNotPaused returns (bool) {
        require(betaDelegateWhitelist[msg.sender], "Beta feature only accepts whitelisted delegates");
        require(value > 0 || serviceFee > 0, "cannot transfer zero tokens with zero service fee");
        require(block.number <= deadline, "transaction expired");
        // prevent sig malleability from ecrecover()
        require(uint256(s) <= 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D576E7357A4501DDFE92F46681B20A0, "signature incorrect");
        require(v == 27 || v == 28, "signature incorrect");

        // EIP712 scheme: https://github.com/ethereum/EIPs/blob/master/EIPS/eip-712.md
        bytes32 hash = keccak256(abi.encodePacked(
            EIP191_HEADER, EIP712_DOMAIN_HASH, keccak256(abi.encodePacked(// solium-disable-line
              EIP712_DELEGATED_TRANSFER_SCHEMA_HASH, bytes32(uint256(to)), value, serviceFee, seq, deadline))));
        address _from = ecrecover(hash, v, r, s);

        require(_from != address(0), "error determining from address from signature");
        require(to != address(0), "cannot use address zero");
        require(!frozen[to] && !frozen[_from] && !frozen[msg.sender], "address frozen");
        require(value.add(serviceFee) <= balances[_from], "insufficient funds or bad signature");
        require(nextSeqs[_from] == seq, "incorrect seq");

        nextSeqs[_from] = nextSeqs[_from].add(1);

        uint256 _principle = _transfer(_from, to, value);

        if (serviceFee != 0) {
            balances[_from] = balances[_from].sub(serviceFee);
            balances[msg.sender] = balances[msg.sender].add(serviceFee);
            emit Transfer(_from, msg.sender, serviceFee);
        }

        emit BetaDelegatedTransfer(_from, to, _principle, seq, serviceFee);
        return true;
    }
function bug_intou15() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    /**
     * @dev Performs an atomic batch of transfers on behalf of the from addresses, identified by their signatures.
     * Lack of nested array support in arguments requires all arguments to be passed as equal size arrays where
     * delegated transfer number i is the combination of all arguments at index i
     * @param r the r signatures of the delgatedTransfer msg.
     * @param s the s signatures of the delgatedTransfer msg.
     * @param v the v signatures of the delgatedTransfer msg.
     * @param to The addresses to transfer to.
     * @param value The amounts to be transferred.
     * @param serviceFee optional ERC20 service fees paid to the delegate of betaDelegatedTransfer by the from address.
     * @param seq sequencing numbers included by the from address specific to this contract to protect from replays.
     * @param deadline block numbers after which the pre-signed transactions have expired.
     * @return A boolean that indicates if the operation was successful.
     */
    function betaDelegatedTransferBatch(
        bytes32[] memory r, 
        bytes32[] memory s, 
        uint8[] memory v, 
        address[] memory to, 
        uint256[] memory value, 
        uint256[] memory serviceFee, 
        uint256[] memory seq, 
        uint256[] memory deadline
    ) public returns (bool) {
        require(r.length == s.length && r.length == v.length && r.length == to.length && r.length == value.length, "length mismatch");
        require(r.length == serviceFee.length && r.length == seq.length && r.length == deadline.length, "length mismatch");

        for (uint i = 0; i < r.length; i++) {
            require(
                _betaDelegatedTransfer(r[i], s[i], v[i], to[i], value[i], serviceFee[i], seq[i], deadline[i]),
                "failed transfer"
            );
        }
        return true;
    }
mapping(address => uint) balances_intou6;

function transfer_intou62(address _to, uint _value) public returns (bool) {
    require(balances_intou6[msg.sender] - _value >= 0);  //bug
    balances_intou6[msg.sender] -= _value;  //bug
    balances_intou6[_to] += _value;  //bug
    return true;
  }

    /**
    * @dev Gets whether the address is currently whitelisted for betaDelegateTransfer.
    * @param _addr The address to check if whitelisted.
    * @return A bool representing whether the given address is whitelisted.
    */
    function isWhitelistedBetaDelegate(address _addr) public view returns (bool) {
        return betaDelegateWhitelist[_addr];
    }
mapping(address => uint) balances_intou2;

function transfer_undrflow2(address _to, uint _value) public returns (bool) {
    require(balances_intou2[msg.sender] - _value >= 0);  //bug
    balances_intou2[msg.sender] -= _value;  //bug
    balances_intou2[_to] += _value;  //bug
    return true;
  }

    /**
     * @dev Sets a new betaDelegate whitelister.
     * @param _newWhitelister The address allowed to whitelist betaDelegates.
     */
    function setBetaDelegateWhitelister(address _newWhitelister) public {
        require(msg.sender == betaDelegateWhitelister || msg.sender == owner, "only Whitelister or Owner");
        betaDelegateWhitelister = _newWhitelister;
        emit BetaDelegateWhitelisterSet(betaDelegateWhitelister, _newWhitelister);
    }
function bug_intou28(uint8 p_intou28) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou28;   // overflow bug
}

    modifier onlyBetaDelegateWhitelister() {
        require(msg.sender == betaDelegateWhitelister, "onlyBetaDelegateWhitelister");
        _;
    }

    /**
     * @dev Whitelists an address to allow calling BetaDelegatedTransfer.
     * @param _addr The new address to whitelist.
     */
    function whitelistBetaDelegate(address _addr) public onlyBetaDelegateWhitelister {
        require(!betaDelegateWhitelist[_addr], "delegate already whitelisted");
        betaDelegateWhitelist[_addr] = true;
        emit BetaDelegateWhitelisted(_addr);
    }
function bug_intou31() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    /**
     * @dev Unwhitelists an address to disallow calling BetaDelegatedTransfer.
     * @param _addr The new address to whitelist.
     */
    function unwhitelistBetaDelegate(address _addr) public onlyBetaDelegateWhitelister {
        require(betaDelegateWhitelist[_addr], "delegate not whitelisted");
        betaDelegateWhitelist[_addr] = false;
        emit BetaDelegateUnwhitelisted(_addr);
    }
function bug_intou24(uint8 p_intou24) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou24;   // overflow bug
}

    // FEE CONTROLLER FUNCTIONALITY

    /**
     * @dev Sets a new fee controller address.
     * @param _newFeeController The address allowed to set the fee rate and the fee recipient.
     */
    function setFeeController(address _newFeeController) public {
        require(msg.sender == feeController || msg.sender == owner, "only FeeController or Owner");
        require(_newFeeController != address(0), "cannot set fee controller to address zero");
        address _oldFeeController = feeController;
        feeController = _newFeeController;
        emit FeeControllerSet(_oldFeeController, feeController);
    }
mapping(address => uint) balances_intou22;

function transfer_intou22(address _to, uint _value) public returns (bool) {
    require(balances_intou22[msg.sender] - _value >= 0);  //bug
    balances_intou22[msg.sender] -= _value;  //bug
    balances_intou22[_to] += _value;  //bug
    return true;
  }

    modifier onlyFeeController() {
        require(msg.sender == feeController, "only FeeController");
        _;
    }

    /**
     * @dev Sets a new fee recipient address.
     * @param _newFeeRecipient The address allowed to collect transfer fees for transfers.
     */
    function setFeeRecipient(address _newFeeRecipient) public onlyFeeController {
        require(_newFeeRecipient != address(0), "cannot set fee recipient to address zero");
        address _oldFeeRecipient = feeRecipient;
        feeRecipient = _newFeeRecipient;
        emit FeeRecipientSet(_oldFeeRecipient, feeRecipient);
    }
mapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  //bug
    balances_intou10[msg.sender] -= _value;  //bug
    balances_intou10[_to] += _value;  //bug
    return true;
  }

    /**
     * @dev Sets a new fee rate.
     * @param _newFeeRate The new fee rate to collect as transfer fees for transfers.
     */
    function setFeeRate(uint256 _newFeeRate) public onlyFeeController {
        require(_newFeeRate <= feeParts, "cannot set fee rate above 100%");
        uint256 _oldFeeRate = feeRate;
        feeRate = _newFeeRate;
        emit FeeRateSet(_oldFeeRate, feeRate);
    }
mapping(address => uint) balances_intou34;

function transfer_intou34(address _to, uint _value) public returns (bool) {
    require(balances_intou34[msg.sender] - _value >= 0);  //bug
    balances_intou34[msg.sender] -= _value;  //bug
    balances_intou34[_to] += _value;  //bug
    return true;
  }

    /**
    * @dev Gets a fee for a given value
    * ex: given feeRate = 200 and feeParts = 1,000,000 then getFeeFor(10000) = 2
    * @param _value The amount to get the fee for.
    */
    function getFeeFor(uint256 _value) public view returns (uint256) {
        if (feeRate == 0) {
            return 0;
        }

        return _value.mul(feeRate).div(feeParts);
    }
mapping(address => uint) public lockTime_intou5;

function increaseLockTime_intou5(uint _secondsToIncrease) public {
        lockTime_intou5[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou5() public {
        require(now > lockTime_intou5[msg.sender]);    
        uint transferValue_intou5 = 10;           
        msg.sender.transfer(transferValue_intou5);
    }
}