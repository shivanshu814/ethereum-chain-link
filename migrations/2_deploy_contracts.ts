/** @format */

const HelloWorld = artifacts.require('HelloWorld');

module.exports = function (deployer: any) {
	deployer.deploy(HelloWorld);
};
