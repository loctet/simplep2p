// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract P2P {
    uint256 public amount;
    uint public idTransaction = 1;
    bool private transactionCompleted;
    address public sender;
    address payable public owner;
    
    event Withdrawn(uint indexed idTransaction, uint indexed  timestamp);
    event Deposit(address indexed sender, uint256 value);
    event TransactionCompleted(uint indexed idTransaction);

    modifier onlyOwner() {
        require(owner == msg.sender, "Only Owner");
        _;
    }

    constructor(uint256 _amount, address _sender) {
        require(_amount > 0, "Amount must be greater than 0");
        require(_sender != address(0), "Invalid sender address");

        amount = _amount;
        sender = _sender;
        transactionCompleted = false;
        owner = payable(msg.sender);
    }

    function deposit() external payable {
        require(!transactionCompleted, "Transaction already completed");
        require(msg.sender == sender, "You are not the sender");
        require(msg.value > 0, "Deposit must be greater than 0");
        uint256 _value = address(this).balance;
        require(_value <= amount, "The amount exceeds the required deal");
        
        if (_value == amount) {
            transactionCompleted = true;
            emit TransactionCompleted(idTransaction);
        }
        
        emit Deposit(msg.sender, msg.value);
    } 

    function checkIfCompleted() internal view returns(uint) {
        require(transactionCompleted, "Transaction not completed");
        return idTransaction;
    }

    function proceedTransaction() internal onlyOwner returns(uint) {
        require(address(this).balance > 0, "No funds to withdraw");
        (bool success, ) = owner.call{value: address(this).balance}("");
        require(success, "Transfer failed");

        idTransaction++;
        transactionCompleted = true; // Reset for the next transaction
        return block.timestamp;
    }

    function withdraw(uint _amount) external onlyOwner {
        emit Withdrawn(checkIfCompleted(), proceedTransaction()); // Emit event after withdrawal
        reset(_amount);
    }

    function reset(uint new_amount) internal  {
        transactionCompleted = false;
        amount = new_amount;
    }
}
