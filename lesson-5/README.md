# Lesson 5 - Operators

## Booleans

- `!` (logical negation)
- `&&` (logical conjunction, “and”)
- `||` (logical disjunction, “or”)
- `==` (equality)
- `!=` (inequality)

## Integers

- Comparisons: `<=`, `<`, `==`, `!=`, `>=`, `>` (evaluate to bool)
- Bit operators: `&` (bitwise AND), `|` (bitwise OR), `^` (bitwise XOR), `~` (bitwise negation). Bitwise operators treat their operands (what we are doing operation on) as a sequence of bits (zeroes and ones), rather than as decimal, hexadecimal, or octal numbers.
- Arithmetic operators: `+`, `-`, unary `-` (`--`), unary `+` (`++`), `*`, `/`, `%` (remainder), `**` (exponentiation), `<<` (left shift), `>>` (right shift).

## Address

`<=`, `<`, `==`, `!=`, `>=` and `>`.

## Bytes

Operators:

- Comparisons: `<=`, `<`, `==`, `!=`, `>=`, `>` (evaluate to bool)
- Bit operators: `&`, `|`, `^` (bitwise exclusive or), `~` (bitwise negation), `<<` (left shift), `>>` (right shift)
- Index access: `x[k]` for `0 <= k < len(x)` returns the k-th byte (read-only).

Members:

- `.length` yields the fixed length of the byte array.

## Strings

Since strings are essentially arrays of bytes, only the operations available for bytes are available for strings. Thus, concatenation and other basic procedures that are simple in JavaScript are more complex in Solidity.

Below is an example of simple string concatenation. See how strings have to be converted to bytes before manipulating them.

```
function strConcat(string _a, string _b) public constant returns (string){
    bytes memory _aa = bytes(_a);
    bytes memory _bb = bytes(_b);
    bytes memory ab = new bytes(_aa.length + _bb.length);
    uint k = 0;
    uint i = 0;
    for (i = 0; i < _aa.length; i++) ab[k++] = _aa[i];
    for (i = 0; i < _bb.length; i++) ab[k++] = _bb[i];
    return string(ab);
}
```

## Arrays

Operators:

- Index access: `x[k]` for `0 <= k < len(x)` returns the k-th element.


Members:

- `.length` returns size of the array.
- `.push` works only for dynamic storage arrays and bytes (not string). It appends an element at the end of the array. The function returns the new length.


