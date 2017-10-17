pragma solidity ^0.4.11;

contract Strings {
    string foo;
    
    function setString(string _foo) public {
	    foo = _foo;
    }

    function getString() public constant returns (string) {
    	return foo;
    }
}