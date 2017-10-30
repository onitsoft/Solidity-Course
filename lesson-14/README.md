# Lesson 14 - Deployment on Ethereum mainnet

This lesson is all about deployment on Ethereum mainnet using Truffle and geth. Below are the outlined steps to deploy any smart contract on Ethereum mainnet.

## Steps to deploy on Ethereum mainnet

1. Start syncing Ethereum blockchain with command `geth --syncmode "fast" --rpc --rpcapi="personal,eth,network,web3,net"`.
2. Make sure that blockchain is syncing by typing `geth attach` and then from within the console type `eth.syncing`. If it returns `false`, the blockchain has either not started syncing yet, or it has already synced. Otherwise, it will return a dictionary containing `currentBlock` key indicating the current block in synchronization process, and `highestBlock` key indicating the total number of blocks in the blockchain.
3. From within the same console type `eth.accounts`. It should return a couple Ethereum addresses which you can use. If there are no addresses being displayed, go to Step 4. Otherwise, skip to step 5.
4. From within new terminal window type `geth account new`. Then follow the instructions. Try to do Step 3 again once done.
5. Transfer some Ether ($20 worth should be enough) to your Ether account that is setup on Geth.
6. Go to Truffle project directory and edit `truffle.js` by adding additional `live` entry to `networks` dictionary. Find full code in "`truffle.js` config" section below.
7. Once blockchain is synchronized, and there is some Ether in the balance, from within the same Truffle project directory execute commands `truffle compile` and then `truffle migrate --network live --reset`.

## `truffle.js` config

```
module.exports = {
  networks: {
    development: {
      host: "localhost",
      port: 8545,
      network_id: "*" // Match any network id
    },
    live: {
    	host: "localhost",
    	port: 8545,
    	network_id: 1,
    	from: "<YOUR_ETHEREUM_ADDRESS>",
    	gas: 2000000
    }
  }
};
```

## Interacting with deployed contract using Truffle console

Interacting with deployed Ethereum contract on mainnet whilst using Truffle is no different than if it was deployed on a testrpc node. Simply type `truffle console` from within the project directory, and then retrieve instance of the app by typing `<MyContractName>.deployed().then(function() {app = instance});`. Go back to lessons 9 & 10 for an example.

## Interacting with deployed contract using Geth

Using Geth to interact with the deployed smart contract is slightly trickier than when using Truffle but offers more flexibility. The steps go as follows:

1. Take note of the contract address at which the contract was deployed. It can be found on your Truffle repository's `build/contract/<ContractName>.json` file at `networks > 1 > address` field. 
2. Copy the contract's ABI, the entire array, from the same `build/contract/<ContractName>.json` file and `abi` field. Make sure to remove all new lines and make the entire ABI copied into one line.
3. Open geth console by typing `geth attach`.
4. From within the console store ABI into variable `abi` as such `var abi = JSON.parse('<COPIED_ABI_DEFINITION>')`.
5. Then get instance of the contract by typing `var contract = abi.at('<CONTRACT_ADDRESS>')`.
6. Execute functions on smart contract by typing `contract.<FUNCTION_NAME>()`.

Take note that functions that alter the state of the blockchain such as `mine()` will cost real Ether to execute. However, functions that only return a value such as `totalSupply()` will cost nothing to execute.

## Differences between mainnet and testnets

Testnets such as Rinkeby are essentially the same as the Ethereum mainnet. The key difference is that coins or tokens on testnet have no real value. Plus, the consensus algorithm which is used by the blockchain is slightly different and on Rinkeby only a few special nodes can mine coins. You can retrieve them via a faucet which essentially is a website which dispenses Ethereum to your account if you ask for it. 

In short, testnets act as a staging environment for contracts. The deployment process is really similar to the one as when deploying on mainnet. The key is to add another network to `truffle.js` file as in the [example](https://github.com/onitsoft/BitDegree-Solidity-Course/blob/master/lesson-14/dummy-token-truffle/truffle.js) and use `truffle migrate --network rinkeby` command for deployment. And also use Rinkeby instructions for the [Geth setup](https://www.rinkeby.io/#geth).


