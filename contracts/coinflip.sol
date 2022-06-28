// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "hardhat/console.sol";
contract CoinFlip{

    constructor(){
        console.log("I'm alive at address ", address(this));
    }

    receive() external payable {}

    function getBalance() public view returns(uint){
        console.log(address(this).balance);
        return address(this).balance;
    }
    

    function flip() public payable returns(bool){
        require(msg.value <= .5 ether, "Too much money is on the line, sorry.");
        require(address(this).balance > 3*(msg.value), "contract does not have enough funds to play.");
        
        uint256 payout = msg.value * 2;
        console.log("congrats! you won... this time");
        
        //transferring wei
        //have to be appended to an address, where the address is the recipient and the executing contract is the sender.
        address(msg.sender).transfer(payout);

        console.log(payout,"amount of wei was sent to", address(msg.sender));
        return true;
    }
}
