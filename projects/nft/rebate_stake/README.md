__Author: Charles Taylor (FudgyDRS)__

__Co-Author: Maia Divine (Maiazana)__

The purpose of this protocol is to define a system by which NFT royalty staking can be automated via a decentralized smart contract. The process of creating such a decentralized system maintains that the owner does not have exclusive control over any feature that effects users assets (ETH, NFT, or otherwise).

The system functions by saving the funds transfered to the contracts state. If the transfer is stray funds transferred to the contract, then the funds are transfered to the owner. If the transfer is followed by a `transferFrom` call the funds are split __32:38__, where 38/70 is transfered to the contract owner and 32/70 is transfered to the stake of the NFT transferee.

#### Perform tests:

#### Tests performed using:
  - NodeJS 16.15.0
  - Typescript 4.8.4
  - yarn 1.22.18
