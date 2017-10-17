pragma solidity ^0.4.11;

contract Address {
    address me = 0xca35b7d915458ef540ade6068dfe2f44e8fa733c;

    function getBalance() public constant returns (uint256) {
        return me.balance;
    }
}