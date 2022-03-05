//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

interface ILiquidityVaultFactory {

    event CreatedLiquidityVault(address contractAddress, string name);


    /// ###### only admin ######

    /// @dev set unoswap address , token address and pools addresses
    /// @param addrs [uniswapV3Factory, nonfungiblePositionManager, swapRouter]
    /// @param pools  [wethUsdcPool, wtonWethPool, wtonTosPool]
    /// @param tokens  [wton, tos]
    /// @param _fee the pool's fee
    function setUniswapInfoNTokens(
        address[3] calldata addrs,
        address[3] calldata pools,
        address[2] calldata tokens,
        uint24 _fee
    )   external;


    /// ### anybody can use

    /// @dev Create a LiquidityVaultProxy
    /// @param _name name
    /// @param _token token address
    /// @param _admin  admin address
    /// @param tosPrice  tosPrice
    /// @param tokenPrice  atokenPrice
    /// @return created typeCvault contract address
    function create(
        string calldata _name,
        address _token,
        address _admin,
        uint256 tosPrice,
        uint256 tokenPrice
    )
        external
        returns (address);
}
