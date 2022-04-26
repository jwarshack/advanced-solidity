const hre = require("hardhat");

async function main() {

  const Counter = await hre.ethers.getContractFactory("Counter");
  const counter = await Counter.deploy();

  await counter.deployed();

  const CallInterface = await hre.ethres.getContractFactory('CallInterface')

  const callInterface = await CallInterface.deploy()
  await callInterface.deployed()

  const result = await callInterface.examples(counter.address);
  
  console.log(result)

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
