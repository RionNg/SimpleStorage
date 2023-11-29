// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {

    SimpleStorage[] public listOfSimpleStorageContracts;

    function createSimpleStorageContract() public {
        // 'new' keyword is used to create instances of contract types.
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }

    function storageFactoryStore(
        uint256 _simpleStorageIndex,
        uint256 _newSimpleStorageNumber
        ) public 
    {
            listOfSimpleStorageContracts[
                _simpleStorageIndex].store(_newSimpleStorageNumber);
            // SimpleStorage mySimpleStorage 
            //     = listOfSimpleStorageContracts[_simpleStorageIndex];
            // mySimpleStorage.store(_newSimpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex
        ) public view returns(uint256)
    {
        return listOfSimpleStorageContracts[
            _simpleStorageIndex].retrieve();
        // SimpleStorage mySimpleStorage 
        //     = listOfSimpleStorageContracts[_simpleStorageIndex];
        // return mySimpleStorage.retrieve();
    }
}
