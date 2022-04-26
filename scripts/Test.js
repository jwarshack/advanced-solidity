const { assert } = require("chai");
const hre = require("hardhat");

async function main() {

  const [deployer, account] = await hre.ethers.getSigners()

  const NFT = await hre.ethers.getContractFactory("MaliciousNFT");
  const nft = await NFT.deploy();

  await nft.deployed()

  const Test = await hre.ethers.getContractFactory("Test")
  const test = await Test.deploy()
  await test.deployed()

  await test.callContract(nft.address, deployer.address, account.address, 1)

  const i = await nft.i()

  console.log(i.toString())







}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
