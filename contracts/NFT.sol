// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.28;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";

contract NFT is ERC721, Ownable {
    uint256 tokenCount;

    constructor(
        string memory _name,
        string memory _symbol
    ) ERC721(_name, _symbol) Ownable(msg.sender) {
        mint(msg.sender);
    }

    function mint(address _to) public onlyOwner returns (bool) {
        uint256 tokenId = tokenCount + 1;

        _safeMint(_to, tokenId);

        tokenCount = tokenId;

        return true;
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        string memory uri = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name": "',
                        name(),
                        " #",
                        Strings.toString(tokenId),
                        '",',
                        '"description": "MY NFT",',
                        '"image": "data:image/svg+xml;base64,',
                        Base64.encode(bytes(SVGImage())),
                        '"}'
                    )
                )
            )
        );

        return string(abi.encodePacked("data:application/json;base64,", uri));
    }

    function SVGImage() internal pure returns (string memory) {
        
      return  
    "<svg width='200' height='100' xmlns='http://www.w3.org/2000/svg'>"
    "<rect width='100%' height='100%' fill='red' />"
    "<text x='10' y='30' font-family='Arial' font-size='24' fill='white'>OSENI</text>"
    "</svg>";
    }
}