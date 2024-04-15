// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract MorphDecoder {
    function decodeABIForDepositETHTo(bytes calldata datainfo) external pure returns (address _to,uint32 _l2Gas,bytes memory _data) {
         (_to,_l2Gas,_data) = abi.decode(datainfo, (address,uint32,bytes));
        return (_to,_l2Gas,_data);
    }
    // Define a structure to hold details of a batch swap step
    struct BatchSwapStep {
        uint256 nonce;
        address sender;
        address target;
        uint256 value;
        uint256 gasLimit;
        bytes userData;
    }

    // Function to decode the ABI data for a 'finalizeWithdrawalTransaction'
    function decodeABIForfinalizeWithdrawalTransaction(bytes calldata datainfo)
        external
        pure
        returns (BatchSwapStep[] memory txInfo)
    {
        // Decode the incoming data into an array of BatchSwapStep structs
        txInfo = abi.decode(datainfo, (BatchSwapStep[]));
        return txInfo;
    }

}
