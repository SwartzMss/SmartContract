// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract ultiverseDecoder {
    function decodeUltiverse(bytes calldata datainfo) external pure returns (uint256 deadline,uint256 voyageId, uint16[] memory destinations, bytes32 data, bytes memory signatureinfo) {
         (deadline,voyageId,destinations,data,signatureinfo) = abi.decode(datainfo, (uint256,uint256,uint16[],bytes32,bytes));
        return (deadline,voyageId,destinations,data,signatureinfo);
    }
}
