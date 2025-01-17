// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        // Before startBroadcast => Not a "real" tx
        HelperConfig helperConfig = new HelperConfig();
        address ethIsdPriceFeed = helperConfig.activeNetworkConfig();

        // After startBroadcast => "real" tx
        vm.startBroadcast();
        FundMe fundMe = new FundMe(ethIsdPriceFeed);
        vm.stopBroadcast();
        return fundMe;
    }
}
