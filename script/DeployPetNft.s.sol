// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {PetNft} from "src/PetNft.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployPetNft is Script {

    PetNft public petNft;

    function run() external returns (PetNft) {
        string memory dogSvg = vm.readFile("./img/dog.svg");
        string memory catSvg = vm.readFile("./img/cat.svg");

        vm.startBroadcast();
        petNft = new PetNft(
            svgToImageURI(dogSvg),
            svgToImageURI(catSvg)
        );
        vm.stopBroadcast();
        return petNft;
    }

    function svgToImageURI(string memory svg) public pure returns (string memory) {
        string memory baseURL = "data:image/svg+xml;base64,";
        string memory svgBase64Encode = Base64.encode(bytes(svg));
        return string (abi.encodePacked(baseURL, svgBase64Encode));
    }


}
