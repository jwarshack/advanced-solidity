const hre = require("hardhat");

async function main() {

  const AbiDecode = await hre.ethers.getContractFactory("AbiDecode");
  const abiDecode = await AbiDecode.deploy();

  await abiDecode.deployed();

  const encoded = await abiDecode.encode(1, '0x0C601d27D76e579c0a2124f40502Ef3139f5e3B1', [3,4,5], ["Solidity", [7,9]]);
  console.log(encoded)

  const encodePacked = await abiDecode.encodePacked('AAA');
  console.log(encodePacked)
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
