pragma solidity ^0.4.4;

contract HelloWorld {

  address public owner;
  mapping ( address => uint) balances;

  function HelloWorld() {
    //Takes on the value of the address for the person who calls the contract
    owner = msg.sender;
    balances[owner] = 1000;
  }

  event voteCast(address _to, uint _value, address owner);

  function transfer(address _to, uint _value) returns (bool success) {
    voteCast(_to, _value, owner);
    
    if (balances[msg.sender] < _value) {
      return false;
    }

    balances[msg.sender] -= _value;
    balances[_to] += _value;
    return true;
  }

  //Constant says that this is a function that doesn't change the state of the blockchain.
  function getBalance(address _user) constant returns (uint) {
    return balances[_user];
  }

}
