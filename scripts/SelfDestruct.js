const { assert } = require("chai");
const hre = require("hardhat");

async function main() {

  const Kill = await hre.ethers.getContractFactory("Kill");
  const kill = await Kill.deploy({value: hre.ethers.utils.parseEther('1')});

  await kill.deployed()

  const Helper = await hre.ethers.getContractFactory("Helper")
  const helper = await Helper.deploy()
  await helper.deployed()

  let bal = await helper.getBalance()
  console.log("prev bal", bal)

  await helper.kill(kill.address)

  bal = await helper.getBalance()
  console.log("post bal", bal)







}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
