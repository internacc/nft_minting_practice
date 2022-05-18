//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;
import "@openzeppelin/contracts/token/ERC721/ERC721Full.sol";

//counters is used for counting the tokenid whenever a new nft is minted
import "@openzeppelin/contracts/drafts/Counter.sol";

contract collection is ERC721{
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    constructor() ERC721Full("Dogie", "DOG") public {
    }

    //to mint the new collectible
    //when we mint the nft, we are going to return the id of the token
    function awardItem(address recipient, string memory tokenURI) public returns (uint256) {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
}
