// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

/* Instructions
A simple use case for inheritance is to launch an ERC20 token using the OpenZepellin ERC20 implementation. Try to launch your 
custom ERC20 on any test network and then send me the address to the contract!*/

//Import from openzeppelin libraries
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

//Contract inheritance (is) *Can inherit from multiple contracts
contract KatToken is ERC20, ERC20Burnable, Pausable, Ownable {

    //Constructor to initialize token name and symbol
    constructor() ERC20("KatToken", "KTN") {
        _mint(msg.sender, 1000000 * 10**decimals());
    }

    //Function to enable us pause token supply
    function pause() public onlyOwner {
        _pause();
    }

    //Function to enable us unpause token supply
    function unpause() public onlyOwner {
        _unpause();
    }

    //Function mint to allow users to mint the token
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    //Hook
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal override whenNotPaused {
        super._beforeTokenTransfer(from, to, amount);
    }
}
