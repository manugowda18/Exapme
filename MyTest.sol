//SPDX-License-Identifier: MIT

pragma solidity  ^0.8.18;

import "hardhat/console.sol";

contract  MyTest{

    uint256 public unlockedTime;
    address payable public owner;

    event Withdraw(uint256 amount, uint256 when);
    constructor(uint256 _unlockedTime) payable {
        require(block.timestamp>= _unlockedTime, "timestamp");

        unlockedTime = _unlockedTime;
        owner = payable(msg.sender);
    }

    function withdraw()  public {
        require(block.timestamp>= unlockedTime, "wait for complete");
        require(msg.sender == owner, "not owner");

        emit Withdraw(address(this).balance,block.timestamp);
        owner.transfer(address(this).balance);
    }
}