# Supreme Token

## Overview

`SupremeToken` is a fungible ERC-20 token implemented on Ethereum, featuring a "god mode" where a special address (the owner) can transfer tokens between addresses without requiring allowances. This functionality is particularly useful for administrative control and special operations where the owner needs to move tokens freely.

## Features

- **ERC-20 Compliance**: The token adheres to the standard ERC-20 interface.
- **God Mode**: The owner can transfer tokens freely without the need for allowances.
- **Two-Step Ownership Transfer**: Enhanced security feature that requires ownership transfer to be accepted by the new owner before it is finalized.

## Technology

The token is implemented using Solidity 0.8.20 and relies on OpenZeppelin's contracts for standard functionality, including ERC20 and enhanced ownership features.

## Getting Started

### Prerequisites

- Node.js and npm
- Foundry (for local deployment and testing)

### Installation

1. Install Foundry if it's not already installed:
   ```bash
   curl -L https://foundry.paradigm.xyz | bash
   foundryup
   ```

2. Clone the repository:
   ```bash
   git clone https://github.com/jocoders/supreme-token.git
   cd supreme-token
   ```

3. Install dependencies:
   ```bash
   forge install
   ```

### Testing

Run tests using Foundry:
```bash
forge test
```

## Usage

### Deploying the Token

Deploy the token to a local blockchain using Foundry:
```bash
forge create SupremeToken --rpc-url http://localhost:8545
```

### Interacting with the Token

#### Transferring Tokens in God Mode

```javascript
const tx = await token.transferFrom("0xOWNER", "0xRECIPIENT", amount);
await tx.wait();
```

## Contributing

Contributions are welcome! Please fork the repository and open a pull request with your features or fixes.

## License

This project is unlicensed and free for use by anyone.

This README provides a comprehensive guide tailored to the `SupremeToken` and its unique features, ensuring users and developers can easily understand and interact with the token.