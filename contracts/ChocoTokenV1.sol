// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

// ChocoTokenV1.sol
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

/// @custom:security-contact chot.security@mediabros.com
contract ChocoTokenV1 is Initializable, ERC20Upgradeable, PausableUpgradeable, OwnableUpgradeable, ERC20PermitUpgradeable, UUPSUpgradeable {
    /// @custom:oz-upgrades-unsafe-allow constructor
    // constructor() {
    //     _disableInitializers();
    // }

    function initialize(uint256 initialSupply) initializer public {
        __ERC20_init("ChocoToken", "CHOT");
        __Pausable_init();
        __Ownable_init();
        __ERC20Permit_init("ChocoToken");
        __UUPSUpgradeable_init();
        _mint(msg.sender, initialSupply * (10**decimals()));
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
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
}