// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
    REQUIREMENTS
    1. Your contract will have public variables that store the details about your coin (Token Name, Token Abbrv., Total supply
    2. Your contract will have a mapping of addresses to balances (address => uint)
    3. You will have a mint function that takes two parameters: an address and a value.
       The function then increases the total supply by that number and increases the balance
       of the "sender" address by that amount
    4. Your contract will have a burn function, which works the opposite of the mint function, as it will destroy tokens.
       It will take an address and value just like the mint functions. It will then deduct the value from the total supply 
       and from the balance of the "sender".
    5. Lastly, your burn function should have conditionals to make sure the balance of "sender" is greater than or equal to the amount that is supposed to be burned.
*/


contract MyToken {
    // Public variables to store token details
    string public name = "simple";
    string public symbol = "SIMP";
    uint public totalSupply = 0;

    // Mapping to store balances of addresses
    mapping(address => uint) public balances;

    // Mint function to create tokens
    function mint(address _address, uint _value) public {
        // Increase total supply by the specified amount
        totalSupply += _value;
        
        // Increase the balance of the specified address by the specified amount
        balances[_address] += _value;
    }

    // Burn function to destroy tokens
    function burn(address _address, uint _value) public {
        // Check if the address has enough tokens to burn
        require(balances[_address] >= _value, "Insufficient balance to burn");

        // Deduct the amount from the total supply
        totalSupply -= _value;

        // Deduct the amount from the balance of the specified address
        balances[_address] -= _value;
    }
}
