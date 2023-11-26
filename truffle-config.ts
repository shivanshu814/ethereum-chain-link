/** @format */

module.exports = {
	networks: {
		development: {
			host: '127.0.0.1', // Localhost (default: none)
			port: 7545, // Standard Ethereum port (default: none)
			network_id: '*', // Any network (default: none)
		},
		test: {
			host: '127.0.0.1',
			port: 7545,
			network_id: '*',
		},
	},

	// Set default mocha options here, use special reporters, etc.
	mocha: {
		timeout: 100000,
	},

	// Configure your compilers
	compilers: {
		solc: {
			version: '0.8.21', // Fetch exact version from solc-bin (default: truffle's version)
			settings: {
				// See the solidity docs for advice about optimization and evmVersion
				optimizer: {
					enabled: false,
					runs: 200,
				},
				evmVersion: 'istanbul',
			},
		},
	},

	// Truffle DB is enabled by default to store network and deployment history.
	db: {
		enabled: false,
	},
};
