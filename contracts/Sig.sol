//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

/*
0. Message to sign
1. hash(message)
2. Sign(hash(message), private key) | offchain
3. erecover(hash(message), signature) == signer
*/

contract VerifySig {
  /* If the signature is valid, and the signature returned from ecrecover matches _signer - return true
  */

  function verify(
    address _signer, 
    string memory _message,
    bytes memory _sig
  ) external pure returns (bool)
  {
    bytes32 messageHash = getMessageHash(_message);
    bytes32 ethSignedMessageHash = getEthSignedMessageHash(messageHash);

    return recover(ethSignedMessageHash, _sig) == _signer;
  }

  function getMessageHash(
    string memory _message
  ) public pure returns (bytes32)
  {
    return keccak256(abi.encodePacked(_message));
  }

  function getEthSignedMessageHash(
    bytes32 _messageHash
  ) public pure returns (bytes32) {
    return keccak256(abi.encodePacked(
      "\x19Ethereum Signed Message:\n32",
      _messageHash
    ));
  }

  function recover(
    bytes32 _ethSignedMessageHash,
    bytes memory _sig
  ) public pure returns (address)
  {
    // r and s are cryptographic parameters for signatures
    (bytes32 r, bytes32 s, uint8 v) = _split(_sig);
    return ecrecover(_ethSignedMessageHash, v, r, s);
  }

  function _split(
    bytes memory _sig
  ) internal pure returns (bytes32 r, bytes32 s, uint8 v)
  {
    require(_sig.length == 65, "Invalid signature length");

  }

   
}