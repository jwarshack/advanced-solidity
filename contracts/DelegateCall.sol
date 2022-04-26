//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

// A calls B, sends 100 wei
// B delegates call to C

// Code will be executed in contract C with the state variables of contract B

// A ---> B ---> C
  //msg.sender = A
  // msg.value = 100
  // execute code on B's state variables
  // Use ETH in B
contract TestDelegateCall {
  // address public owner;
  uint public num;
  address public sender;
  uint public value;

  function setVars(uint _num) external payable {
    num = 2 * _num;
    sender = msg.sender;
    value = msg.value;
  }
}

contract DelegateCall {
  uint public num;
  address public sender;
  uint public value;

  function setVars(address _test, uint _num) external payable {

    // These two blocks of code will do the same thing

  //   _test.delegatecall(
    // abi.encodeWithSignature("setVars(uint256)", _num)
    // );
  // }
    (bool success, bytes memory data) = _test.delegatecall(
      abi.encodeWithSelector(TestDelegateCall.setVars.selector, _num)
    );

    require(success, 'delegatecall failed');
  }
}