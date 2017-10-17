pragma solidity ^0.4.11;

contract Address {
    function getBalance(address _address) public constant returns (uint256) {
        return _address.balance;
    }
}