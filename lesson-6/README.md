# Lesson 6 - Functions

Functions are the executable units of code within a contract.

## Function inputs

As in Javascript, functions may take parameters as input. Note how you also have to denote the data type used for the parameter.

```
function twoInputs(uint _inputParam1, address _inputParam2) {
   // Initialize state variables
   stateParam1 = _inputParam1;
   stateParam2 = _inputParam2;
}
```

## Function outputs

Unlike in Javascript and C, functions may also return arbitrary number of parameters as output.

You cannot return dynamic arrays from Solidity functions yet, but the developers are planning to include this functionality sometime.

Below is an example of a function with one return parameter. Note how `return` keyword is not necessary here since we return
variable `m` and declare it within the function.

```
function oneOutputValue(uint _inputParam1) returns (uint m) {
    m = m * 3;
}
```

Varibles can be omitted in returns. Then we have to explicitly declare the `return` statement.

```
function oneOutputValue(uint _inputParam1) returns (uint) {
    return m * 3;
}
```

Example of two output values:

```
function twoOutputValues(uint _inputParam1, uint _inputParam2) returns (uint s, uint p){
    sum = _inputParam1 + _inputParam2;
    product = _inputParam1 * _inputParam2;
    s = sum;
    p = product;
}
```

Example of returning multiple values when omitting variable names to be returned.

```
function sumAndProduct2(uint _inputParam1, uint _inputParam2) returns (uint, uint){
    sum = _inputParam1 + _inputParam2;
    product = _inputParam1 * _inputParam2;
    return (sum, product);
}
```

## Calling functions

Functions can be called using either positional arguments or as keyword arguments when passed as JSON object.

```
function someFunction(uint key, uint value) {
	// Do something
}

someFunction({value: 2, key: 3});
someFunction(2, 3);
```

## Function modifiers

Function modifiers can be used to amend the semantics of functions in a declarative way.

```
pragma solidity 0.4.8; 

contract FunctionModifiers {

	address public creator;
    // Define consutruct here
    function FunctionModifiers() {
       // Initialize state variables here
       creator = msg.sender;
    }

    //this is how we define the modifiers
    modifier onlyCreator() {
        // if a condition is not met then throw an exception
        if (msg.sender != creator) throw;
        // or else just continue executing the function
        _;
    }

    // this is how we add a modifier to the function 
    // there can be zero of more number of modifiers
    function kill() onlyCreator { 
    	selfdestruct(creator);
    }

}
```

## Resources

- http://solidity.readthedocs.io/en/develop/structure-of-a-contract.html
- https://www.toshblocks.com/solidity/input-output-parameters-functions/
- https://www.toshblocks.com/solidity/function-modifiers-solidity-how-they-works/