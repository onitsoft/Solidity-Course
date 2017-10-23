# Lesson 9 - ERC20 Token Implementation

In this lesson we implement all the functions in ERC20 Token Standard Interface and prepare an ERC20 compliant token (only lacking events). Find full code for it at [lesson-9/DummyToken.sol](https://github.com/onitsoft/BitDegree-Solidity-Course/blob/master/lesson-9/DummyToken.sol).

## Deploying to testrpc

Full steps can be found in the instructional video but these are the provisional steps to compile and deploy contracts on testrpc using Truffle.

1. Create and go to new directory - `mkdir dummy-token-truffle && cd dummy-token-truffle`.
2. Initiate Truffle project - `truffle init`.
3. Add `DummyToken.sol` to contracts directory.
4. Remove all other contracts besides `Migrations.sol`.
5. Adjust `migrations/2_deploy_contracts.js` to only leave `DummyToken.sol` to be deployed.
6. Make sure testrpc node is running. It can be launched via `testrpc` command from a new terminal window.
7. From Truffle project root compile the contracts by typing `truffle compile`.
8. Then deploy the contract with `truffle deploy`.

## Using Truffle console

To test testrpc we need to connect to truffle console by Typing `truffle console`. From there we can interact with our contract and testrpc node.

### Useful commands

- `web3.eth.accounts` - retrieve all accounts created by testrpc node.
- `DummyToken.deployed().then(function(instance) {app=instance;})` - retrieve instance of our contract.
- `app.getterFunction.call({from: web3.eth.accounts[0]})` - call getter function that does not alter blockchain.
- `app.setterFunction("some param", {from: web3.eth.accounts[1]})` - call setter functions that alters blockchain state.