# Lesson 4 - Data Types

## Value types

The following types are also called value types because variables of these types will always be passed by value, i.e. they are always copied when they are used as function arguments or in assignments.

### Booleans

The possible values are constants `true` and `false`.

```solidity
bool foo = true;
```

### Integers

`int` - signed integer - values from minimum of (-2^255)/2 and maximum of (2^255)/2-1;

`uint` - unsigned integers - max value of 2^256.

Keywords `uint` and `int` go up in increments of 8 from the lowest value of 8 to the maximum value of 256. `uint` and `int` by default are aliases for `uint256` and `int256`, respectively.

```
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
```

### Fixed Point Numbers

`fixed` - signed fixed point number;

`ufixed` - unsigned fixed point number of various sizes.

However, fixed point numbers are not fully supported by Solidity yet. They can be declared, but cannot be assigned to or from.

So if you want to use float type division in Solidity, different size units will be have to be used.

### Bytes

Another familiar data type which can be used raw byte data.

### Strings

String literals are written with either double or single-quotes ("foo" or 'bar'). As with integer literals, their type can vary, but they are implicitly convertible to bytes type. Under the hood, strings are basically an arbitrary-length byte array.

```
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
```

### Address

Special data type that holds a 20 byte value (size of an Ethereum address). Address types also have members and serve as a base for all contracts.

Address also comes with data types members which are `balance` and `transfer`. It is possible to query the balance of an address using the property `balance` and to send Ether (in units of wei) to an address using the `transfer` function.

```solidity
pragma solidity ^0.4.11;

contract Address {
    address me = 0xca35b7d915458ef540ade6068dfe2f44e8fa733c;

    function getBalance() public constant returns (uint256) {
        return me.balance;
    }
}
```

### Enums

Enums are one way to create a user-defined type in Solidity where a keyword can be mapped to an integer value.

```solidity
pragma solidity ^0.4.0;

contract Enums {
    enum ActionChoices { GoLeft, GoRight, GoStraight, SitStill }
    ActionChoices choice;
    ActionChoices constant defaultChoice = ActionChoices.GoStraight;

    function setGoStraight() {
        choice = ActionChoices.GoStraight;
    }

    // Since enum types are not part of the ABI, the signature of "getChoice"
    // will automatically be changed to "getChoice() returns (uint8)"
    // for all matters external to Solidity. The integer type used is just
    // large enough to hold all enum values, i.e. if you have more values,
    // `uint16` will be used and so on.
    function getChoice() public constant returns (ActionChoices) {
        return choice;
    }

    function getDefaultChoice() public constant returns (uint) {
        return uint(defaultChoice);
    }
}
```

## Reference types

Complex types, i.e. types which do not always fit into 256 bits have to be handled more carefully than the value-types we have already seen. Since copying them can be quite expensive, we have to think about whether we want them to be stored in memory (which is not persisting) or storage (where the state variables are held).

## Data locations

There are fixed and dynamic sized arrays in Solidity but before we have a look at them, we need to have at data locations, what they are and how they affect our code.

### Memory vs. storage

Memory and storage are analogous to memory and hard drive storage in a computer. The contract can use any amount of memory, as long as it pays for it during execution of its code, but when execution stops, the entire content of the memory is wiped, and the next execution will start fresh. The storage, on the other hand, is persisted into the blockchain itself, so the next time the contract executes some code, it has access to all the data it previously stored into its storage area.

So be careful about which one you use. If you do not specify whether memory or storage should be used, Solidity by default will use storage for structs and arrays even when they are declared as local function variables. This is because arrays and structs are complex data structures and could be of variable length. This is ideal for storage as it operates as a key:value data structure which can always be expanded.

On the other hand, memory dedicates a fixed-length space in memory and thus is less expensive to use but it cannot be resized. This is ideal for simpler data types such as integers, booleans and so on.

Remember, as a rule of thumb:
- State variables are always in storage
- Function arguments are always in memory
- Local variables always reference storage

```solidity
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
```

### Arrays

Creating arrays with variable length in memory can be done using the new keyword. As opposed to storage arrays, it is not possible to resize memory arrays by assigning to the .length member. [More about it here](http://solidity.readthedocs.io/en/develop/types.html#arrays).

```
pragma solidity ^0.4.0;

contract C {
    function f(uint len) {
        uint[] memory a = new uint[](7);
        bytes memory b = new bytes(len);
        // Here we have a.length == 7 and b.length == len
        a[6] = 8;
    }
}
```

### Structs

Structs is a way to define new data types.

```
pragma solidity ^0.4.0;

contract CrowdFunding {
    // Defines a new book data type.
    struct Book {
        string title;
        string author
        uint cost;
    }
}
```

### Mappings

Mappings can be seen as hashtables which are virtually initialized such that every possible key exists and is mapped to a value whose byte-representation is all zeros by default. But once initialized, it becomes to equal to the newly set value.

Mappings are only allowed for state variables (or as storage reference types in internal functions).



