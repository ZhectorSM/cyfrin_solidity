// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {SimpleStorage} from "./SimpleStorage.sol";

//Contract to examplify inheritage and override

contract AddFiveStorage is SimpleStorage { 


    function store(uint256 _myNumber) public override {
        myNumber = _myNumber + 5;
    }

}