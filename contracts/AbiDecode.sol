//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract AbiDecode {
  struct MyStruct {
    string name;
    uint[2] nums;
  }

  // abi.encode encodes the data into bytes
  function encode(
    uint x,
    address addr,
    uint[] calldata arr,
    MyStruct calldata myStruct
  ) external pure returns (bytes memory) {
    return abi.encode(x, addr, arr, myStruct);
  }

  // abi.encodePacked encodes the data into bytes
  // Output is smaller but loses some of the data
  function encodePacked(
    string calldata text0,
    string calldata text1
  ) external pure returns (bytes memory) {
    return abi.encodePacked(text0, text1);
  }

  // abi.decode decodes the bytes data into human readable
  function decode(
    bytes calldata data
  ) external pure returns (
    string memory text0,
    string memory text1
  ) 
  {
    (text0, text1) = abi.decode(data, (string, string));
  }
   
}
