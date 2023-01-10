// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8 .0;

/*
In this task, we will re-write the deposit function from the ‘Mappings’ topic. 
We will allow users to send real ETH deposits to our smart contract by adding a payable function. 
Function deposit will be re-written to accept no arguments but receive real ETH deposits and still 
save and update user balance.

deposit() accepts ETH through the payable modifier and updates user balance accordingly
*/

contract TaskPayable {

    //Mapping balances created
    mapping(address => uint256) public balances;

    //Function deposit payable to accept no arguments
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    //Function to get the balance of person calling the contract
    function checkBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}
