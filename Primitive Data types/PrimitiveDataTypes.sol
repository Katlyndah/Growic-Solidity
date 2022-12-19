// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0 .0;

contract GrowicDataTypes {
    /*Instructions 
    Familiarize yourself with solidity data types, and provide example for 
    each of the solidity value types below, make sure you give at least 1 use 
    case you believe they can be used for:
    */

    //1. Solidity value types
    /*
    A value type stores its data directly in the memory it owns. 
    Variables of this type are duplicated whenever they appear in functions 
    or assignments. They always maintain an independent copy of any 
    duplicated variables and therefore, a change in the value of a duplicated 
    variable will not affect the original variable. Examples of value types in solidity
    include: Signed and unsigned integers, Booleans, Addresses and enums. 
    */

    //2. Signed integers
    /*
    A signed integer is a solidity value data type that can be used to store 
    either positive or negative values. This is declared with the int keyword. 

    int is an abbreviation for int256, which has a range of -2 ** 255 to 2 ** 255 - 1. This value type 
    takes up to 32B by default. We can make these Smaller by specifying the number of bits.
    For example: int8, int16, int32, etc.
    */

    //Here are examples of signed integers in Solidity:

    int256 a = -140; //this can also be represented as int256 a = -140;
    int256 b = 20;
    int256 public oranges; //I could also declare an int like this in Solidity.

    //3. Unsigned integers
    /*
    An unsigned integer is a solidity value data type that can be used to store 
    only positive values. This is declared with the uint keyword. 

    much like signed integers, a uint is an abbreviation for int256. which has a range of 0 to 2 ** 255 - 1. 
    This value type takes up to 32B by default. We can also make these Smaller by specifying the number of bits.
    For example: uint8, uint16, uint32, etc.
    */

    //Here are examples of unsigned integers in Solidity:

    uint256 percentage; //also represents uint256 percentage;
    uint256 public growic; //visibility modifier added.
    uint256 datatype;

    //4. Boolean
    /*
    A bool is a solidity value data type that is used in cases that have binary results. A bool has two 
    fixed values: true or false. This data type only takes up 1B of storage and the default value is false. 

    Solidity supports all standard Boolean operators, such as:
    ! (logical negation)
    != (inequality)
    == (equality)
    && (logical conjunction, “AND”)
    || (logical disjunction, “OR”)
    */

    //Here are examples of bools in Solidity:

    bool public isRegistered = false;
    bool public newUser = true;

    //5. Addresses
    /*An address is a solidity value type designed to hold up to 20B, or 160 bits, which is the size of an Ethereum address.
    Solidity has two address value types: address(which can be used to acquire balance, transfer or send balance) and 
    address payable (which allows an address to send and receive Ether) */

    //Here are examples of address in Solidity:

    address public myAddress = 0xb654d3f1b20884c80C0E63345cd804D6d8563416; //only stored values the size of Eth address

    function getBalance() private view returns (uint256) {
        return address(this).balance; //function returns the balance of the contract address
    }

    //6. Enums
    /*
    In solidity, Enums restrict a variable to have one of only a few predefined values. The values in this 
    enumerated list are called enums. For example, if we create an application for a hoodie store, we can restrict the sizes to Small, 
    Medium, and Large. This would make sure that users cannot order any size other than Small, Medium, or Large.

    Enums help reduce bugs in code. 
    */

    //Here is an example of enums in Solidity:

    enum hoodieSize {
        Small,
        Medium,
        Large
    }
    hoodieSize choice;
    hoodieSize constant defaultChoice = hoodieSize.Medium;

    function setLarge() public {
        choice = hoodieSize.Large; //allows to set size to large
    }

    function setSmall() public {
        choice = hoodieSize.Small; //allows to set size to small
    }

    function getChoice() public view returns (hoodieSize) {
        return choice; //allows users to select sizes
    }

    function getDefaultChoice() public pure returns (uint256) {
        return uint256(defaultChoice); //users will be given the default size which is Medium
    }

    //7. Bytes
    /*
    The bytes data type in Solidity is a dynamically sized byte[] array. These range from bytes1 to bytes32.
    The data type bytes1 represents one byte, while bytes32 represents 32B. The default value for byte is 0 x 00.
    */

    //Here are examples of bytes in Solidity:

    bytes1 c = 0x66; //in hexadecimal format
    bytes1 ee = 'd'; //as a character
}
