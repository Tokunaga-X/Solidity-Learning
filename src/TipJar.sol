// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract TipJar {
    address public ownerAddress;

    event TipReceived(address indexed tipper, uint256 amount);
    event TipWithdrawn(address indexed owner, uint256 amount);

    constructor() {
        ownerAddress = msg.sender;
    }

    modifier onlyOwner() {
        require(
            msg.sender == ownerAddress,
            "Sorry, only the owner can call this."
        );
        _;
    }

    function sendTips() public payable {
        require(msg.value > 0, "Sorry, you must send a tip to use this.");

        emit TipReceived(msg.sender, msg.value);
    }

    function withdrawTips() public onlyOwner {
        uint256 contractTipBalance = address(this).balance;
        require(contractTipBalance > 0, "This is no tip to be withdraw.");

        payable(ownerAddress).transfer(contractTipBalance);
        emit TipWithdrawn(ownerAddress, contractTipBalance);
    }

    function getCurrentBalance() public view onlyOwner returns (uint256) {
        return address(this).balance;
    }
}
