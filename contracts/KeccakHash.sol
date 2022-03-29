//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract KeccakHash {
  function hash(
    string memory text, 
    uint num, 
    address addr
  ) external pure returns (bytes32)
  {
    // Keccack function takes bytes as a input
    // Returns bytes
    return keccak256(abi.encodePacked(text, num, addr));
  }

  function encode(
    string memory text0,
    string memory text1
  ) external pure returns (bytes memory)
  {
    return abi.encode(text0, text1);
  }

  function encodePacked(
    string memory text0,
    string memory text1
  ) external pure returns (bytes memory)
  {
    return abi.encodePacked(text0, text1);
  }

  /* 
    Because encode packed loses some data, two different inputs can lead to hash collisions
      - Inputs "AAA", "BBB" will give the same hash as "AA", "ABBB"
    * This collision can be fixed by either replacing encodePacked with encode or making sure two dynamic data types are not next to eachother (adding a new uint in between them)
  */
  function collision(
    string memory text0,
    string memory text1
  ) external pure returns (bytes32)
  {
    return keccak256(abi.encodePacked(text0, text1));
  }
}