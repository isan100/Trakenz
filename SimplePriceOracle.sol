// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/// @title SimplePriceOracle (Mock)
/// @notice Very small mock oracle for testing. In production use Chainlink or vetted oracles.
contract SimplePriceOracle {
    mapping(address => uint256) public price; // price in wei (e.g., USD with 8 decimals scaled)

    event PriceUpdated(address indexed token, uint256 price);

    function setPrice(address token, uint256 _price) external {
        price[token] = _price;
        emit PriceUpdated(token, _price);
    }

    function getPrice(address token) external view returns (uint256) {
        return price[token];
    }
}
