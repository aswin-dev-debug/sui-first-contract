Sui dApp Starter Template with Loyalty Points

This dApp was created using @mysten/create-dapp that sets up a basic React
Client dApp using the following tools:

React
 as the UI framework

TypeScript
 for type checking

Vite
 for build tooling

Radix UI
 for pre-built UI components

ESLint
 for linting

@mysten/dapp-kit
 for connecting to
wallets and loading data

pnpm
 for package management

For a full guide on how to build this dApp from scratch, visit this
guide
.

✨ New Feature: Loyalty NFT with Points System

In addition to minting NFTs for loyalty cards, we’ve introduced a Points System:

Each Loyalty NFT starts with 0 points.

Admin can add points to a customer’s NFT.

Customers can redeem points when needed.

Points can be viewed directly from the NFT.

This makes the dApp more realistic for loyalty programs, where users can collect and spend points.

Deploying your Move code
Install Sui CLI

Before deploying your move code, ensure that you have installed the Sui CLI. You
can follow the Sui installation instruction

to get everything set up.

This template uses testnet by default, so we'll need to set up a testnet
environment in the CLI:

sui client new-env --alias testnet --rpc https://fullnode.testnet.sui.io:443
sui client switch --env testnet


If you haven't set up an address in the sui client yet, you can use the
following command to get a new address:

sui client new-address secp256k1


This will generate a new address and recovery phrase for you. You can mark a
newly created address as your active address by running the following command
with your new address:

sui client switch --address 0xYOUR_ADDRESS...


We can ensure we have some Sui in our new wallet by requesting Sui from the
faucet https://faucet.sui.io.

Publishing the move package

The move code for this template is located in the move directory. To publish
it, you can enter the move directory, and publish it with the Sui CLI:

cd move
sui client publish --gas-budget 100000000 nftdapp


In the output there will be an object with a "packageId" property. You'll want
to save that package ID to the src/constants.ts file as PACKAGE_ID:

export const TESTNET_LOYALTY_PACKAGE_ID = "<YOUR_PACKAGE_ID>";


Now that we have published the move code, and updated the package ID, we can
start the app.

Starting your dApp

To install dependencies you can run:

pnpm install


To start your dApp in development mode run:

pnpm dev

Building

To build your app for deployment you can run:

pnpm build

🚀 Summary

This dApp mints Loyalty NFTs for customers.

New feature: Points System → Admin can reward points, customers can redeem them.

Works seamlessly on Sui Testnet.
