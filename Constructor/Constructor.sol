// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0 .0;

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
