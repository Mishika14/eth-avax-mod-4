// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";


contract Degtok is ERC20,ERC20Burnable {
    address private owner;
    uint redeemAm;
    
    constructor() ERC20("Degen", "DEG") {
        owner = msg.sender;
    }

    function decimals()public pure override returns (uint8)
    {
        return 0;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Access denied you are not the owner");
        _;
    }
    function mint(address _address, uint256 amount) public onlyOwner {
        _mint(_address, amount);
    }

    function transferTok(address _reciever_add, uint value) external{
            require(balanceOf(msg.sender) >= value, "Low Balance");
            approve(msg.sender, value);
            transferFrom(msg.sender, _reciever_add, value);
        }

    
    function items() public pure returns (string memory) {
        return "1. Merch value == 1000\n 2.Gamex voucher value = 2500\n 3.XBOX LOOT value = 5000";
    }
    function redeemTokens(uint itemCode) external {
        require(itemCode >= 1 , "Choose number from the list");

        if (itemCode == 1)
        {
            redeemAm= 1000;
        } 

        else if (itemCode == 2) 
        {
            redeemAm = 2500;
        } 

        else if(itemCode == 3) 
        {
            redeemAm = 5000;
        }

        require(balanceOf(msg.sender) >= redeemAm, "INSUFFICIENT TOKENS");
        _burn(msg.sender, redeemAm);
    }

    function Balance() external view returns (uint256) 
    { 
        return this.balanceOf(msg.sender);
    }

   /
}
