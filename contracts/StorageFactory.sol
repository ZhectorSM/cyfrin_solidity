// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;


import {SimpleStorage} from "SimpleStorage.sol";


contract StorageFactory {


    SimpleStorage[] public simpleStorageArr;

    function createSimpleStorageContract() public {
        SimpleStorage ss = new SimpleStorage();
        simpleStorageArr.push(ss);
    }

    function sfSet(uint256 _contractIdx, uint256 _favNum) public {
        simpleStorageArr[_contractIdx].store(_favNum);  
    }

    function sfGet(uint256 _contractIdx) public view returns (uint256){
        return simpleStorageArr[_contractIdx].getMyNumber();  
    }


}