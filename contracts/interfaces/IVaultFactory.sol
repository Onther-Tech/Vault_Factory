//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

interface IVaultFactory {

    /// @dev Create a createTypeA
    /// @param _name name
    /// @param _token token Address
    /// @param _owner  owner Address
    /// @param _setting  _setting[0] = totalAllocatedAmount, _setting[1] = totalClaimCounts, _setting[2] = startTime, _setting[3] = claimPeriodTimes
    /// @param _firstSet _firstSet[0] = firstClaimAmount, _firstSet[1] = firstClaimTime
    /// @param _check if check is true, need the firstClaimSetting
    /// @return created typeAvault contract address
    function createTypeA(
        string calldata _name,
        address _token,
        address _owner,
        uint256[4] calldata _setting,
        uint256[2] calldata _firstSet,
        bool _check
    )
        external
        returns (address);

    /// @dev Create a createTypeB
    /// @param _name name
    /// @param _token token Address
    /// @param _owner  owner Address
    /// @return created typeBvault contract address
    function createTypeB(
        string calldata _name,
        address _token,
        address _owner
    )
        external
        returns (address);

    /// @dev Create a createTypeC
    /// @param _name name
    /// @param _addr addr[0] = tokenAddress, addr[1] = ownerAddress
    /// @param _amount  amount[0] = total allocated amount, amount[1] = total claimCounts
    /// @param _claimsTimes  claimtimes[]
    /// @param _claimAmounts claimAmounts[]
    /// @return created typeCvault contract address
    function createTypeC(
        string calldata _name,
        address[2] calldata _addr,
        uint256[2] calldata _amount,
        uint256[] calldata _claimsTimes,
        uint256[] calldata _claimAmounts
    )
        external
        returns (address);

    /// @dev Last generated contract information
    function lastestCreated() external view returns (address contractAddress, string memory name, string memory vaultType);

    /// @dev Contract information stored in the index
    function getContracts(uint256 _index) external view returns (address contractAddress, string memory name, string memory vaultType);


}
