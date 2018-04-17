pragma solidity ^0.4.19;

import "./StandardToken.sol";

contract KarmaToken is StandardToken {
    string public name = "KarmaToken";
    string public symbol = "KRM";
    uint public decimals = 18;
}