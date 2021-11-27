// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <=0.8.10;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
  address public minter;

  event MinterChanged(address indexed from, address to);

  constructor() public payable ERC20("Decentralized festival application", "FES") {
    minter = msg.sender; //only initially
  }

  function passMinterRole(address _minter) public returns (bool) {
  	require(msg.sender==minter, 'Error, only owner can change pass minter role');
  	minter = _minter;

    emit MinterChanged(msg.sender, _minter);
    return true;
  }

  function mint(address account, uint256 amount) public {
		require(msg.sender==minter, 'Error, msg.sender does not have minter role');
		_mint(account, amount);
	}
}