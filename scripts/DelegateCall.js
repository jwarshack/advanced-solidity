const { expect } = require("chai");
const hre = require("hardhat");

async function main() {

  const [deployer] = await hre.ethers.getSigners();

  const TestDelegateCall = await hre.ethers.getContractFactory("TestDelegateCall");
  const testDelegateCall = await TestDelegateCall.deploy();

  await testDelegateCall.deployed()

  const DelegateCall = await hre.ethers.getContractFactory("DelegateCall");
  const delegateCall = await DelegateCall.deploy();

  await delegateCall.deployed();

  await delegateCall.setVars(testDelegateCall.address, 123, { value: hre.ethers.utils.parseEther('111')});

  const num = await delegateCall.num()
  const sender = await delegateCall.sender()
  const value = await delegateCall.value()

  console.log(num, sender, value)

  const tNum = await testDelegateCall.num()
  const tSender = await testDelegateCall.sender()
  const tValue = await testDelegateCall.value()

  console.log(tNum, tSender, tValue)

  
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
