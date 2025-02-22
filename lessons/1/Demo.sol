// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract MyShop {
    address public owner;
    mapping (address => uint) public payments;

    constructor() {
        owner = msg.sender; //msg - глобальный объект
    } // вызовется только 1 раз во время размещения в блокчейне

    // payable - функции куда могут прийти деньги
    function payForItem() public payable {
        payments[msg.sender] = msg.value;
    }

    function withDrawAll() public {
        address payable _to = payable (owner);
        address _thisContract = address(this);

        _to.transfer(_thisContract.balance);
    }
}