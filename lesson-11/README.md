# Lesson 11 - Inheritance and polymorphism

In classical object-oriented programming *inheritance* refers to a case where a class inherits fields and methods from its parent class. A subclass can override methods that it inherits. In short, it uses the structure and behavior of a superclass in a subclass.

*Polymorphism* refers to a case where subclasses can define their own unique behaviors and yet share some of the same functionality of the parent class. In short, polymorphism refers to changing the behavior of a superclass in the subclass.

The same principles apply to inheritance and polymorphism when developing Ethereum smart contracts and the general inheritance system is very similar to Python’s or Java's, especially concerning multiple inheritance.

When a contract inherits from multiple contracts, only a single contract is created on the blockchain, and the code from all the base contracts is copied into the created contract.

## Resources

- http://solidity.readthedocs.io/en/develop/contracts.html#inheritance