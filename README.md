## Splice Contracts

This repo contains all the contracts used in Splice. It is divided in independent projects where each of them contains its smart contracts, test environment and unique config files.

### Existing projects

|Project name                      |Description                                 |Solidity version(s)|
|----------------------------------|--------------------------------------------|-------------------|
|[NFT Rebate Stake](./projects/nft)|compatibilty test only performed with ERC721|0.8.16             |


### Create a new project

1 - Create a new folder inside `projects` <br/>
2 - Run `yarn init`

Commands inside the root `package.json` starting with `lerna` will run the corresponding command in each subproject.

### Developers
__Charles Taylor (FudgyDRS)__

__Maia Divine (Maiazana)__
