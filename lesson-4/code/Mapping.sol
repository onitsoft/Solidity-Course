pragma solidity ^0.4.0;

contract Mapping {
    mapping(address => uint) balances;

    function update(uint newBalance) {
        balances[msg.sender] = newBalance;
    }
    
    function getBalance() public constant returns (uint balance) {
        return balances[msg.sender];
    }
}