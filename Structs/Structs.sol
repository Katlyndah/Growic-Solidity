// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0 .0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";

contract KYC {
    using SafeMath for uint256;

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

    struct userDetails {
        string name;
        uint256 age;
    }

    userDetails[] public Details;

    function setUserDetails(string calldata _name, uint256 _age) public payable {
        Details.push(userDetails({name: _name, age: _age}));
    }

    function getUserDetails(uint256 _index)
        public
        view
        returns (string calldata name, uint256 age)
    {
        userDetails storage user = Details[_index];
        return (user.name, user.age);
    }
}
