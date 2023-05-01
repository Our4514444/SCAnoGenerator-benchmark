pragma solidity 0.5.4;

/**
 * @title ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/20
 */
contract IERC20 {
    function transfer(address to, uint256 value) external returns (bool);
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}

    function approve(address spender, uint256 value) external returns (bool);
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}

    function transferFrom(address from, address to, uint256 value) external returns (bool);
function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}

    function totalSupply() external view returns (uint256);
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}

    function balanceOf(address who) external view returns (uint256);
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}

    function allowance(address owner, address spender) external view returns (uint256);
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}

    function claimEcoSystemReservePart1() public;
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

    function claimEcoSystemReservePart2() public;
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}

    function recoverToken(address _token) public;
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

    function claimTeamReserve() public;
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}

  function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed from, address indexed to, uint256 value);

  function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address indexed owner, address indexed spender, uint256 value);
}



/**
 * @title The Multisig contract contains functions to transfer ETH and LYMPO tokens.
 * @author Roman Holovay
 */
contract Multisig {
	struct WithdrawEtherStruct {
		address payable toAddr;
		uint amount;
		address[] confirmators;
		bool completed;
	}
	
	struct SendTokensStruct {
		address toAddr;
		uint amount;
		address[] confirmators;
		bool completed;
	}
	function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}

	IERC20 public token;
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}

	WithdrawEtherStruct[] public withdrawEther;function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}

	SendTokensStruct[] public sendTokens;
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}

	uint public confirmationCount;function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}

	mapping(address => bool) public owners;

	modifier onlyOwners { 
		require(owners[msg.sender]); 
		_; 
	}
	
	constructor(address _tokenAddress, address[] memory _addresses, uint _confirmationCount) public {
		require(_addresses.length >= _confirmationCount && _confirmationCount > 1);
		
		for (uint i = 0; i < _addresses.length; i++){
			owners[_addresses[i]] = true;
		}
		
		token = IERC20(_tokenAddress);

		confirmationCount = _confirmationCount;
	}
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}

	/**
     * @dev changeTokenAddress changing token address only when it is not set yet.
     * @param _tokenAddress New token address.
     */
	function changeTokenAddress(address _tokenAddress) public  {
		require (owners[msg.sender]);
		require (token == IERC20(address(0)));
		token = IERC20(_tokenAddress);
	}
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}
	
    
    /**
     * @dev createNewEtherWithdrawRequest creates a new ETH transfer request
     * @param _toAddr The addresses that will receive ETH.
     * @param _amount The number of ETH that can be received.
     */
	function createNewEtherWithdrawRequest(address payable _toAddr, uint _amount) public onlyOwners {
		address[] memory conf;
		withdrawEther.push(WithdrawEtherStruct(_toAddr, _amount, conf, false));
		withdrawEther[withdrawEther.length-1].confirmators.push(msg.sender);
	}
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
	
	/**
     * @dev approveEtherWithdrawRequest approve already created ETH transfer request.
     * This function can be used only by one of owners.
     * @param withdrawEtherId means position of withdrawEther array.
     */
	function approveEtherWithdrawRequest(uint withdrawEtherId) public onlyOwners {
	    require(!withdrawEther[withdrawEtherId].completed);
	    
	    for (uint i = 0; i < withdrawEther[withdrawEtherId].confirmators.length; i++) {
	        require (msg.sender != withdrawEther[withdrawEtherId].confirmators[i]);
	    }
	    
	    withdrawEther[withdrawEtherId].confirmators.push(msg.sender);
	    
	    if (withdrawEther[withdrawEtherId].confirmators.length >= confirmationCount) {
	        withdrawEther[withdrawEtherId].completed = true;
	        withdrawEther[withdrawEtherId].toAddr.transfer(withdrawEther[withdrawEtherId].amount);
	    }
	}
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
	
	/**
     * @dev createTransferTokensRequest creates a new Token transfer request
     * @param _toAddr The addresses that will receive tokens.
     * @param _amount The number of tokens that can be received.
     */
	function createTransferTokensRequest(address _toAddr, uint _amount) public onlyOwners {
	    address[] memory conf;
		sendTokens.push(SendTokensStruct(_toAddr, _amount, conf, false));
		sendTokens[sendTokens.length-1].confirmators.push(msg.sender);
	}
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
	
	/**
     * @dev approveEtherWithdrawRequest approve already created ETH transfer request.
     * This function can be used only by one of owners.
     * @param sendTokensId means position of sendTokens array.
     */
	function approveTransferTokensRequest(uint sendTokensId) public onlyOwners {
	    require(!sendTokens[sendTokensId].completed);
	    
	    for (uint i = 0; i < sendTokens[sendTokensId].confirmators.length; i++) {
	        require(msg.sender != sendTokens[sendTokensId].confirmators[i]);
	    }
	    
	    sendTokens[sendTokensId].confirmators.push(msg.sender);
	    
	    if (sendTokens[sendTokensId].confirmators.length >= confirmationCount) {
	       sendTokens[sendTokensId].completed = true;
	       token.transfer(sendTokens[sendTokensId].toAddr, sendTokens[sendTokensId].amount);
	    }
	}
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}

	function claimTeamReserve() public onlyOwners {
        token.claimTeamReserve();
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}

    function claimEcoSystemReservePart1() public onlyOwners {
    	token.claimEcoSystemReservePart1();
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}

    function claimEcoSystemReservePart2() public onlyOwners {
    	token.claimEcoSystemReservePart2();
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

    function recoverToken(address _token) public onlyOwners {
    	token.recoverToken(_token);
    }
function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
}