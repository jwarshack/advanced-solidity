//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

/*

  There are three ways to throw an error in solidity
  require, revert, assert
  - gas refund, state updates are reverted

  custom error - save gas

*/

contract Error {

  function testRequire(uint _i) public pure {
    require(_i <= 10, "i is greater than 10");
  }

// use revert if code is nested in if statements
  function testRevert(uint _i) public pure {
    if (_i > 10) {
      revert("i > 10");
    }
  }

  uint public num = 123;

  // Use assert to check state variable that should never be changed
  function testAssert() public view {
    assert(num == 123);
  }

  function foo(uint _i) public {
    num += 1;
    require(_i < 10);
  }

  error MyError(address caller, uint i);

  function testCustomError(uint _i) public view {
    if (_i > 10) {
      revert MyError(msg.sender, _i);
    }
  
  }

}