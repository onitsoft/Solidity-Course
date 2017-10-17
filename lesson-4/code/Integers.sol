pragma solidity ^0.4.11;

contract Integers {    
    function getFoobar() public pure returns (int256 foobar) {
	    int256 foo = 42;
	    int256 bar = 50;
    	
        foobar = foo + bar;
        return foobar;
    }

    function getMaxUint() public pure returns (uint256 max) {
    	max = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    	return max;
    }
    
    function getMaxInt() public pure returns (int256 max) {
    	max = 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    	return max;
    }
}