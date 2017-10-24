# Lesson 10 - Events and logging

Events enable the usage of the EVM logging facilities. These events can be used in JavaScript callbacks in the user interface of a dApp, which listen for these events.

In other words, events are dispatched signals the smart contracts can fire. And your application can listen to these events and act accordingly.

When events are called, they cause the event arguments to be stored in the transaction’s log - a special data structure in the blockchain. These logs are associated with the address of the contract and will be incorporated into the blockchain and stay there as long as a block is accessible. As of now in regards to how blockchain works on Ethereum, it is forever. This might change in the future implementations of Ethereum.

`indexed` parameter allows to filter for specific values of indexed arguments. Up to three parameters can receive the attribute `indexed` in an event.

## Full example

Full example can be found at [dummy-token-truffle](https://github.com/onitsoft/BitDegree-Solidity-Course/tree/master/lesson-10/dummy-token-truffle) directory. Make sure to run `testrpc` node by typing `testrpc` in new terminal window. Then from within the `dummy-token-truffle` directory compile the contract via `truffle compile`, then deploy it with `truffle migrate` and then interact with it with `truffle console`.

## Resources

- http://solidity.readthedocs.io/en/develop/contracts.html#events