// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract ultiverseDecoder {
    function decodeUltiverse(bytes calldata datainfo) external pure returns (uint256 deadline,uint256 voyageId, uint16[] memory destinations, bytes32 data, bytes memory signatureinfo) {
         (deadline,voyageId,destinations,data,signatureinfo) = abi.decode(datainfo, (uint256,uint256,uint16[],bytes32,bytes));
        return (deadline,voyageId,destinations,data,signatureinfo);
    }

    uint256 deadline = 1709036636;
	uint256 voyageId =203314;
	uint16[] destinations = [2,3,4];
	bytes32 data = 0x9f83f1bdc4255f9a81401c66eeac7004972f75e517c4552738b0e0d9cb2872b4;
	bytes signatureinfo = 0x2c744dd258d055e9aad4814247cdf79aefdeab3bc949f04a08c13ef394b2e6bb3b3a8ff76762691ee59c4d3a8475cd5113079e0bcdf3c21b7ef14d5f4822fa171c;

    function encode() public view returns(bytes memory result) {
        result = abi.encode(deadline, destinations, data, signatureinfo);
    }
}
