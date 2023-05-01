/**
 *Submitted for verification at Etherscan.io on 2020-11-05
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.10;

interface ERC20 {
    function balanceOf(address account) external returns (uint256);

    function transfer(address recipient, uint256 amount) external returns (bool);
}

// Adventure Awaits: find all 4 clues, solve the puzzle and claim the reward
// #0xPoland #0xPolandHeist
contract Puzzle {
  function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}
  uint256 constant BLOCKS_TO_WAIT = 10;

  function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
  bytes32 public hash;
  function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
  address public winner;
  function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => bytes32) public commits;
  function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => uint256) public commitBlock;

    constructor(bytes32 _hash) public payable {
        hash = _hash;
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}

    function commit(bytes32 _hash) public {
        commits[msg.sender] = _hash;
        commitBlock[msg.sender] = block.number;
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}

    function reveal(string memory _solution) public {
        bytes32 solutionHash = keccak256(abi.encodePacked(_solution));
        bytes32 solutionDoubleHash = keccak256(abi.encodePacked(solutionHash));
        bytes32 commitHash = keccak256(abi.encodePacked(msg.sender, solutionHash));
        require(winner == address(0), 'Already won');
        require(block.number > commitBlock[msg.sender] + BLOCKS_TO_WAIT, 'No front-running');
        require(solutionDoubleHash == hash, 'Invalid solution');
        require(commitHash == commits[msg.sender], 'Did not commit');
        winner = msg.sender;
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

    function withdraw() public {
        require(msg.sender == winner, 'Not a winner');
        msg.sender.transfer(address(this).balance);
    }
function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}

    function withdrawToken(ERC20 token) public {
        require(msg.sender == winner, 'Not a winner');
        token.transfer(msg.sender, token.balanceOf(address(this)));
    }
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}

    receive() external payable {}
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
}