// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// ChocoTokenV3.sol
// 2022-11-25 | CR
// ERC-20 Token implementation as an updatable contract
// Implementacion de token ERC-20 como contrato actualizable

// import upgradeable version of the ERC20 contract
import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
// import the pausable capability: privileged accounts will be able to pause the functionality marked as whenNotPaused. Useful for emergency response.
import "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";
// import Ownable upgradeable so only the contract owner can run admin actions on the contract: simple mechanism with a single account authorized for all privileged actions.
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
// import the permit capability: without paying gas, token holders will be able to allow third parties to transfer from their account.
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/draft-ERC20PermitUpgradeable.sol";
// import the initialize() capability (UUPS)
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
// import the UUPS Proxy contract: uses simpler proxy with less overhead. Allows flexibility for authorizing upgrades.
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
// Import the metatx capability
import "@openzeppelin/contracts-upgradeable/metatx/ERC2771ContextUpgradeable.sol";

/// @custom:security-contact chot.security@mediabros.com
contract ChocoTokenV3 is 
    Initializable, 
    ERC20Upgradeable, 
    PausableUpgradeable, 
    OwnableUpgradeable, 
    ERC20PermitUpgradeable, 
    UUPSUpgradeable, 
    ERC2771ContextUpgradeable {

    function initialize(uint256 initialSupply, address trustedForwarder) initializer public {
        __ERC20_init("ChocoTokenV3", "CHOT");
        __Pausable_init();
        __Ownable_init_unchained();
        __ERC20Permit_init("ChocoToken");
        __UUPSUpgradeable_init();
        _mint(msg.sender, initialSupply * (10**decimals()));
        // Initiating ERC2771Context contract
        __ERC2771Context_init_unchained(trustedForwarder);
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }

    function _authorizeUpgrade(address newImplementation)
        internal
        onlyOwner
        override
    {}

    // Overriding message _msgSender function so the one provided by ERC2771Context contract is used (To extract the sender from the execution data)
    function _msgSender()
        internal
        view
        override(ERC2771ContextUpgradeable, ContextUpgradeable)
        returns (address)
    {
        return ERC2771ContextUpgradeable._msgSender();
    }

    // Overriding message _msgData function so the one provided by ERC2771Context contract is used (In case there is an internal function that needs it)
    function _msgData()
        internal
        view
        override(ERC2771ContextUpgradeable, ContextUpgradeable)
        returns (bytes calldata)
    {
        return ERC2771ContextUpgradeable._msgData();
    }
}