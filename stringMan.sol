// SPDX-License-Identifier: UNLICENSED;
pragma solidity ^0.8.0;

contract stringManipulation{
    string str1 = 'Congratulations';

   //get string function
    function getStr() public view returns(string memory) {
        return str1;
    }

    //get string length function
    function getStrLength() public view returns(uint) {
        bytes memory strB = bytes(str1);
        return strB.length;
    }

    //set string function
    function setStr(string memory str) public {
        str1 = str;
    }

    //concatenate strings function
    function concatStrings(
        string memory _str1, 
        string memory _str2
        ) public pure returns(string memory) {
    return string (abi.encodePacked(_str1,_str2));
    }

    //compare strings function
    function compareStr(
        string memory _str1, 
        string memory _str2
        ) external pure returns(bool){
            return keccak256(abi.encodePacked(_str1)
            ) == keccak256(abi.encodePacked(_str2));
            }

       //reverse string function
    function reverseStr(string memory _str) external pure returns(string memory){
        bytes memory baseByte = bytes(_str);
        string memory tempValue = new string(baseByte.length);
        bytes memory reverse = bytes(tempValue); 
        for(uint i = 0; i < baseByte.length; i++) {
             reverse[baseByte.length - i - 1] = baseByte[i];
             }
             return string(reverse);
             }      

    //convert string to lower case
    function toLowerCase(string memory _str) public pure returns (string memory) {
        bytes memory bString = bytes(_str);
        bytes memory bLowerCase = new bytes(bString.length);
        for (uint j = 0; j < bString.length; j++) {
            // Uppercase character...
            if ((uint8(bString[j]) >= 65) && (uint8(bString[j]) <= 90)) {
                // make it lower by adding 32
                bLowerCase[j] = bytes1(uint8(bString[j]) + 32);
            } else {
                bLowerCase[j] = bString[j];
            }
        }
        return string(bLowerCase);
    }
}  