const { assert } = require("chai");
const hre = require("hardhat");

async function main() {

  const [_, account] = await hre.ethers.getSigners()

  const Receiver = await hre.ethers.getContractFactory("Receiver");
  const receiver = await Receiver.deploy();

  await receiver.transfer(account.address, '10')

  const FunctionSelector = await hre.ethers.getContractFactory("FunctionSelector");
  const functionSelector = await FunctionSelector.deploy();

  let bytes = await functionSelector.getSelector("transfer(address,uint256)");
  console.log(bytes);



}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
