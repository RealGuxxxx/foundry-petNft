// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract PetNft is ERC721 {
    error PetNft__CantFlipPetIfNotOwner();

    string private s_dogSvg;
    string private s_catSvg;
    uint256 private s_tokenCounter;

    enum Pet {
        DOG,
        CAT
    }

    mapping(uint256 => Pet) private s_tokenIdToPet;

    constructor(string memory dogSvg, string memory catSvg) ERC721("PetNft", "PET") {
        s_tokenCounter = 0;
        s_dogSvg = dogSvg;
        s_catSvg = catSvg;
    }

    function mintNft() public {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenIdToPet[s_tokenCounter] = Pet.DOG;
        s_tokenCounter++;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        string memory imageURI;
        if (s_tokenIdToPet[tokenId] == Pet.DOG) {
            imageURI = s_dogSvg;
        } else {
            imageURI = s_catSvg;
        }

        string memory tokenMetadata = string(
            abi.encodePacked(
                _baseURI(),
                Base64.encode(
                    bytes(
                        abi.encodePacked(
                            '{"name": "',
                            name(),
                            '", "description": "An NFT Pet", "attributes": [{"trait_type": "Pet", "value": 100}], "image": "',
                            imageURI,
                            '"}'
                        )
                    )
                )
            )
        );
        return tokenMetadata;
    }

    function _baseURI() internal pure override returns (string memory) {
        return "data:application/json;base64,";
    }

    function flipPet(uint256 tokenId) public {
        if (!_isApprovedOrOwner(msg.sender, tokenId)) {
            revert PetNft__CantFlipPetIfNotOwner();
        }
        if (s_tokenIdToPet[tokenId] == Pet.DOG) {
            s_tokenIdToPet[tokenId] = Pet.CAT;
        } else {
            s_tokenIdToPet[tokenId] = Pet.DOG;
        }
    }

    function _isApprovedOrOwner(address spender, uint256 tokenId) internal view returns (bool) {
        if (spender != ownerOf(tokenId) && spender != getApproved(tokenId)) {
            return false;
        } else {
            return true;
        }
    }
}
