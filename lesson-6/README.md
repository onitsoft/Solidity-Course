# Lesson 6 - Functions

Functions are the executable units of code within a contract.

## Function inputs

As in Javascript, functions may take parameters as input. Note how you also have to denote the data type used for the parameter.

```
function twoInputs(uint _input1, address _input2) {
   stateParam1 = _input1;
   stateParam2 = _input2;
}
```

## Function outputs

Unlike in Javascript and C, functions may also return arbitrary number of parameters as output.

You cannot return dynamic arrays from Solidity functions yet, but the developers are planning to include this functionality sometime.

Below is an example of a function with one return parameter. Note how `return` keyword is not necessary here since we return
variable `m` and declare it within the function.

```
function oneOutputExample(uint m) returns (uint m) {
    m = m * 3;
}
```

Variables can be omitted in returns. Then we have to explicitly declare the `return` statement.

```
function oneOutputExample2(uint m) returns (uint) {
    return m * 3;
}
```

Example of two output values:

```
function twoOutputsExample(uint _input1, uint _input2) returns (uint s, uint p){
    sum = _input1 + _input2;
    product = _input1 * _input2;
    s = sum;
    p = product;
}
```

Example of returning multiple values when omitting variable names to be returned.

```
function twoOutputsExample2(uint _input1, uint _input2) returns (uint, uint){
    sum = _input1 + _input2;
    product = _input1 * _input2;
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

## Function types

Since Solidity version `0.4.16` there are two function types to keep in mind - `view` and `pure`.

### View

`view` functions read from blockchain storage but do not write to it. `view` acts as a replacement for `constant` keyword which was intended to be used by functions that do not modify the state.

```
function readFromStorageView() view returns (bool) {
	return someVar;
}
```

### Pure

`pure` functions do not read or write to storage.

```
function pureFunction(bool input1) pure returns (bool) {
	return !input1;
}
```

### Full example

```
pragma solidity ^0.4.16; 

contract PureViewConstant {
	bool foo = true;
	
	function writeToStorage() {
	    foo = !foo;
	}
	
	function readFromStorageConstant() constant returns (bool) {
	    return foo;
	}
	
	function readFromStorageView() view returns (bool) {
	    return foo;
	}
	
	function pureFunction(bool bar) pure returns (bool) {
	    return !bar;
	}
}
```

## Function modifiers

Function modifiers can be used to amend the semantics of functions in a declarative way.

```
pragma solidity ^0.4.16; 

contract FunctionModifiers {
	address public owner;

    function FunctionModifiers() {
       owner = msg.sender;
    }

    // Define a modifier
    modifier onlyOwner() {
        // Throw error if caller is not original creator of the contract
        if (msg.sender != owner) throw;
        // Else do nothing
        _;
    }

    // Apply function modifier
    function kill() onlyOwner { 
    	selfdestruct(owner);
    }

}
```

## Resources

- http://solidity.readthedocs.io/en/develop/structure-of-a-contract.html
- https://www.toshblocks.com/solidity/input-output-parameters-functions/
- https://www.toshblocks.com/solidity/function-modifiers-solidity-how-they-works/