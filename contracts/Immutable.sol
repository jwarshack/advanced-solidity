//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Immutable {

  // Immutable variables are like constants but can only be declared once when the contract is deployed
  // decalring immutable or constant saves gas
  address public immutable owner = msg.sender;

  uint public x;

  function foo() external {
    require(msg.sender == owner);
  }
}