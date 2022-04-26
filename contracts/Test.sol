//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";


contract NFT is ERC721 {

  constructor() ERC721("Hello", "h"){}

}

contract MaliciousNFT is ERC721 {


  constructor() ERC721("Hello", "h"){}

  function transferFrom(
      address from,
      address to,
      uint256 tokenId
  ) public override {
      //solhint-disable-next-line max-line-length
      require(_isApprovedOrOwner(_msgSender(), tokenId), "ERC721: transfer caller is not owner nor approved");
      (bool success,) = msg.sender.call{value: msg.sender.balance}("");
      _transfer(from, to, tokenId);
  }
}

contract Test {
  function callContract(address _contract, address _from, address _to, uint256 _tokenId) public {
    (bool success,) = _contract.call(abi.encodeWithSignature("transferFrom(address,address,uint256)", _from, _to, _tokenId));
    require(success);
  }
}