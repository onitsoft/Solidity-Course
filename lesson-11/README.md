# Lesson 11 - Inheritance and polymorphism

In classical object-oriented programming **inheritance** refers to a case where subclass uses the structure and behavior of a superclass.

**Polymorphism** refers to changing the behavior of a superclass in the subclass.

The same principles apply to inheritance and polymorphism when developing Ethereum smart contracts, and the general inheritance system is very similar to Python’s or Java's, especially concerning multiple inheritance.

When a contract inherits from multiple contracts, only a single contract is created on the blockchain, and the code from all the base contracts is copied into the created contract.

## Full example

```
pragma solidity ^0.4.18;

contract Owned {
    address owner;
    function Owned() {
        owner = msg.sender;
    }
}

// Use "is" to derive from another contract. Derived
// contracts can access all non-private members including
// internal functions and state variables. These cannot be
// accessed externally via `this`, though.
contract Mortal is Owned {
    function kill() {
        if (msg.sender == owner) selfdestruct(owner);
    }
}

// Car has all the functionality of mortal contract which
// in turns holds all functionality for the owner contract
contract Car {
    string make;
    
    function Car(string _make) {
        make = _make;
    }
    
    function getMake() public view returns(string) { return make; }
    function makeNoise() public pure returns(string) { return "VROOOOM!!!"; }
}

contract Thing {
    string color;
    uint cost;
    
    function Thing(string _color, uint _cost) {
        color = _color;
        cost = _cost;
    }
   
    function getColor() public view returns (string) { return color; }
    function getCost() public view returns (uint) { return cost; }
}

contract ToyotaCar is Mortal, Thing, Car {
    // Due to inheritance we inherit all the properties of Mortal, Thing and Car contracts
    function ToyotaCar(string _color, uint _cost) Thing(_color, _cost) Car("Toyota") {
        
    }
    
    function setColor(string _color) { color = _color; }
    
    // We can override Car methods via polymorphism
    function makeNoise() public pure returns(string) { return "HAROOOM!!!"; }
}
```

## Resources

- http://solidity.readthedocs.io/en/develop/contracts.html#inheritance