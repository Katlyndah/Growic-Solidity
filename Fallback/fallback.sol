// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8 .0;

/*
Instructions
To ensure that our smart contract can receive ETH sent to it via 
transfers, we will create a fallback or receive payable function. 
The task is to create the fallback function and make sure when a user
transfers ETH to the smart contract, the transaction does not get reverted
*/

contract FallBack {
    //declare private varibale owner
    address payable private owner;

    //Custom error so only owner can call certain functions
    error onlyowner(address _user, address _owner);

    //Events to keep track of deposits and withdraws
    event fundsdeposited(address indexed _user, uint256 _amount);
    event fundswithdrawn(uint256 _amount);

    //Mapping to save balances and user addresses after deposits
    mapping(address => uint256) public balances;

    //Payable constructor
    constructor() {
        owner = payable(msg.sender);
    }

    //Fallback function to allow contract to receive Ether
    receive() external payable {}

    //modifier to ensure that only the owner of the contract can withdraw funds
    modifier onlyOwner() {
        if (msg.sender != owner) {
            revert onlyowner({_user: msg.sender, _owner: owner});
        }
        _;
    }

    //Function deposit to allow anyone to deposit funds into the contract
    function deposit() public payable {
        balances[msg.sender] += msg.value;
        emit fundsdeposited(msg.sender, msg.value);
    }

    //Function getbalance returns the balance of the contract
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    // Function so onlyowner can withdraw
    function withDraw(uint256 _amount) public onlyOwner {
        payable(msg.sender).transfer(_amount);
        emit fundswithdrawn(address(this).balance);
    }
}
