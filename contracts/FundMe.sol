// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;


import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";


contract FundMe {


    uint256 minUsd = 5e18;

    function fund () public  payable {

        
        uint256 ethInUsd = convertEthToUsd(msg.value);
        require(ethInUsd >= minUsd, "Did not send enought ETH") ;

    }


    function withdraw () public {
    }


    /*Function to convert ETH to USD*/
    function convertEthToUsd(uint256 _ethValue) internal view returns (uint256) {

        /*
            Example
            1 ETH -> 2000_0000000000_00000000

            (2000_0000000000_00000000 * 1_0000000000_00000000) / 1e18 
            2000_0000000000_00000000 = 1 ETH

        */

        AggregatorV3Interface dataFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);

        (
        /* uint80 roundId */
        ,
        int256 answer,
        /*uint256 startedAt*/
        ,
        /*uint256 updatedAt*/
        ,
        /*uint80 answeredInRound*/
        ) = dataFeed.latestRoundData();
          
        // ETH/USD rate in 18 digit  - ETH price in term of USD
        uint256 ethPrice =  uint256(answer * 1e10);//2000_0000000000_00000000
      
        return (ethPrice * _ethValue) / 1e18;//(2000_0000000000_00000000 * 1_0000000000_00000000) / 1e18   = 2000_0000000000_00000000

    }

}