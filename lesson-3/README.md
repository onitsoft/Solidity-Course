# Lesson 3 - Setting up the development environment

## Software packages to install with installation links:

- [node.js](https://nodejs.org/en/download/) - Node.js is a JavaScript runtime.
- [npm (Node Package Manager)](https://www.npmjs.com/) - package manager for JavaScript.
- [truffle](http://truffleframework.com/) - development environment, testing framework and asset pipeline for Ethereum.
- [geth](https://github.com/ethereum/go-ethereum/wiki/geth) - command line interface for running a full Ethereum node. More concretely, it allows to mine blocks, generate Ether, deploy and interact with smart contracts, transfer funds, inspect block history, create accounts, and do anything else that is possible on Ethereum node. Allows to create own private network allowing to fully test your application before deploying it to the live network.
- [ethereumjs-testrpc](https://www.npmjs.com/package/ethereumjs-testrpc) - Node.js based Ethereum client for testing and development of smart contracts. It is only an emulator of an Ethereum node, not a real node like Geth. Thus blocks mining and other operations are almost instantaneous. Notably, it uses in-memory mechanism, not space on the disk, meaning that all the changes you do to the blockchain are gone once the node is stopped.

## Mac installation instructions

1. Install *[Homebrew](https://brew.sh/)* by copying command `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"` into terminal prompt.
2. Install *Node.js* by typing `brew install node`.
3. Install *Geth* by first typing `brew tap ethereum/ethereum`. Then `brew install ethereum`.
4. Install *testrpc* by typing `npm install -g ethereumjs-testrpc`.
5. Install *truffle* by typing `npm install -g truffle`.

## Windows installation instructions

1. Install *Node.js* by going to [Node.js latest installer](https://nodejs.org/en/download/current/) and downloading the latest version.
2. Install *Geth* by going to [Geth installer](https://geth.ethereum.org/downloads/) and downloading the latest version.
3. Install *testrpc* by typing `npm install -g ethereumjs-testrpc`.
4. Install *truffle* by typing `npm install -g truffle`.

## Linux installation instructions (COMING SOON)
