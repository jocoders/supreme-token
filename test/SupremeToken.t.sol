// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {SupremeToken} from "../src/SupremeToken.sol";

contract SupremeTokenTest is Test {
    SupremeToken public token;
    address public owner;
    address public nonOwner = address(0x2);
    address public recipient = address(0x3);
    uint256 private constant ETHER_AMOUNT = 1000 ether;

    function setUp() public {
        owner = address(this);
        token = new SupremeToken();
        token.transfer(nonOwner, ETHER_AMOUNT);
    }

    function testInitialMint() public view {
        uint256 balance = token.balanceOf(owner);
        assertEq(
            balance, token.INITIAL_SUPPLY() - ETHER_AMOUNT, "Balance should be initial supply minus transferred amount"
        );
    }

    function testOwnerCanTransferTokensInGodMode() public {
        uint256 ownerBalanceBefore = token.balanceOf(owner);
        uint256 recipientBalanceBefore = token.balanceOf(recipient);

        vm.prank(owner);
        token.transferFrom(owner, recipient, ETHER_AMOUNT);

        uint256 ownerBalanceAfter = token.balanceOf(owner);
        uint256 recipientBalanceAfter = token.balanceOf(recipient);

        assertEq(
            ownerBalanceBefore - ETHER_AMOUNT,
            ownerBalanceAfter,
            "Owner's balance should decrease by the amount transferred"
        );
        assertEq(
            recipientBalanceBefore + ETHER_AMOUNT,
            recipientBalanceAfter,
            "Recipient's balance should increase by the amount transferred"
        );
    }

    function testNonOwnerCannotTransferTokensInGodMode() public {
        assertEq(token.balanceOf(nonOwner), ETHER_AMOUNT, "Non-owner should have 1000 ether");
        vm.prank(nonOwner);
        vm.expectRevert();
        token.transferFrom(nonOwner, recipient, 1500 ether);
    }
}
