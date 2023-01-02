// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract Modifiers {

    /* Instructions
This task extends the functionality of the previous task. Create a deposit function that allows anybody to send funds. 
Store the user and the amount in a mapping as the previous task.

Add a withdraw function and create a modifier that only allows the owner of the contract to withdraw the funds.
Add an addFund function and create a modifier that only allows users that have deposited using the deposit function, 
to increase their balance on the mapping. The function should accept the amount to be added and update the mapping to have the new balance
Hint: if their balance is zero on the mapping, it should revert

Hint: theMapping[userId] = theMapping[userId] + _amount;

Create a modifier that accepts a value(uint256 _amount):
Create a private constant variable called Fee
In the modifier check if the value(_amount) it accepts is less than the Fee, revert with a custom error AmountToSmall()
Add it to the addFund function
Hint: addFund(uint256 _amount).......... */


    //Declare public variable owner
    address private owner;

    //mapping to store the user and amount
    mapping(address => uint256) public deposited;

    //Struct created to save user details
    struct userDetails {
        string name;
        uint256 age;
    }

    //array to enable us push details to struct
    userDetails[] public Details;

    //Declare Private constant Fee
    uint256 private Fee; //Kept showing error without the value

    // Set the transaction sender as the owner of the contract.
    constructor(uint256 _fee) {
        owner = msg.sender;
        Fee = _fee;
    }

        //modifier to ensure that only the owner of the contract can withdraw funds
    modifier onlyOwner {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    //modifier to ensure only users that have deposited can add funds
    modifier userDeposited {
        require(deposited[msg.sender] > 0, "You did not deposit funds");
        _;
        
    }    

    //modifier to ensure that the amount in address is more than the fee
    modifier checkFee(uint256 _amount) {
        require(_amount < Fee, "Amount too small");
        _;
    }

    //Function DepositFunds to allow anybody to send funds
    function DepositFunds(uint256 _amount) public payable {
        require(_amount > 0, "Insuficient funds");
        deposited[msg.sender] += _amount;
    }

    //Function to get the balance of person calling the contract
    function checkBalance() public view returns (uint256) {
        return deposited[msg.sender];
    }

    //Function to allow caller to set details such as name and age
    function setUserDetails(string memory _name, uint256 _age) public payable {
        Details.push(userDetails({name: _name, age: _age}));
    }

    //Function to retrieve and return details saved for user calling the contract
    function getUserDetails()
        public
        view
        returns (string memory name, uint256 age)
    {
        userDetails storage user = Details[deposited[msg.sender]];
        return (user.name, user.age);
    }

    //Function withDraw to only allow the owner of the contract to withdraw funds
    function withDraw(uint256 _amount) public onlyOwner {
        deposited[msg.sender] -= _amount;
    }

    //function addFund to allow users that have deposited to add funds
    function addFund(uint256 _amount) public payable userDeposited {
        deposited[msg.sender] -= Fee;
        deposited[msg.sender] += _amount;
    }

}
