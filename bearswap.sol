// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract mydecoder {
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

    function decodeABI(bytes calldata data) external pure returns (SwapKind kind, BatchSwapStep[] memory swaps, uint256 deadline) {
        (kind, swaps, deadline) = abi.decode(data, (SwapKind, BatchSwapStep[], uint256));
        return (kind, swaps, deadline);
    }

}
