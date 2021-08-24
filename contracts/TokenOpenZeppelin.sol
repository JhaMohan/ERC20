pragma solidity ^0.8.0;

import '@openzepplin/contracts/token/ERC20/ERC20.sol';


contract Token is ERC20 {

    constructor() ERC20("Token Name","Token_symbol") {}

}


contract Token1 is ERC20 {

    constructor() ERC20("Token Name","Token_symbol") {
        _mint(msg.sender,1000000);

    }

}


contract Token2 is ERC20 {

    address admin;
    constructor() ERC20("Token Name","Token_symbol") {
        admin = msg.sender;
        _mint(msg.sender,100000);
    }

    function mint(address to,uint256 amount) public {
        require(msg.sender==admin,'only admin can call');
        _mint(to,amount);
    }

}


contract Token3 is ERC20 {

    address admin;
    constructor() ERC20("Token Name","Token_symbol") {
        admin = msg.sender;
        _mint(msg.sender,100000);
    }

    function  faucet(address to,uint256 amount) public {
        _mint(to,amount);
    }

}