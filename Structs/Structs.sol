// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8 .0;

contract KYC {

    /*
    This task extends the functionality of the previous contract by allowing users to save 
    their additional info into the smart contract as a KYC measure.The contract should now 
    contain the following:
    setUserDetails(string calldata name, uint256 age) this function accepts 2 arguments 
    that represent the details of the user calling the smart contract and it saves them into a defined struct,
    getUserDetail() this function retrieves and returns the details saved for the user calling the contract.
    */

    //Mapping balances created
    mapping(address => uint256) public balances;

    //Function to allow deposits and save amount in mapping balances
    function deposit(uint256) public payable {
        balances[msg.sender] += msg.value;
    }

    //Function to get the balance of person calling the contract
    function checkBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

    //Struct created to save user details
    struct userDetails {
        string name;
        uint256 age;
    }

    //array to enable us push details to struct
    userDetails[] public Details;

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
        userDetails storage user = Details[balances[msg.sender]];
        return (user.name, user.age);
    }
}
