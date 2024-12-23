// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {PetNft} from "src/PetNft.sol";
import {DeployPetNft} from "script/DeployPetNft.s.sol";

contract PetNftTest is Test {
    address public user = makeAddr("user");
    DeployPetNft deployer;
    PetNft petNft;
    string public constant CAT_SVG_URI =
        "data:image/svg+xml;base64,PHN2ZwogICAgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIgogICAgdmlld0JveD0iMCAwIDIwMCAyMDAiCiAgICB3aWR0aD0iMjAwIgogICAgaGVpZ2h0PSIyMDAiCj4KICAgIDwhLS0g6IOM5pmvIC0tPgogICAgPHJlY3Qgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgZmlsbD0iI2YwZjBmMCIgLz4KCiAgICA8IS0tIOWwj+eMq+eahOi6q+S9kyAtLT4KICAgIDxlbGxpcHNlIGN4PSIxMDAiIGN5PSIxMzAiIHJ4PSI1MCIgcnk9IjMwIiBmaWxsPSIjZmZjYzAwIiAvPgoKICAgIDwhLS0g5bCP54yr55qE5aS0IC0tPgogICAgPGNpcmNsZSBjeD0iMTAwIiBjeT0iODAiIHI9IjMwIiBmaWxsPSIjZmZjYzAwIiAvPgoKICAgIDwhLS0g5bCP54yr55qE55y8552bIC0tPgogICAgPGNpcmNsZSBjeD0iOTAiIGN5PSI3NSIgcj0iNSIgZmlsbD0iIzAwMCIgLz4KICAgIDxjaXJjbGUgY3g9IjExMCIgY3k9Ijc1IiByPSI1IiBmaWxsPSIjMDAwIiAvPgoKICAgIDwhLS0g5bCP54yr55qE6by75a2QIC0tPgogICAgPHBvbHlnb24gcG9pbnRzPSIxMDAsODUgOTUsOTAgMTA1LDkwIiBmaWxsPSIjZmY2Njk5IiAvPgoKICAgIDwhLS0g5bCP54yr55qE5Zi05be0IC0tPgogICAgPHBhdGggZD0iTTk1LDk1IFExMDAsMTAwIDEwNSw5NSIgc3Ryb2tlPSIjMDAwIiBmaWxsPSJ0cmFuc3BhcmVudCIgLz4KCiAgICA8IS0tIOWwj+eMq+eahOiAs+actSAtLT4KICAgIDxwb2x5Z29uIHBvaW50cz0iODAsNjUgOTAsNTAgODUsNzAiIGZpbGw9IiNmZmNjMDAiIC8+CiAgICA8cG9seWdvbiBwb2ludHM9IjEyMCw2NSAxMTAsNTAgMTE1LDcwIiBmaWxsPSIjZmZjYzAwIiAvPgoKICAgIDwhLS0g5bCP54yr55qE6IOh6aG7IC0tPgogICAgPGxpbmUgeDE9IjcwIiB5MT0iOTAiIHgyPSI5MCIgeTI9IjkwIiBzdHJva2U9IiMwMDAiIC8+CiAgICA8bGluZSB4MT0iMTEwIiB5MT0iOTAiIHgyPSIxMzAiIHkyPSI5MCIgc3Ryb2tlPSIjMDAwIiAvPgoKICAgIDwhLS0g5bCP54yr5Y+8552A55qE54OfIC0tPgogICAgPHJlY3QgeD0iMTIwIiB5PSI5MCIgd2lkdGg9IjMwIiBoZWlnaHQ9IjUiIGZpbGw9IiNjY2MiIC8+CiAgICA8Y2lyY2xlIGN4PSIxNTAiIGN5PSI5Mi41IiByPSIzIiBmaWxsPSIjZmYwMDAwIiAvPgogICAgCiAgICA8cmVjdCB4PSI4NSIgeT0iNDAiIHdpZHRoPSIzMCIgaGVpZ2h0PSIxMCIgZmlsbD0iIzAwMCIgLz4KICAgIDxwb2x5Z29uIHBvaW50cz0iODAsNDAgMTIwLDQwIDEwMCwyMCIgZmlsbD0iIzAwMCIgLz4KPC9zdmc+";

    function setUp() public {
        deployer = new DeployPetNft();
        petNft = deployer.run();
    }

    function testViewTokenURI() public {
        vm.prank(user);
        petNft.mintNft();
        console.log(petNft.tokenURI(0));
    }

    function testFlipPetIntegration() public {
        vm.prank(user);
        petNft.mintNft();
        console.log("Before flip: ", petNft.tokenURI(0));
        vm.prank(user);
        petNft.flipPet(0);
        console.log("After flip", petNft.tokenURI(0));
    }
}
