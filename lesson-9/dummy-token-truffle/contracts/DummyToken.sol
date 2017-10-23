pragma solidity ^0.4.15;

contract DummyToken {
	mapping(address => uint) balances;
	mapping(address => mapping(address => uint)) approved;
	uint supply;

	// Get the total token supply in circulation
	function totalSupply() constant returns (uint) {
		return supply;
	}

	// Get the account balance of another account with address _owner
	function balanceOf(address _owner) constant returns (uint balance) {
		return balances[_owner];
	}

	// Send _value amount of tokens to address _to
	function transfer(address _to, uint _value) returns (bool success) {
		// Unsuccessful transaction
		if (_value <= 0 || balances[msg.sender] < _value) return false; 

		balances[msg.sender] -= _value;
		balances[_to] += _value;

		return true;
	}

	// Send _value amount of tokens from address _from to address _to
	function transferFrom(address _from, address _to, uint _value) returns (bool success) {
		// Unsuccessful transaction
		if (_value <= 0 || allowance(_from, msg.sender) < _value || balances[_from] < _value) return false;

		balances[_from] -= _value;
		approved[_from][msg.sender] -= _value;
		balances[_to] += _value;

		return true;
	}

	// Allow _spender to withdraw from your account, multiple times, up to the _value amount.
	// If this function is called again it overwrites the current allowance with _value.
	function approve(address _spender, uint _value) returns (bool success) {
		if (_value <= 0 || balances[msg.sender] < _value) return false;

		// approved[owner][spender] - allowed _value
		approved[msg.sender][_spender] = _value;

		return true;
	}

	// Returns the amount which _spender is still allowed to withdraw from _owner
	function allowance(address _owner, address _spender) constant returns (uint remaining) {
		return approved[_owner][_spender];
	}

	// Triggered when tokens are transferred.
	event Transfer(address indexed _from, address indexed _to, uint _value);

	// Triggered whenever approve(address _spender, uint256 _value) is called.
	event Approval(address indexed _owner, address indexed _spender, uint _value);

	// Custom (not ERC20 functions)
	function mine() {
		balances[msg.sender] += 1;
		supply += 1;
	}
}