// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract MorphDecoder {
    function d1ecodeABIForDepositETHToTest(bytes calldata datainfo) external pure returns (uint32 _l2Gas) {
         (_l2Gas) = abi.decode(datainfo, (uint32));
        return (_l2Gas);
    }


    function d2ecodeABIForDepositETHTo(bytes calldata datainfo) external pure returns (uint32 _l2Gas,bytes memory _data) {
         (_l2Gas,_data) = abi.decode(datainfo, (uint32,bytes));
        return (_l2Gas,_data);
    }

    function d3ecodeABIForDepositETH(bytes calldata datainfo) external pure returns (address _to,uint32 _l2Gas,bytes memory _data) {
         (_to,_l2Gas,_data) = abi.decode(datainfo, (address,uint32,bytes));
        return (_to,_l2Gas,_data);
    }

    event LogTxData(uint256 nonce, address sender, address target, uint256 value, uint256 gasLimit, bytes userData);

    struct _tx {
        uint256 nonce;
        address sender;
        address target;
        uint256 value;
        uint256 gasLimit;
        bytes userData;
    }


    function d4ecodeABIForfinalizeWithdrawalTransaction(bytes calldata datainfo)
        external
        returns (_tx memory txInfo)
    {
        txInfo = abi.decode(datainfo, (_tx));
        emit LogTxData(txInfo.nonce, txInfo.sender, txInfo.target, txInfo.value, txInfo.gasLimit, txInfo.userData);
        return txInfo;
    }

    function d5ecodeABIForproveWithdrawalTransaction(bytes calldata data)
        external
        returns (_tx memory transaction, bytes32[32] memory withdrawalProof, bytes32 withdrawalRoot)
    {
        // 解码传入的数据
        (transaction, withdrawalProof, withdrawalRoot) = abi.decode(data, (_tx, bytes32[32], bytes32));
        emit LogTxData(transaction.nonce, transaction.sender, transaction.target, transaction.value, transaction.gasLimit, transaction.userData);
        return (transaction, withdrawalProof, withdrawalRoot);
    }


}
