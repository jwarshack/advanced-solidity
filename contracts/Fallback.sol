//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

/*

  Fallback is a function that gets called when you call a function that does not exist in the smart contract

  Main use is to enable direct sending of ether

  fallback() or receive()

      Ether is send to contract
                |
          is msg.data empty?
                / \
              yes no
              /    \
receive() exists?  fallback()
          / \
        yes no
        /    \ 
receive()   fallback()
*/


contract Fallback {

  event Log(string func, address sender, uint value, bytes data);
  
  fallback() external payable {
    emit Log("fallback", msg.sender, msg.value, msg.data);
  }

  // Receive is executed when the data that is sent is empty
  receive() external payable {
    emit Log("receive", msg.sender, msg.value, "");
  }

}


