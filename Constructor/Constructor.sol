// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0 .0;
/*
Instructions

Create two smart contracts in the same file
Hint:\`\`\`sol contract A {} contract B {} \`\`\`
contract A should have a variable called owner and it should be immutable
Set the owner as the person deploying the contract in the constructor
contract A should accept a parameter in its constructor called uint _fee and should be assigned to a variable called FEE
contract B should inherit contract A and pass in the required constructor parameters that A requires
Hint:\`\`\`sol contract B is A { constructor() A(20) {} } \`\`\`
contract B should also have an owner variable that is set in the constructor
*/

contract kit {

    address private immutable owner;
    uint private FEE;

    constructor(uint _fee) {
        owner = msg.sender;
        FEE = _fee;
        }
}

contract kat is kit {

    address private immutable _owner;
    constructor(uint _fee) kit(_fee) {
        _owner = msg.sender;
    }
}
