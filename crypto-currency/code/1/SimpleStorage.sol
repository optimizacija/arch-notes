// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

contract SimpleStorage {
    /*
    uint256 favoriteNumber = 5;
    bool favoriteBool = true;
    string favoriteString = "string";
    int256 favInt = -5;
    address favAddress = 0xe3e6aAf72a1296532d8Bba558ba5866f4E52C61d;
    bytes32 favBytes = "cat"; // bytes[x] type has max size (x) of 32 and everything below.
    */
    // this will get initialized to 0
    uint256 public favoriteNumber;

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    People public person = People({ favoriteNumber: 2, name: "Patrick"});

    People[] public people;

    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People({favoriteNumber: _favoriteNumber, name: _name}));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
