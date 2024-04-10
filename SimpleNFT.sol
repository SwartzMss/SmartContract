// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Counters.sol";

contract SimpleNFT is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    address public owner;

    mapping(address => bool) public whitelist;

    constructor() ERC721("SimpleNFT", "SNFT") {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function.");
        _;
    }

    modifier onlyWhitelistedOrOwner() {
        require(whitelist[msg.sender] || msg.sender == owner, "Not whitelisted or owner");
        _;
    }

    function addToWhitelist(address _address) public onlyOwner {
        whitelist[_address] = true;
    }

    function removeFromWhitelist(address _address) public onlyOwner {
        whitelist[_address] = false;
    }

    // 修改后的mintNFT，允许白名单上的地址或合约拥有者mint
    function mintNFT(address recipient) public onlyWhitelistedOrOwner returns (uint256) {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(recipient, newItemId);

        if (whitelist[msg.sender]) {
            removeFromWhitelist(msg.sender); // 如果是白名单上的地址mint，则移除白名单
        }

        return newItemId;
    }
}
