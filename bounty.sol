//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract bountyThing is ERC721, ERC721Enumerable, Ownable {
    constructor() ERC721("bountyThing", "BOUNTY") {}

    struct claim {
        uint256 id;
        uint256 votes;
    }
    struct bounty {
        uint256 id;
        uint256 timeStart;
        uint256 voteStart;
        string description;
        bool closed;
        uint256 fund;
        uint256 shares;
        uint256 votes;
        claim[] claims;
    }

    uint256 public bountyNum;
    mapping(uint256 => bounty) bounties;
    mapping(uint256 => uint256[]) bountyClaims;
    mapping(uint256 => mapping(address => uint256)) shares;
    mapping(uint256 => string) _tokenURI;

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256, /* firstTokenId */
        uint256 batchSize
    ) internal virtual override(ERC721, ERC721Enumerable) {
        super._beforeTokenTransfer(from, to, 0, batchSize);
    }

    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC721, ERC721Enumerable) returns (bool) {
        return super.supportsInterface(interfaceId);
    }

    function createBounty(string memory description) public onlyOwner {
        bounties[bountyNum].timeStart = block.timestamp;
        bounties[bountyNum].description = description;
        bountyNum++;
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        _requireMinted(tokenId);
        return _tokenURI[tokenId];
    }

    function fundBounty(uint256 bountyId) public payable {
        bounty storage bounty_ = bounties[bountyId];
        require(!bounty_.closed);
        require(bounty_.voteStart > block.timestamp);
        require(msg.value != 0);
        bounty_.fund += msg.value;
        bounty_.shares += msg.value;
        shares[bountyId][msg.sender] += msg.value;
    }

    function voteBounty(uint256 bountyId, uint256 index) public {
        bounty storage bounty_ = bounties[bountyId];
        require(!bounty_.closed);
        require(bounty_.voteStart <= block.timestamp);
        require(bounty_.claims.length > index);
        require(bounty_.votes <= bounty_.shares * 51 / 100);

        uint256 shares_ = shares[bountyId][msg.sender];
        require(shares_ > 0);
        bounty_.claims[index].votes += shares_;
        shares[bountyId][msg.sender] = 0;
    }

    function createClaim(uint256 bountyId, string memory tokenURI_) public {
        bounty storage bounty_ = bounties[bountyId];
        require(!bounty_.closed);
        require(bounty_.voteStart == 0);
        uint256 tokenId = totalSupply();
        _mint(msg.sender, tokenId);
        bounty_.claims.push(claim(tokenId, 0));
    }

    function rewardBounty(uint256 bountyId) public {
        bounty storage bounty_ = bounties[bountyId];
        require(!bounty_.closed);
        require(bounty_.voteStart <= block.timestamp);
        require(bounty_.votes > bounty_.shares * 51 / 100);
        bounty_.closed = true;
        uint256 awardee;
        uint256 awardeeId;
        for(uint256 i=0; i< bounty_.claims.length; i++) {
            claim memory claim_ = bounty_.claims[i];
            if(claim_.votes > awardee) {
                awardee = claim_.votes;
                awardeeId = claim_.id;
            }
        }
        payable(ownerOf(awardeeId)).call{value: bounty_.fund}("");
    }

    receive() external payable {}
}