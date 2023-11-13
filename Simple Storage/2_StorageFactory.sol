// SPDX-License-Identifier: MIT

pragma solidity ^0.8.22;

import {SimpleStorage} from "./1_SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public listOfSimpleStorageContracts;

    function createSimpleStorageContact() public {
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }

    function sfStore(
    uint256 _simpleStorageIndex,
    uint256 _newSimpleStorageNumber) public {
        listOfSimpleStorageContracts[_simpleStorageIndex].store(_newSimpleStorageNumber);
        // SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        // mySimpleStorage.store(_newSimpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
        // SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        // return mySimpleStorage.retrieve();
    }

}
