// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract Demo {
    bool public  myBool = true; //state, по умолчанию false
    uint8 public counter = 10;

    // uint - только положительное
    // по умолчанию uint256

    //uint8 - минимальное число


    function myFunc(uint8 a) public {
        uint8 min = type(uint8).min;

        //в солидити если переполнение, то будет ошибка, деньги вернутся назад
        //чтобы пробить круг надо заюзать unchecked
        unchecked {
            counter+=a;
        }
    }
}