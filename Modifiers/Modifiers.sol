// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract Modifiers {
    
    /* Instructions
This task extends the functionality of the previous task. Create a deposit function that allows anybody to send funds. 
Store the user and the amount in a mapping as the previous task.

Add a withdraw function and create a modifier that only allows the owner of the contract to withdraw the funds.
Add an addFund function and create a modifier that only allows users that have balances using the deposit function, 
to increase their balance on the mapping. The function should accept the amount to be added and update the mapping to have the new balance
Hint: if their balance is zero on the mapping, it should revert

Hint: theMapping[userId] = theMapping[userId] + _amount;

Create a modifier that accepts a value(uint256 _amount):
Create a private constant variable called Fee
In the modifier check if the value(_amount) it accepts is less than the Fee, revert with a custom error AmountToSmall()
Add it to the addFund function
Hint: addFund(uint256 _amount).......... */

    //Custom Errors used
    error onlyOwner(address _user, address _owner); 
    error onlyDeposited(address _user);
    error AmountTooSmall(uint256 _available, uint256 _minAmount);
    error availableFunds(uint256 _available, uint256 _required);

    //Struct created to save user details
    struct User {
        string name;
        uint256 age;
        bool deposited;
    }

    //Declare private variable owner
    address private owner;

    //mapping to store the user and amount
    mapping(address => uint256) public balances;

    //mapping to store user details
    mapping(address => User) public userDetail;

    //Declare Private constant Fee
    uint256 private Fee;

    // Set the transaction sender as the owner of the contract.
    constructor(uint256 _fee) {
        owner = msg.sender;
        Fee = _fee;
    }

    //modifier to ensure that only the owner of the contract can withdraw funds
    modifier OnlyOwner() {
        if (msg.sender != owner) {
            revert onlyOwner({_user: msg.sender, _owner: owner});
        }
        _;
    }

    //modifier to ensure only users that have balances can add funds
    modifier OnlyDeposited() {
        if (userDetail[msg.sender].deposited != true) {
            revert onlyDeposited(msg.sender);
        }
        _;
    }

    //modifier to ensure that the funds are available
    modifier AvailableFunds(uint256 _amount) {
        if (balances[msg.sender] < _amount) {
            revert availableFunds({
                _available: balances[msg.sender],
                _required: _amount
            });
        }
        _;
    }

    //modifier to ensure that the amount in address is more than the fee
    //Transaction will revert if the amount is insufficient
    modifier AvailableFee(uint256 _amount) {
        if (_amount < Fee) {
            revert AmountTooSmall({
                _available: balances[msg.sender],
                _minAmount: Fee
            });
        }
        _;
    }

    //Function DepositFunds to allow anybody to send funds
    //Function stores details of users and amount in mapping
    function DepositFunds(uint256 _amount) public payable {
        require(_amount > 0, "Insuficient funds");
        balances[msg.sender] += _amount;
        userDetail[msg.sender].deposited = true;
    }

    //Function to get the balance of person calling the contract
    //Returns details stored in mapping
    function checkBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

    //Function to allow caller to set details such as name and age
    //Note: I deleted the array as it's not required and opted for this
    function setUserDetails(string memory _name, uint256 _age) public {
        userDetail[msg.sender].name = _name;
        userDetail[msg.sender].age = _age;
    }

    //Function to retrieve and return details saved for user calling the contract
    function getUserDetails(address _user)
        public
        view
        returns (User memory)
    {
        return userDetail[_user];
    }

    //Function withDraw to only allow the owner of the contract to withdraw funds
    //You can add multiple modifiers in a single function
    function withDraw(uint256 _amount) public OnlyOwner AvailableFunds(_amount) {
        balances[msg.sender] -= _amount;
    }

    //function addFund to allow users that have balances to add funds
    //Function also deducts the fee required for the transaction. 
    //Will revert if funds are insufficient
    function addFund(uint256 _amount) public payable OnlyDeposited AvailableFee(balances[msg.sender]){
        balances[msg.sender] -= Fee;
        balances[msg.sender] += _amount;
    }
}
