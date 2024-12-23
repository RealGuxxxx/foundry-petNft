// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {BasicNft} from "src/BasicNft.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

contract MintBasicNft is Script {

    string public constant TOKENURI = "https://varied-orange-viper.myfilebase.com/ipfs/QmcajB7qhNoy9RW1nzq726HRZsa6iiLNPhAzZtpUT5Pyde";
    
    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("BasicNft", block.chainid);
        mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address contractAddr) public {
        vm.startBroadcast();
        BasicNft(contractAddr).mintNFT(TOKENURI);
        vm.stopBroadcast();
    }
}