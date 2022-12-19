// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0.0;

/*
Create a smart contract that saves user balance. The contract should have the functions:

deposit (uint256 amount) this function accepts one argument and it saves the amount a user 
is depositing into a mapping, checkBalance() this function searches for the user balance inside 
the balance mapping and returns the balance of whoever is calling the contract.
*/

//Old Habit >> Helps avoid overflow and underflow 
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";

contract saveBalance {

    using SafeMath for uint256;

    //Mapping balances created 
    mapping(address => uint256) public balances;

    //Function to allow deposits and save amount in mapping balances
    function deposit(uint256) public payable {
        balances[msg.sender] += msg.value;
    }

    //Function to get the balance of person calling the contract
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

}

