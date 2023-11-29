// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract SimpleStorage {

    uint256 myFavoriteNumber;

    // uint256[] listOfFavoriteNumbers;
    struct Person {
        uint256 favoriteNumber;
        string name;
        string message;
    }

    // dynamic array
    Person[] public listOfPeople;

    // static array
    // Person[3] public listOfPeople;

    // Below list isn't a great way to create lists for people.
    // Imagine you have more than 10 friends.
    // Person public pat = Person({favoriteNumber: 7, name: "Pat", message: "Hello!"});
    // Person public bob = Person({favoriteNumber: 9, name: "Bob", message: "Nail it!"});
    // Person public jon = Person({favoriteNumber: 3, name: "Jon", message: "The King!"});

    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
    }

    // view = indicating that they will not modify the state of the contract.
    //      = Use 'view' for functions that need to read the state of the contract but DO NOT modify it
    // pure = indicating that they will not read or modify the state of the contract.
    //      = Use 'pure' for functions that neither read nor modify the state and only depend on provided parameters.
    function retrieve() public view returns(uint256) {
        return myFavoriteNumber;
    }

    function addPerson(
        uint256 _favoriteNumber, 
        string memory _name, 
        string memory _message
        ) public {
            listOfPeople.push(
                Person(_favoriteNumber, _name, _message)
            );
    }
}
