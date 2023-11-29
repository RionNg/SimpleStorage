// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract SimpleStorage {

    uint256 myFavoriteNumber;

    // uint256[] listOfFavoriteNumbers;
    struct Person {
        string name;
        uint256 favoriteNumber;
    }

    // --- array ---
    // dynamic array
    Person[] public listOfPeople;
    // static array
    // Person[3] public listOfPeople;

    // Below list isn't a great way to create lists for people.
    // Imagine you have more than 10 friends.
    // Person public pat = Person({favoriteNumber: 7, name: "Pat", message: "Hello!"});
    // Person public bob = Person({favoriteNumber: 9, name: "Bob", message: "Nail it!"});
    // Person public jon = Person({favoriteNumber: 3, name: "Jon", message: "The King!"});

    // --- mapping ---
    // 'mapping' is a key-value store that is often used to create associative arrays or dictionaries.
    // It allows you to efficiently store and retrieve data based on a unique key.
    // Mappings are generally more gas-efficient than arrays for lookups.
    // But they have some limitations, such as not being directly iterable.
    mapping(string => uint256) public nameToFavoriteNumber;
    // mapping(key => value)

    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
    }

    // --- 'view', 'pure' ---
    // view = indicating that they will not modify the state of the contract.
    //      = Use 'view' for functions that need to read the state of the contract but DO NOT modify it
    // pure = indicating that they will not read or modify the state of the contract.
    //      = Use 'pure' for functions that neither read nor modify the state and only depend on provided parameters.
    function retrieve() public view returns(uint256) {
        return myFavoriteNumber;
    }

    // --- calldata, memory, storage ---
    // different areas where you can store data in EVM:
    // calldata - for function parameters and external call data.
    //          - 'calldata' is temporary variables that CANNOT be modified.
    // memory - for temporary data within a function execution. 
    //        - 'memory' is temporary variables that CAN be modified.
    // storage - for persistently storing contract STATE variales.
    //         - 'storage' is permanent variables that can be modified.
    function addPerson(
        string memory _name,
        uint256 _favoriteNumber
        ) public {
            listOfPeople.push(
                Person(_name, _favoriteNumber)
            );
            nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
