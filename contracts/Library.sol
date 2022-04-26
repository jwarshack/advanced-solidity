//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

library Math {

  function max(uint x, uint y) internal pure returns (uint) {
    return x >= y ? x : y;
  }

}

// contract Test {
//   function TestMax(uint x, uint y) external pure returns (uint) {
//     return Math.max(x, y);
//   }
// }

library ArrayLib {
  function find(uint[] storage arr, uint x) internal view returns (uint) {
    for (uint i = 0; i < arr.length; i++) {
      if (arr[i] == x) {
        return i;
      }
    }
    revert("Not Found");
  }
}

contract TestArray {
  using ArrayLib for uint[];
  uint[] public arr = [3,2,1];

  function testFind() external view returns (uint i) {

    arr.find(2);
    

  }
}