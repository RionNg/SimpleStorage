// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage {
    // +5
    // overrides: virtual / override
    // virtual = used in the BASE CONTRACT to allow derived contracts to 'override' a function.
    // override = used in the DERIVED contract to explicitly indicate that a function
    //            is intended to override a 'virtual' function in the base contract.

    function store(uint256 _newFavoriteNumber) public override {
        myFavoriteNumber = _newFavoriteNumber + 5;
    }
}
