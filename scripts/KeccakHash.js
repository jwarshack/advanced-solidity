const { assert } = require("chai");
const hre = require("hardhat");

async function main() {

  const KeccakHash = await hre.ethers.getContractFactory("KeccakHash");
  const keccakHash = await KeccakHash.deploy();

  await keccakHash.deployed();

  const hash = await keccakHash.hash("AAA", 123, '0x0C601d27D76e579c0a2124f40502Ef3139f5e3B1');

  const encodedData = await keccakHash.encode("AAA", "BBB");
  console.log(encodedData)

  const encodedPackedData = await keccakHash.encodePacked("AAA", "BBB");
  console.log(encodedPackedData)

  const collision0 = await keccakHash.collision("AAA", "BBB");
  const collision1 = await keccakHash.collision("AA", "ABBB");

  assert.equal(collision0, collision1)
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
