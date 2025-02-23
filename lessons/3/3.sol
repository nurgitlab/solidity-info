// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract Demo {
    //address - отдельный тип данных
    address public myAddress = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2; //есть у аккаунтов и смартконтрактов

    mapping (address => uint) public payments; //мапа в солидити
    //если ничего не написать в payable функции, то деньги упадут на текущий счёт
    function getBalance (address targetAddress) public view returns(uint) {
        return targetAddress.balance;
    }

    function getLocalBalance () public view returns(uint) {
        return payments[msg.sender];
    }

    function receiveMoney() public payable {
        payments[msg.sender]+=msg.value;
    } 
    
    
    string public myStr = "testStringBlaBlaBla"; //store

    //большие данные храним вне блокчейна

    function demo(string memory newValue) public returns(bytes memory){
        return bytes(newValue);
    }


    function transferTo(address transferAddress, uint sum) public  {
        address payable _to = payable(transferAddress);

        _to.transfer(sum);
    }
}