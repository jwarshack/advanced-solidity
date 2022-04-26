//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract TestCall {
  string public message;
  uint public x;

  event Log(string message);

  fallback() external payable {
    emit Log("fallback was called");
  }


  function foo(string memory _message, uint _x) external payable returns (bool, uint) {
    message = _message;
    x = _x;
    return (true, 999);
  }
}


contract Call {
  bytes public data;
  function callFoo(address _testCall) external payable {
    (bool success, bytes memory _data) = _testCall.call{value: 111, gas: 5000}(abi.encodeWithSignature("foo(string,uint256)", "call foo", 123));
    require(success, "Call failed");
    data = _data;


  }

  function callDoesNotExist(address _testCall) external {
    (bool success, bytes memory _data) = _testCall.call(abi.encodeWithSignature("baz()"));

    require(success, "Call failed");
  }
}