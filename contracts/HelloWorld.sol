// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title SimpleWallet
 * @dev Simple wallet contract for demonstration. It allows users to deposit and
 * withdraw Ether.
 */
contract SimpleWallet {
    // Address of the owner of the wallet
    address public owner;

    // Event to emit when Ether is deposited
    event Deposited(address indexed depositor, uint amount);

    // Event to emit when Ether is withdrawn
    event Withdrawn(address indexed withdrawer, uint amount);

    /**
     * @dev Sets the contract creator as the initial owner.
     */
    constructor() {
        owner = msg.sender;
    }

    /**
     * @dev Allows the contract to receive Ether.
     */
    receive() external payable {
        emit Deposited(msg.sender, msg.value);
    }

    /**
     * @dev Returns the balance of the contract.
     */
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    /**
     * @dev Withdraws Ether from the contract to the owner's address.
     * @param amount The amount of Ether to withdraw.
     */
    function withdraw(uint amount) public {
        require(msg.sender == owner, "Only the owner can withdraw");
        require(amount <= address(this).balance, "Insufficient balance in wallet");

        payable(owner).transfer(amount);
        emit Withdrawn(owner, amount);
    }

    /**
     * @dev Allows the owner to transfer ownership of the contract to a new address.
     * @param newOwner The address of the new owner.
     */
    function transferOwnership(address newOwner) public {
        require(msg.sender == owner, "Only the owner can transfer ownership");
        require(newOwner != address(0), "New owner cannot be the zero address");

        owner = newOwner;
    }
}
