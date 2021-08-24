pragma solidity ^0.8.0;

import '@openzepplin/contrats/token/ERC20/IERC20.sol';

interface ContractB {
    function deposite(uint256 amount) external;
    function withdraw(uint256 amount) external;
}

contract  TokenTransfer is IERC20,ContractB {

    IERC20 public token;
    ContractB public contractB;


    constructor(address _token,address _contractB) {
        token = IERC20(_token);
        contractB = ContractB(_contractB);
    }


    function deposite(uint256 amount) external {
        token.transferFrom(msg.sender,address(this),amount);
        token.approve(address(contractB),amount);
        contractB.deposite(amount);
    }


    function withdraw(uint256 amount) external {
        contractB.withdraw(amount);
        token.transfer(msg.sender,amount);
    }

}