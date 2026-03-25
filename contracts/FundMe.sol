// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;


import {PriceConverter} from "./PriceConverter.sol";


contract FundMe {


    using PriceConverter for uint256;

    uint256 minUsd = 5e18;
    address[] funders;
    mapping (address funder => uint256 amount) public funderToAmount;


    function fund () public  payable {     
     
        require(msg.value.convertEthToUsd() >= minUsd, "Did not send enought ETH");

        //Register funders
        funders.push(msg.sender);
        funderToAmount[msg.sender] = funderToAmount[msg.sender] + msg.value;//Prev balance + new funds

    }


    function withdraw () public {

        for(uint256 idx; idx < funders.length; idx++){
            address funder = funders[idx];
            funderToAmount[funder] = 0;
        }

    }
    

}