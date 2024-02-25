// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;



contract A {
    function encodewithsignalAndCall(address _addr, uint256 x) external  returns (uint256){
        (bool success,bytes memory data) = _addr.call(abi.encodeWithSignature("setX(uint256)", x));
        require(success);

        uint256 myx = abi.decode(data,(uint256));
        return  myx;
    }

    function encodewithSelectorAndCall(address _addr, uint256 x) external  returns (uint256){
        //bytes4 myselector = bytes4(keccak256("setX(uint256)"));
        bytes4 myselector = B.setX.selector;
        (bool success,bytes memory data) = _addr.call(abi.encodeWithSelector(myselector, x));
        require(success);

        uint256 myx = abi.decode(data,(uint256));
        return  myx;
    }
}


contract B {
    uint public x = 0;

    function setX(uint256 aa) external returns (uint256){
        x = aa;
        return x + 1;
    }
}