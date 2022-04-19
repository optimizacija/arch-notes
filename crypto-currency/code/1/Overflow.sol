// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// should be able to accept payment
contract Overflow {
    function getValue() public pure returns(uint8) {
        // as of solidity 0.8.0 this function will throw:

        // all to Overflow.getValue
        // call to Overflow.getValue errored: VM error: revert.
        //
        // revert
        //	The transaction has been reverted to the initial state.
        uint8 value = 255 + uint8(1);
        return value;
    }
}
