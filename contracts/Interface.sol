//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

/*

  Use interfaces when you want to call a function in another contract without having its code

*/

contract Counter {
  uint public count;

  function inc() external {
    count +=1;
  }

  function dec() external {
    count -= 1;
  }
}

interface ICounter {
  function count() external view returns (uint);

  function inc() external;
}

contract CallInterface {

  uint public count;

  function examples(address _counter) external {
    ICounter(_counter).inc();
    count = ICounter(_counter).count();
  }
}

