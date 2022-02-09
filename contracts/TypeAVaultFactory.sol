//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

import {typeAVault} from "./typeAVault/typeAVault.sol";
import "./interfaces/ITypeAVaultFactory.sol";
import "./common/AccessibleCommon.sol";
import "hardhat/console.sol";

/// @title A factory that creates a Vault
contract TypeAVaultFactory is AccessibleCommon { 

    event CreatedTypeAVault(address contractAddress, string name);

    modifier nonZeroAddress(address _addr) {
        require(_addr != address(0), "VaultFactory: zero");
        _;
    }
    struct ContractInfo {
        address contractAddress;
        string name;
    }

    /// @dev Total number of contracts created
    uint256 public totalCreatedContracts;

    /// @dev Contract information by index
    mapping(uint256 => ContractInfo) public createdContracts;

    /// @dev constructor of VaultFactory
    constructor() {
        totalCreatedContracts = 0;
    }

    function createTypeA(
        string calldata _name,
        address _token,
        address _owner
    )
        external returns (address)
    {
        require(bytes(_name).length > 0,"name is empty");

        typeAVault typeA = new typeAVault(_name,_token,_owner);

        require(
            address(typeA) != address(0),
            "typeC zero"
        );

        createdContracts[totalCreatedContracts] = ContractInfo(address(typeA), _name);
        totalCreatedContracts++;

        emit CreatedTypeAVault(address(typeA), _name);

        return address(typeA);
    } 

    function lastestCreated() external view returns (address contractAddress, string memory name){
        if(totalCreatedContracts > 0){
            return (createdContracts[totalCreatedContracts-1].contractAddress, createdContracts[totalCreatedContracts-1].name);
        }else {
            return (address(0), '');
        }
    }

    function getContracts(uint256 _index) external view returns (address contractAddress, string memory name){
        if(_index < totalCreatedContracts){
            return (createdContracts[_index].contractAddress, createdContracts[_index].name);
        }else {
            return (address(0), '');
        }
    }
}