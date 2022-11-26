// The Open Zeppelin upgrades plugin adds the `upgrades` property
// to the Hardhat Runtime Environment.
const { ethers, network, upgrades } = require("hardhat");

async function main() {
 // Obtain reference to contract and ABI.
 const ChocoTokenContract = await ethers.getContractFactory("ChocoToken");
 console.log("Deploying ChocoToken to ", network.name);

 // Get the first account from the list of 20 created for you by Hardhat
 const [account1] = await ethers.getSigners();

 // Deploy logic contract using the proxy pattern.
 const ChocoToken = await upgrades.deployProxy(
  ChocoTokenContract,

   // Since the logic contract has an initialize() function
   // we need to pass in the arguments to the initialize()
   // function here.
   [account1.address],

   // We don't need to expressly specify this
   // as the Hardhat runtime will default to the name 'initialize'
   { initializer: "initialize" }
 );
 await ChocoToken.deployed();

 console.log("ChocoToken deployed to:", ChocoToken.address);
}

main();