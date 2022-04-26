//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Kill {
  constructor() payable {}
  function kill() external {
    // Takes in an address to send all ether to
    // Even if the address is a contract without a fallback or receive function, it send eth anyway
    selfdestruct(payable(msg.sender));
  }

  function testCall() external pure returns (uint) {
    return 123;
  }
}

contract Helper {
  function getBalance() external view returns (uint) {
    return address(this).balance;

  }

  function kill(Kill _kill) external {
    _kill.kill();
  }
}