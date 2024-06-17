// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Array {
    uint[] private balances;

    function addBalance(uint value) external {
        balances.push(value);
    }

    function deleteBalance(uint i) external {
        delete balances[i];
    }

    function readBalance(uint i) external view returns (uint) {
        return balances[i];
    }

    // function readWholeBalances() external view returns (uint[]) {
    //     return balances;
    // }

    function updateBalances(uint i, uint newValue) external {
        balances[i] = newValue;
    }
}
