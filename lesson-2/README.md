# Lesson 2 - Introduction to Ethereum smart contracts

## What are smart contracts?

As an analogy, I find that comparing smart contracts to vending machine often works. If, for example, vending machine operated like our current legal system, you would ordinarily go to a lawyer or a notary, pay them, and then wait for the document however long it takes the lawyer or notary to process it.

With smart contracts, you simply drop a coin into the vending machine (i.e. public ledger), and your document, escrow, or whatever drops into your account.

To put it short and simple, smart contract is code that automates "if this happens then do that" logic of traditional contracts.

To put it another way, smart contract is a piece of code that is stored on an blockchain, triggered by blockchain transactions and which reads and writes data in that blockchain's database.

When you put $2 coin in a vending machine, you participate in an implicit contract between a vending machine and yourself so that if you put $2, you get a coke. Smart contracts are similar to that.

## Explanation from Vitalik

As Vitalik Buterin, the creator of Ethereum himself, explains that in a smart contract approach, an asset or currency is transferred into a program “and the program runs this code and at some point it automatically validates a condition and it automatically determines whether the asset should go to one person or back to the other person, or whether it should be immediately refunded to the person who sent it or some combination thereof.

Asset in this case could be anything. It could be a bet you made on a betting system. It could be your driver's license. It could be a proof that you sent the goods in a post office. It could be stocks. It could be your computer resources that you spent to do a certain task.

## Pros of smart contracts

- Computer code behaves in expected ways and doesn’t have the linguistic nuances of human languages.
- The code is replicated on many computers giving contract security and immutability.
- Smart contract can be verified on a public ledger.
- Fewer intermediaries e.g. no need for external "escrow" services.
- Useful for trustless systems where you have multiple parties that do not trust each other 100%.

## Cons of smart contracts

- In some cases a trusted entity is still required to make smart contracts. For example, if smart contracts relies on weather conditions, and we know that each node in a network must agree on the same conditions or else the contract won't execute, we need a trusted party to whom we ask about the weather data rather than each contract fetching weather data from some random weather API which could return different results to two different nodes.
- Hiding confidential data. For example, if 10 banks set up a blockchain together, and 2 banks made a bilateral transaction, it will be immediately obvious to other 8 banks.

## Example of a smart contract

Suppose you rent a car for me which can be opened with an app. First, you pay me in Bitcoin. Then get a receipt which is held in our virtual contract; I give you the digital entry key which comes to you by a specified date and time. If the key doesn’t come on time, the blockchain releases a refund. If I send the key before the rental date, the function holds it releasing both the fee to me, and the key to you, when the date arrives. 

The system works on the If-Then premise and is witnessed by hundreds of people on a public ledger, so you can expect a faultless delivery. If I give you the key, I’m sure to be paid. If you send a certain amount in bitcoins, you receive the key. The document is automatically canceled after the time, and the code cannot be interfered by either of us without the other knowing since all participants are simultaneously alerted.

## Application areas

- Financial services - insurance, coupon payments, trade clearing and settlement;
- Health care - electronic medical records, population health data access, personal health tracking;
- Entertainment - royalty distribution;
- Energy and resources - autonomous electric vehicle charging stations;
- Supply chain record keeping;
- Peer-to-peer transacting - lending, insurance, energy credits, etc;
- Voting;
- Crowdfunding agreements.

## Resources

- https://blockgeeks.com/guides/smart-contracts/
- https://bitsonblocks.net/2016/02/01/a-gentle-introduction-to-smart-contracts/
- https://medium.freecodecamp.org/smart-contracts-for-dummies-a1ba1e0b9575 - good gentrle introduction to smart contracts
- https://dupress.deloitte.com/dup-us-en/focus/signals-for-strategists/using-blockchain-for-smart-contracts.html