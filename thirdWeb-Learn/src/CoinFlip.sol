// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract CoinFlip {
    enum CoinSide { FAN, ZHENG }
    enum GuessResult { WRONG, RIGHT }

    event Result(address indexed player, CoinSide chosenSide, GuessResult guessResult);

    function flipCoinAndGuess(CoinSide chosenSide) public {
        // generate random 0/1 as coin flip result
        uint256 randomNumber = uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender))) % 2;

        CoinSide coinFlipResult = CoinSide(randomNumber);

        GuessResult guessResult = chosenSide == coinFlipResult ? GuessResult.RIGHT : GuessResult.WRONG;

        emit Result(msg.sender, chosenSide, guessResult);
    }
}
