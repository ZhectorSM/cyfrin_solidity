// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SimpleStorage {

    //Datatypes   
    bool hasFavoriteNumber = true;
    uint256 favoriteNumber = 88; //Unsigned - only positive values, default 0
    int256 favNumber = -5;
    string favNumberString = "twenty";
    address favAddres = 0xC2076A08bCe8B5FD9128Df8F25F4307df2f2F29f;
    bytes32 favoritebytes = "32";


    //Function
    uint256 public myNumber;

    function store(uint256 _myNumber) public {
        myNumber = _myNumber;
    }

    //view - only reads the state (reads a store variable)     
    function getMyNumber() public view returns (uint256) {
        return myNumber;
    }

    //pure - Do not read state
    function getANumber() public pure returns (uint256) {
        return 8;
    }


    //Struct - object
    struct Person{
        string name;
        uint favNum;       
    }

    Person public person1 = Person("P1", 5);

    //Array
    Person[] public personArr;

    function addPerson(string memory _name, uint256 _fNum) public {
        personArr.push(Person(_name, _fNum));
        nameToFavNumber[_name] = _fNum;
    }


    //Mappings
    mapping (string => uint256) public nameToFavNumber;



}