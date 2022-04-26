//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract MultiSigWallet {
  event Deposit(address indexed sender, uint amount);
  event Submit(uint indexed txId);
  event Approve(address indexed owner, uint indexed txId);
  event Revoke(address indexed owner, uint indexed txId);
  event Execute(uint indexed txId);

  struct Transaction {
    address to;
    uint value;
    bytes data;
    bool executed;
  }

  address[] public owners;
  mapping(address => bool) public isOwner;
  // Number of approvals required to execute transaction
  uint public required;

  Transaction[] public transactions;
  mapping(uint => mapping(address => bool)) public approved;

  modifier onlyOwner() {
    require(isOwner[msg.sender], "Caller is not owner");
    _;
  }

  modifier txExists(uint _txId) {
    require(_txId < transactions.length, "Transaction does not exist");
    _;
  }

  modifier notApproved(uint _txId) {
    require(!approved[_txId][msg.sender], "Tx already approved");
    _;
  }

  modifier notExecuted(uint _txId) {
    require(!transactions[_txId].executed, "Transaction already executed");
    _;
  }

  constructor(address[] memory _owners, uint _required) {
    require(_owners.length > 0, "Owners required");
    require(_required > 0 && _required <= _owners.length, "Invalid required number of owners");

    for (uint i; i < _owners.length; i ++) {
      address owner = _owners[i];
      require(owner != address(0), "Invalid owner");
      require(!isOwner[owner], "Owner is not unique");

      isOwner[owner] = true;
      owners.push(owner);

    }

    required = _required;
  }

  receive() external payable {
    emit Deposit(msg.sender, msg.value);
  }


  function submit(address _to, uint _value, bytes calldata _data)
    external
    onlyOwner
    {
      transactions.push(Transaction({
        to: _to,
        value: _value,
        data: _data,
        executed: false
      }));

      emit Submit(transactions.length - 1);

    }

  function approve(uint _txId)
    external
    onlyOwner 
    txExists(_txId)
    notApproved(_txId)
    notExecuted(_txId)
    {

    }
}