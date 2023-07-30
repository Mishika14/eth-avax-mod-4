# DEGEN TOKEN
This is a token for the DEGEN game in which users can mint, transfer and redeem items using these tokens. For this, we will create a smart contract and use a token ERC20, the standard token on the Ethereum blockchain.
# Details for token
Token name=DEGEN

Token Abbreviation=DEG
# Funtionalities of the token
1)MINT:- the owner of the account can mint tokens to use for his/her purpose and for another address as well.
```javascript
function mint(address _address, uint256 amount) public onlyOwner {
        _mint(_address, amount);
    }

```
2) Transfer:- This function requires the sender to have a sufficient token balance to perform the transfer.Then it can transfer some tokens to the other player's address.
   
   ```javascript
    function transferTok(address _reciever_add, uint value) external{
            require(balanceOf(msg.sender) >= value, "Low Balance");
            approve(msg.sender, value);
            transferFrom(msg.sender, _reciever_add, value);
        }
   
   ```
   
3) Reedem Tokens:-This function allows player to redeem some items availaible for the tokens they have.Remember,Your account should have enough balance for reedeeming the
   Tokens.

   ```javascript
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
   ```
   
4) Checking Token balance:-This function allows player to check the amount of token they have.
   ```javascript
    function Balance() external view returns (uint256) 
    { 
        return this.balanceOf(msg.sender);
    }
   ```
5) Burn Tokens :-This function allows player to use some tokens for reedeming or purchasing some items on the platform.
   ```javascript
   
    function burntoken(uint256 amount) public {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        _burn(msg.sender, amount);
    }
# Tools used
1. Remix
   
2. Avalanche Fuji-C-chain
   
3. Snowtrace
   
4. Meta-Mask
  
