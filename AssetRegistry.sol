// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/// @title AssetRegistry (Prototype)
/// @notice Simple on-chain registry that allows a user to opt-in and register a set of public addresses
/// This is a minimal demonstration contract. Do NOT use as-is in production without audits.
contract AssetRegistry {
    event AddressesRegistered(address indexed owner, address[] addresses);
    event AddressesRemoved(address indexed owner, address[] addresses);

    // Mapping of owner => list (stored as mapping to bool for simple checks)
    mapping(address => mapping(address => bool)) private registered;
    mapping(address => address[]) private ownerIndex;

    /// @notice Register a list of addresses to watch (opt-in)
    function registerAddresses(address[] calldata _addrs) external {
        for (uint i = 0; i < _addrs.length; i++) {
            address a = _addrs[i];
            if (!registered[msg.sender][a]) {
                registered[msg.sender][a] = true;
                ownerIndex[msg.sender].push(a);
            }
        }
        emit AddressesRegistered(msg.sender, _addrs);
    }

    /// @notice Remove a list of addresses from your registry
    function removeAddresses(address[] calldata _addrs) external {
        for (uint i = 0; i < _addrs.length; i++) {
            address a = _addrs[i];
            if (registered[msg.sender][a]) {
                registered[msg.sender][a] = false;
                // Note: ownerIndex is not compacted to keep this simple
            }
        }
        emit AddressesRemoved(msg.sender, _addrs);
    }

    /// @notice Check if an owner registered an address
    function isRegistered(address owner, address addr) external view returns (bool) {
        return registered[owner][addr];
    }

    /// @notice Get full list (prototype) - may include addresses removed (simple implementation)
    function getRegistered(address owner) external view returns (address[] memory) {
        return ownerIndex[owner];
    }
}
