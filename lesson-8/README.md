# Lesson 8 - ERC20 Token Standard

The ERC20 token standard describes the functions and events that an Ethereum token contract has to implement. So if you are familiar with Java for example and know what an interface is, ERC20 Token Standard is essentially just that, an interface that you have to implement so that the token you create becomes an ERC20 compliant token.

In other words, you have to implement all the functions that are described in ERC20 Token Standard Interface and make them visible to the public. This is what users will interact with and what is essentially a token. 

The reason this standard exists is so that every token that implements this standard follows the same naming convention. And by doing so make it easy for developers to interact with different coins. It also makes it easier for wallets to handle different coins as they know that once a token is ERC20 compliant it will follow certain convention and thus will behave in predictable ways.

## The ERC20 Token Standard Interface

```
contract ERC20 {
	// Get the total token supply in circulation
	function totalSupply() constant returns (uint totalSupply);

	// Get the account balance of another account with address _owner
	function balanceOf(address _owner) constant returns (uint balance);

	// Send _value amount of tokens to address _to
	function transfer(address _to, uint _value) returns (bool success);

	// Send _value amount of tokens from address _from to address _to
	function transferFrom(address _from, address _to, uint _value) returns (bool success);

	// Allow _spender to withdraw from your account, multiple times, up to the _value amount.
	// If this function is called again it overwrites the current allowance with _value.
	function approve(address _spender, uint _value) returns (bool success);

	// Returns the amount which _spender is still allowed to withdraw from _owner
	function allowance(address _owner, address _spender) constant returns (uint remaining);

	// Triggered when tokens are transferred.
	event Transfer(address indexed _from, address indexed _to, uint _value);

	// Triggered whenever approve(address _spender, uint256 _value) is called.
	event Approval(address indexed _owner, address indexed _spender, uint _value);
}
```

## Resources

- https://theethereum.wiki/w/index.php/ERC20_Token_Standard