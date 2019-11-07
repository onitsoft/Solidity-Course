# Lesson 7 - Visibility of variables and functions

There are four types of visibilities for functions and state variables. Visibility declares what level of visibility a variable or function has within and outside the contract.

Functions can be specified as being `external`, `public`, `internal` or `private`, where the default is `public`.

For state variables, `external` is not possible and the default is `internal`.

## `external`

External functions are part of the contract interface, which means they can be called from other contracts and via transactions. An external function `f` cannot be called internally (i.e. f() does not work, but this.f() works since it makes an actual `CALL` in Solidity sending message to a contract). External functions are sometimes more efficient when they receive large arrays of data.

In example below, both functions return equal size array. In this case public function uses 496 gas in comparison to only 261 gas in external function.

```
pragma solidity^0.4.16;

contract Test {
    function test(uint[20] a) public returns (uint){
         return a[10]*2;
    }

    function test2(uint[20] a) external returns (uint){
         return a[10]*2;
    }
}
```

## `public`

Public functions are part of the contract interface and can be either called internally or via messages by any other contract.

## `internal`

Internal functions and state variables can only be accessed internally (i.e. from within the current contract or contracts deriving from it), without using `this`. 

`internal` can be compared to `protected` visibility in object-oriented languages such as Java.

## `private`

Private functions and state variables are only visible for the contract they are defined in and not in derived contracts.

## Full example

```
pragma solidity ^0.4.16;

contract Chatty {
    string public publicStr = "publicStr";
    string private privateStr = "publicStr";
    string internal internalStr = "publicStr";
    
    // Visible to all
    function helloPublic() public pure returns (bytes32) {
        return "hey there from helloPublic!";
    }
    
    // Only visibile to current contract instance and ones deriving from it
    function helloInternal() internal pure returns (bytes32) {
        return "hey there from helloInternal!";
    }

    // Only visibile to current contract instance
    function helloPrivate() private pure returns (bytes32) {
        return "hey there from helloPrivate!";
    }
    
    // Only visibile to current contract instance
    function helloExternal() external pure returns (bytes32) {
        return "hey there from helloExternal!";
    }
    
    function chat(Chatty buddy) public {
        helloPublic(); // will work
        buddy.helloPublic(); // will work since public is visible to all
            
        //helloInternal(); // will work
        //buddy.helloInternal(); // won't work since buddy is another contract instance
        
        //helloPrivate(); // will work
        //buddy.helloPrivate(); // won't work since buddy is another contract instance
        
        //helloExternal(); // won't work because external cannot be called internally
        //buddy.helloExternal(); // will work because calling from another contract instance 
        //this.helloExternal(); // will work because we retrieve instance of current contract via a message
        
        //buddy.publicStr; // will work since public is visible to all
        //buddy.privateStr; // won't work since buddy is another contract instance
        //buddy.internalStr; // won't work since buddy is another contract instance
    }
}

contract ChattyInherited is Chatty {
    function ChattyInherited() public {
        // will work because public makes it accessible by all
        Chatty.helloPublic();
        
        // will work because internal is visibile for derived contracts too
        //Chatty.helloInternal();
        
        // won't work because private is only visible for the contract they are defined in
        //Chatty.helloPrivate();
        
        // won't work because external can only be called from external contract instances
        //Chatty.helloExternal();
        
        // will work because public makes it accessible by all
        //string publicStr2 = Chatty.publicStr;
        
        // will work because internal is visibile for derived contracts too
        //string internalStr = Chatty.internalStr;
        
        // won't work because private is only visible for the contract they are defined in
        //string privateStr = Chatty.privateStr;
    }
}
```

## Resources

- http://solidity.readthedocs.io/en/develop/contracts.html?highlight=visibility#visibility-and-getters
- https://ethereum.stackexchange.com/questions/19380/external-vs-public-best-practices?answertab=active#tab-top
