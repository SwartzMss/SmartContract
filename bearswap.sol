// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract bearswapDecoder {
    enum SwapKind {
        GIVEN_IN,
        GIVEN_OUT
    }

    struct BatchSwapStep {
        address poolId;
        address assetIn;
        uint256 amountIn;
        address assetOut;
        uint256 amountOut;
        bytes userData;
    }

    function decodeABIForBtachSwap(bytes calldata data) external pure returns (SwapKind kind, BatchSwapStep[] memory swaps, uint256 deadline) {
        (kind, swaps, deadline) = abi.decode(data, (SwapKind, BatchSwapStep[], uint256));
        return (kind, swaps, deadline);
    }

    function decodeABIForApprove(bytes calldata data) external pure returns (address add,uint256 inputdata) {
        (add, inputdata) = abi.decode(data, (address,uint256));
        return (add, inputdata);
    }
}
