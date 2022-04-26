//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

/*
  What is Front Running?
  Alice sends transaction and it is kept in the mining pool
  Eve sends a transaction after Alice and it is in the mining pool

  The miner adds both Alice and Eve's transactions to be included in the next block but because Eve paid a higher fee then Eve's transaction is in front of Alice's

*/
