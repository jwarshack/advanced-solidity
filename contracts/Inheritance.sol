//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

/* 
  functions that are inherited need to be declared as virtual

*/

contract A {
  function foo() public pure virtual returns (string memory) {
    return "A";
  }

  function bar() public pure virtual returns (string memory) {
    return "B";
  }
}

contract B is A {

  function foo() public pure override returns (string memory) {
    return "B";
  }


  function bar() public pure override returns (string memory) {
    return "B";
  }
  
  

}