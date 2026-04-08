// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;


import {PriceConverter} from "./PriceConverter.sol";


error NotOwner();

contract FundMe {


    using PriceConverter for uint256;

    uint256 constant MIN_USD = 5e18;
    address[] funders;
    mapping (address funder => uint256 amount) public funderToAmount;
    address public immutable i_owner;


    constructor(){
        i_owner = msg.sender;
    }


    function fund () public  payable {     
     
        require(msg.value.convertEthToUsd() >= MIN_USD, "Did not send enought ETH");

        //Register funders
        funders.push(msg.sender);
        funderToAmount[msg.sender] = funderToAmount[msg.sender] + msg.value;//Prev balance + new funds

    }


    function withdraw () public onlyOwner {

       

        //Reset mapping
        for(uint256 idx; idx < funders.length; idx++){
            address funder = funders[idx];
            funderToAmount[funder] = 0;
        }

        //Reset array
        funders = new address[](0);


        //Transfering the money
        //Transfer
        //payable(msg.sender).transfer(address(this).balance);
        //Send 
        //bool successTx = payable(msg.sender).send(address(this).balance);
        //require(successTx, "Tx failed");
        //call - low level instruction - recomended
        (bool successfulTx,) = payable(msg.sender).call{value: address(this).balance}("");
        require(successfulTx, "Tx failed");

    }


    modifier onlyOwner(){
        //require(i_owner == msg.sender, "Must be owner");
        //Error is gas efficient than required
        if(i_owner != msg.sender) { 
            revert NotOwner();
        }
        _;//Execute the rest of the method
    }

}