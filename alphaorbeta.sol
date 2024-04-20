// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract DecodeParams {
    struct Params {
        bytes32 param1;
        uint256 param2;
        uint256 param3;
        uint256 param4;
        address param5;
        uint256 param6;
        uint256 param7;
        uint256 param8;
        bytes32 param9;
        bytes32 param10;
        uint256 param11;
    }
    // 定义一个事件，用于输出Params结构体中的所有参数
    event ParamsDecoded(
        bytes32 param1,
        uint256 param2,
        uint256 param3,
        uint256 param4,
        address param5,
        uint256 param6,
        uint256 param7,
        uint256 param8,
        bytes32 param9,
        bytes32 param10,
        uint256 param11
    );
    function decodeABIForDepositETHToTest(bytes calldata datainfo) external  returns (Params memory) {
        Params memory params = abi.decode(datainfo, (Params));
                // 触发事件，将解码后的参数作为事件参数传出
        emit ParamsDecoded(
            params.param1,
            params.param2,
            params.param3,
            params.param4,
            params.param5,
            params.param6,
            params.param7,
            params.param8,
            params.param9,
            params.param10,
            params.param11
        );
        return params;
    }
}