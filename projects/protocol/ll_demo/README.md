__Author: Charles Taylor (FudgyDRS)__

__Co-Author: Maia Divine (Maiazana)__

The purpose of this protocol is the no-code deployment of state contract that function via delegate calls to upgradable proxy contracts.

The system functions by calling the directory delegate that calls the directory proxy that points to the contract logic, versions to specific contract can also be locked in place.

Version is indicated as so
1.2.3

(1) indicates a major revision (possible breaking changes, in that event contracts can be migrated/fixed/locked)
(2) indicated sufficent revisions to be considered a full update
(3) minor revisions

DirectoryDelegate.sol
version 0.0.1 - Intial build

#### Perform tests:

#### Tests performed using:
  - NodeJS 16.15.0
  - Typescript 4.8.4
  - yarn 1.22.18
