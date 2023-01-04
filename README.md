## Splice Contracts

This repo contains all the contracts used in Splice. It is divided in independent projects where each of them contains its smart contracts, test environment and unique config files.

### Existing projects

|Project name                                    |Description                                        |Solidity version(s)|
|------------------------------------------------|---------------------------------------------------|-------------------|
|[NFT Rebate Stake](./projects/nft/rebate_stake/)    |compatibilty test only performed with ERC721   |0.8.16             |
|[Generic ERC1155](./projects/nft/erc1155/)          |gemeric erc1155 contract example               |0.8.17             |
|[Truth Seeker NFT](./projects/nft/truth_seeker/)    |Inefficent ERC721 with with epensive airdrop   |0.8.14             |
|[10k Whitelists](./projects/nft/whitelist10k/)      |purely smart contract method for 10k whitelists|0.8.17             |
|[Approve Tax](./projects/token/approve_tax/)        |impose a tax on any set approval of tokens     |0.8.17             |
|[Low Level Gen](./projects/protocol/ll_generator/)  |generation protocol utilizing proxy logic      |0.8.17             |


### Create a new project

1 - Create a new folder inside `projects` <br/>
2 - Run `yarn init`

Commands inside the root `package.json` starting with `lerna` will run the corresponding command in each subproject.

### Developers
__Charles Taylor (FudgyDRS)__

__Maia Divine (Maiazana)__
