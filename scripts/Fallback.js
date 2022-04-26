const hre = require("hardhat");

async function main() {

  const [_, sender] = await hre.ethers.getSigners()

  const Fallback = await hre.ethers.getContractFactory("Fallback");
  const fallback = await Fallback.deploy();

  await fallback.deployed();


  // passing in data

  await sender.sendTransaction({
    to: fallback.address,
    value: hre.ethers.utils.parseEther("0.4"),
    data: "0x121212"
  })
// No data
  await sender.sendTransaction({
    to: fallback.address,
    value: hre.ethers.utils.parseEther("0.4")
  })


  const filter = fallback.filters.Log()
  const events = await fallback.queryFilter(filter)

  console.log(events)


  



}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
