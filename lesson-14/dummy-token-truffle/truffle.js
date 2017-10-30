module.exports = {
  networks: {
    development: {
      host: "localhost",
      port: 8545,
      network_id: "*" // Match any network id
    },
    rinkeby: {
    	host: "localhost",
    	port: 8545,
    	network_id: 4
    },
    live: {
    	host: "localhost",
    	port: 8545,
    	network_id: 1,
    	from: "0xafb1ca8aa7250fd45bfc4c63c5d64b549c980b9c",
    	gas: 2000000
    }
  }
};
