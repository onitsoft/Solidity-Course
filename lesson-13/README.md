# Lesson 13 - Security concerns

> While it is usually quite easy to build software that works as expected, it is much harder to check that nobody can use it in a way that was not anticipated.

## Common pitfalls

- **Private information**: Everything you use in a smart contract is publicly visible, even local variables and state variables marked `private`. Read access can be hardened by using encryption and only `read` access can be truly limited.
- **Re-entrancy**: A type of attack where functions can be called repeatedly, before the first invocation of the function is finished. Do not perform external calls in contracts before making sure that all internal works has been finished.
- **Loops can trigger gas limit**: Loops that do not have a fixed number of iterations, for example, loops that depend on storage values, have to be used carefully since they can grow in size and make gas consumption hit the limits.
- **Ether send can fail**: When sending money, your code should always be prepared for the send function to fail.
- **Timestamp dependency**: Miners can manipulate timestamps so do not use them in critical parts of the code.

## Security recommendations

### Fail early, use exceptions

One way to ensure safer contracts is to fail early and to fail as loud as possible. This can be done by using exceptions properly. In the example below we use `require` and `assert` exception handlers to check that `name` argument is valid, and that the corresponding record in `payout` maps to a non-zero value.

```
contract FailLoudEarly {
  mapping(string => uint) payout;
  
  function getPayout(string name) constant returns (uint) {
    require(bytes(name).length != 0);    
    assert(payout[name] != 0);
    
    return payout[name];
  }
}
```

Function modifiers can be especially useful to make code more readable and still allow it to fail early and loud. In the example below we have `onlyBy` modifier which is used by `changeOwner` function to only allow the owner of the contract change it to another owner. If non-owner tries to call `changeOwner` function, it will immediately throw an exception and revert any changes made to the contract state (in this case there are none).

```
contract AccessRestriction {
    address public owner = msg.sender;

    modifier onlyBy(address _account) {
        require(msg.sender == _account);
        _;
    }

    function changeOwner(address _newOwner) onlyBy(owner) {
        owner = _newOwner;
    }
}
```

### Make use of Checks-Effects-Interactions pattern

Checks-Effects-Interactions pattern is a simple and well recommended coding pattern where you first check all the pre-conditions by using `assert` and `require`. Then, make changes to contract’s state. Finally, interact with other contracts via external calls.

Consider the example below which introduces attack surface for a re-entrancy attack. In this example the recipient could call `withdraw()` multiple times before `withdraw()` is finished executing, and as a result get multiple refunds.

```
// Bad coe, do not use!
contract Fund {
    /// Mapping of ether shares of the contract.
    mapping(address => uint) shares;
    /// Withdraw your share.
    function withdraw() {
        if (msg.sender.send(shares[msg.sender]))
            shares[msg.sender] = 0;
    }
}
```

By using Checks-Effects-Interactions pattern we can avoid this problem, as in the example below. Before transferring the funds we make sure that the receiver has any funds to receive. If he/she does, we set his/her balance to 0, and only then make the token transfer. So even if `withdraw()` is called again before token transfer is finished executing, the corresponding account balance will already be set to 0, unlike in the previous example. This will prevent the re-entrancy attack.

```
contract Fund {
    // Mapping of ether shares of the contract.
    mapping(address => uint) shares;

    // Withdraw your share.
    function withdraw() {
        var share = shares[msg.sender];
        assert(share != 0);
        shares[msg.sender] = 0;
        msg.sender.transfer(share);
    }
}
```

### Restrict the amount of Ether deposited

Restrict the amount of Ether (or other tokens) that can be stored in a smart contract. If your source code, the compiler or the platform has a bug, these funds may be lost. If you want to limit your loss, limit the amount of Ether. Also, attackers are less likely to try to mess with contracts with low balances.

```
contract LimitFunds {
	uint LIMIT = 5000;

	function deposit() {
		require(this.balance < LIMIT);
		// DO SOMETHING IF LIMIT NOT REACHED
	}
}
```

### Keep code small and modular

Keep your contracts small and easily understandable. Single out unrelated functionality in other contracts or into libraries. Also general software engineering recommendations apply:

- Limit the amount of local variables;
- Limit length of functions
- Document your functions so that others can see what your intention was and whether it is different than what the code does.

### Mind EVM limits

The EVM has a fair chunk of limits that one should be mindful of. For example, integers can easily overflow or underflow. Or gas limit could be reached and all the work done until that point will be reverted and thus lost.

```
// Bad code, do not use!
contract ProblematicCode {
	address[] affiliates;

	function payAffiliates() {
		for (var i = 0; i < affiliates.length; i++) {
			address affiliate = affiliates[i];
			uint payout = calculatePayout(affiliate);
			affiliate.send(payout);
		}
	}

	function calculatePayout(address affiliate) returns (uint) {
		// expensive computation to calculate payout
	}
}
```

While the above example looks simple enough, it hides two potential flaws. First, since `uint8` is the lowest sufficient data type to hold value 0, this is what variable `i` will be initialized to. However, since `uint8` is only made up of 8 bits, it can only represent 255 distinct values. Thus, if `affiliates` array goes over 255 elements, we are going to experience integer overflow and as a result never terminate the loop. This can be fixed by using by declaring `uint` which defaults to 256 bits and thus can store huge values.

Another problematic area with the above example is potential gas limit. Imagine a scenario where we are calculating payout and sending it out for hundreds of affiliates. We have processed 90% of them but then ran out of gas. As a result, all the work we have done up to that point will be for naught because Ethereum Virtual Machine will revert all the changes to the state in which it was before calling this function.

The best way to go about the gas limit problem is to separate the payout and calculation functions and first do the payouts calculation, and only then do the payouts. Then, if either one fails, at least not as many resources will be lost.

```
contract GoodCode {
	address[] affiliates;
	mapping(address => uint) payouts;

	function payAffiliates() {
		for (uint i = 0; i < affiliates.length; i++) {
			address affiliate = affiliates[i];
			uint payout = payouts[employee];
			affiliate.send(payout);
		}
	}

	function calculatePayout(address affiliate) returns (uint) {
		uint payout = 0;
		// expensive computation to calculate payout
		payouts[address] = payout;
	}
}
```

## Resources

- http://solidity.readthedocs.io/en/develop/security-considerations.html
- http://solidity.readthedocs.io/en/develop/common-patterns.html
- http://solidity.readthedocs.io/en/develop/bugs.html#known-bugs
- https://consensys.github.io/smart-contract-best-practices/
- https://blog.zeppelin.solutions/onward-with-ethereum-smart-contract-security-97a827e47702