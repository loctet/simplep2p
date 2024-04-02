# P2P Solidity Smart Contract

## Introduction

`P2P.sol` is a Solidity smart contract designed for the Ethereum blockchain, facilitating peer-to-peer (P2P) transactions with an emphasis on security and transparency. The contract allows for a specified amount of Ether to be deposited by a sender, with the transaction marked as complete once the full amount is received. It features event logging for deposits, withdrawals, and the completion of transactions, alongside ownership and security checks.

## Prerequisites

- [Node.js](https://nodejs.org/en/) (v12.x or later)
- [npm](https://www.npmjs.com/) (v6.x or later)
- [Truffle Suite](https://www.trufflesuite.com/) (Optional, for deployment and testing)
- An Ethereum wallet
- [MetaMask](https://metamask.io/) or another Ethereum browser extension/wallet provider

## Installation

1. Clone the repository to your local machine:

```bash
git clone <repository-url>
```

2. Navigate into the project directory:

```bash
cd <project-directory>
```

3. Install the necessary node modules (if any dependencies are specified):

```bash
npm install
```

4. Compile the smart contract:

```bash
truffle compile
```

## Usage

To deploy and interact with the `P2P` contract, follow these steps:

### Deployment

1. Make sure you have a development blockchain running (e.g., [Ganache](https://www.trufflesuite.com/ganache)).

2. Deploy the contract using Truffle:

```bash
truffle migrate
```

### Interaction

- **Deposit**: Allows the sender to deposit Ether into the contract until the agreed amount is reached.
- **Withdraw**: Enables the owner to withdraw the deposited amount once the transaction is completed.
- **Check Transaction Status**: Internal function to check if the transaction has been completed.
- **Proceed with Transaction**: Internal function to process the withdrawal and prepare for the next transaction.

## Contributing

Contributions are welcome! Please refer to the contributing guidelines for details on how to contribute to this project. Always adhere to our code of conduct and follow the pull request process outlined in the guidelines.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
