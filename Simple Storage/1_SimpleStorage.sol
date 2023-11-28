// SPDX-License-Identifier: MIT

pragma solidity 0.8.22;

contract SimpleStorage {
    uint256 public myFavoriteNumber = 0;

    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    // dynamic array
    Person[] public listOfPeople;
    // Person public pat = Person({favoriteNumber: 7, name: "pat"});
    // Person public mariah = Person({favoriteNumber: 16, name: "Mariah"});
    // Person public jon = Person({favoriteNumber: 12, name: "Jon"});

    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public virtual {
        myFavoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns(uint256) {
        return myFavoriteNumber;
    }
    
    function addPerson(
        string memory _name, 
        uint256 _favoriteNumber
        ) public 
    {
        listOfPeople.push( Person(_favoriteNumber, _name) );
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
