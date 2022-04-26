//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract FunctionSelector {
  function getSelector(string calldata _func) external pure returns (bytes4) {
    return bytes4(keccak256(bytes(_func)));
  }
}

contract Receiver {
  event Log(bytes data);

  function transfer(address _to, uint _amount) external {
    emit Log(msg.data);
    // First 4 bytes encodes the function to call (function selector)
    // 0xa9059cbb
    // this corresponds to the address we passed
    // 00000000000000000000000070997970c51812dc3a010c7d01b50e0d17dc79c
    // This is the amount passed in
    // 8000000000000000000000000000000000000000000000000000000000000000a
  }
}