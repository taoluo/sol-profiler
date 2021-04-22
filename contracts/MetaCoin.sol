// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0;

contract MetaCoin {
	mapping (address => uint) public balances;

	constructor() {
		balances[tx.origin] = 10;
	}

	function sendCoin(address receiver, uint amount) public {
		balances[msg.sender] = balances[msg.sender] - amount;
		balances[receiver] = balances[receiver] + amount;
	}
}
