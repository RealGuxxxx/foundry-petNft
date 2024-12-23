// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {BasicNft} from "src/BasicNft.sol";
import {DeployBasicNft} from "script/DeployBasicNft.s.sol";

contract BasicNftTest is Test {

    address public user = makeAddr("user");
    string public constant TOKENURI = "https://varied-orange-viper.myfilebase.com/ipfs/QmcajB7qhNoy9RW1nzq726HRZsa6iiLNPhAzZtpUT5Pyde";
    BasicNft public basicNft;
    DeployBasicNft public deployer;

    function setUp() public {
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

    function testNameIsCorrect() public view {
        string memory expected = "Doggie";
        string memory actual = basicNft.name();
        assert(keccak256(abi.encodePacked(expected)) == keccak256(abi.encodePacked(actual)));
    }

    function testCanMintAndHaveABalance() public {
        vm.prank(user);
        basicNft.mintNFT(TOKENURI);

        assertEq(basicNft.balanceOf(user), 1);
        assertEq(TOKENURI, basicNft.tokenURI(0));
    }
}