# Sui dApp Starter Template with Loyalty Points

This dApp was created using `@mysten/create-dapp` that sets up a basic React
Client dApp using the following tools:

- [React](https://react.dev/) as the UI framework  
- [TypeScript](https://www.typescriptlang.org/) for type checking  
- [Vite](https://vitejs.dev/) for build tooling  
- [Radix UI](https://www.radix-ui.com/) for pre-built UI components  
- [ESLint](https://eslint.org/) for linting  
- [`@mysten/dapp-kit`](https://sdk.mystenlabs.com/dapp-kit) for connecting to
  wallets and loading data  
- [pnpm](https://pnpm.io/) for package management  

For a full guide on how to build this dApp from scratch, visit this
[guide](http://docs.sui.io/guides/developer/app-examples/e2e-counter#frontend).

---

## ✨ New Feature: Loyalty NFT with Points System

In addition to minting NFTs for loyalty cards, we’ve introduced a **Points System**:  

- Each **Loyalty NFT** starts with `0` points.  
- Admin can **add points** to a customer’s NFT.  
- Customers can **redeem points** when needed.  
- Points can be **viewed** directly from the NFT.  

This makes the dApp more **realistic for loyalty programs**, where users can collect and spend points.  

---

## Deploying your Move code

### Install Sui CLI

Before deploying your move code, ensure that you have installed the Sui CLI. You
can follow the [Sui installation instruction](https://docs.sui.io/build/install)
to get everything set up.

This template uses `testnet` by default, so we'll need to set up a testnet
environment in the CLI:

```bash
sui client new-env --alias testnet --rpc https://fullnode.testnet.sui.io:443
sui client switch --env testnet
