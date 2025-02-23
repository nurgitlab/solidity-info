// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract Demo {
    struct Payment {
        uint amount;
        uint timestamp;
        address from;
        string message;
    }


    struct Balance {
        uint totalPayments;
        mapping(uint => Payment) payments;
    }

    mapping(address => Balance) public balances;

    function pay(string memory message) public payable  {
        uint paymentNum = balances[msg.sender].totalPayments;
        balances[msg.sender].totalPayments++;

        Payment memory newPayment = Payment(msg.value,
            block.timestamp,
            msg.sender,
            message
        );



        balances[msg.sender].payments[paymentNum] = newPayment;
    }

    function getPaymentInfo(address addr, uint index) public view returns(Payment memory) {
        return balances[addr].payments[index];
    }


    //================
    bytes32 public myVar = "testavfwevawvfaevawfevafwvwavef";
    bytes public notFixed = "GGG";
    // bytes public myVar;
    //1 -> 32 байт

    function getLength () public view  returns(uint) {
        return notFixed.length;
    }
    



    //Внутри функции нельзя создать динамический массив
    function sampleMemory() public view returns(uint[] memory) {
        uint[] memory localArr = new uint[](10);
        localArr[0] = 1;
        return localArr;
    }
    //==================
    uint[] public arr;
    uint public arrLength;

    function add (uint a) public returns(uint[] memory) {
        arr.push(a);

        uint[] memory mem = arr;
        arrLength = mem.length;
        return mem;
    }

    // В солидити наоборот индексы у матриц идут
   // uint[4][2] public matrix; 2 строки, 4 столбца

    uint[10] public items = [1, 2 , 3];

    function getArraysEl (uint id) public view returns(uint) {
        return items[id];
    }

    function sum() public view returns(uint) {
        uint k = 0;

        for (uint i = 0; i < 20; i++) {
            k+=items[i];
        }

        return k;
    }

    // Enum
    enum Status { Paid, Saived, Pushed}

    Status public currentStatus;

    function demo() public {
        currentStatus = Status.Saived;
    }
}