const { expect } = require("chai");
const hre = require("hardhat");

async function main() {

  const [deployer] = await hre.ethers.getSigners();

  const Create2Factory = await hre.ethers.getContractFactory("Create2Factory");
  const create2Factory = await Create2Factory.deploy();

  await create2Factory.deployed();

  const bytecode = await create2Factory.getBytecode(deployer.address);


  const address = await create2Factory.getAddress(bytecode, 777)


  let tx = await create2Factory.deploy(777);

  await tx.wait()


  const eventFilter = create2Factory.filters.Deploy()
  const events = await create2Factory.queryFilter(eventFilter, "latest")
  const deployedAddr = events[0].args[0]

  expect(address).to.equal(deployedAddr)
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
