# Lesson 6 - Functions

Functions are the executable units of code within a contract.

## Function inputs

As in Javascript, functions may take parameters as input; 

```
    // For example, suppose we want our contract to accept  
    //two parameters, we would write something like:
    function InputAndOutputParameters(uint _inputParam1, address _inputParam2) {
       // Initialize state variables here
       constructorInput1 = _inputParam1;
       constructorInput2 = _inputParam2;
    }
```

## Function outputs

unlike in Javascript and C, they may also return arbitrary number of parameters as output.

You cannot return dynamic arrays from Solidity functions yet, but the developers are planning to include this functionality sometime.

```
    // The output parameters can be declared with the same syntax after the returns keyword. 
    // For example, suppose we wished to return  one value: then we would write this:

    function multiplyByThree(uint _inputParam1) returns (uint m){
        multiplyByThreeValue = _inputParam1 * 3;
        m = multiplyByThreeValue;
    }
```

```
    // Let's say we want to return two values the we would write something like this

    function sumAndProduct1(uint _inputParam1, uint _inputParam2) returns (uint s, uint p){
        sum = _inputParam1 + _inputParam2;
        product = _inputParam1 * _inputParam2;
        s = sum;
        p = product;
    }
```

```
    // please note that variables name can be ommitted in returns as well as in function call.
    function sumAndProduct2(uint _inputParam1, uint _inputParam2) returns (uint, uint){
        sum = _inputParam1 + _inputParam2;
        product = _inputParam1 * _inputParam2;
        return (sum, product);
    }
```

## Calling functions

```
//function can also be called as json object as parameters
// below function can be called by using the json object as shown in demo function below
function someFunction(uint key, uint value) {
	// Do something
}

someFunction({value: 2, key: 3});
someFunction(2, 3);
```

## Function modifiers

Function modifiers can be used to amend the semantics of functions in a declarative way (see Function Modifiers in contracts section).

## Resources

- http://solidity.readthedocs.io/en/develop/structure-of-a-contract.html
- https://www.toshblocks.com/solidity/input-output-parameters-functions/