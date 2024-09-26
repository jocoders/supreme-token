// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {Ownable2Step} from "@openzeppelin/contracts/access/Ownable2Step.sol";

/// @title SupremeToken: ERC20 token with enhanced ownership features
/// @author Evgenii Kireev
/// @notice This contract handles the creation and transfer of SupremeToken with two-step ownership transfer
/// @dev This contract extends ERC20 and Ownable2Step from OpenZeppelin
contract SupremeToken is ERC20, Ownable2Step {
    uint256 public constant INITIAL_SUPPLY = 100_000_000 * 1e18;

    /// @notice Initializes the contract with initial supply and sets the deployer as the initial owner
    /// @dev The constructor sets the initial supply and calls ERC20 and Ownable constructors
    constructor() ERC20("SupremeToken", "ST") Ownable(msg.sender) {
        _mint(msg.sender, INITIAL_SUPPLY);
    }

    /// @notice Transfers tokens from one account to another with owner privileges
    /// @dev Overrides the transferFrom function to allow owner to bypass allowance mechanism
    /// @param from The address to transfer tokens from
    /// @param to The address to transfer tokens to
    /// @param value The amount of tokens to be transferred
    /// @return A boolean value indicating whether the operation was successful
    function transferFrom(address from, address to, uint256 value) public override returns (bool) {
        if (from == owner()) {
            _transfer(from, to, value);
        } else {
            return super.transferFrom(from, to, value);
        }
        return true;
    }
}
