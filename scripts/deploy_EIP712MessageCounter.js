// deploy_EIP712MessageCounter.js
// 2022-11-26 | CR

// The Open Zeppelin upgrades plugin adds the `upgrades` property
// to the Hardhat Runtime Environment.
const { ethers, network, upgrades } = require("hardhat");

async function main() {
 // Obtain reference to contract and ABI.
 const EIP712MessageCounterContract = await ethers.getContractFactory("EIP712MessageCounter");
 console.log("Deploying EIP712MessageCounter to ", network.name);

 // Get the first account from the list of 20 created for you by Hardhat
 const [account1] = await ethers.getSigners();

 // Deploy logic contract using normal.
 const EIP712MessageCounter = await EIP712MessageCounterContract.deploy();
 await EIP712MessageCounter.deployed();

 console.log("EIP712MessageCounter deployed to:", EIP712MessageCounter.address);
}

main();