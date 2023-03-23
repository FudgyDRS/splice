__Version: 0.0.4__

__Author: Charles Taylor (FudgyDRS)__

__Co-Author: Maia Divine (Maiazana)__

The purpose
The purpose of this protocol demo is to exemplify the execution of our system

- [x] System Architecture
- [x] Base Smart Contracts (Factory)
- [x] Base Assembly Smart Contracts (ERC20, ERC20 reflection, ERC721)
- [ ] More Base Smart Contracts (ERC1155, Uniswap V2, Uniswap V2, Lending pool)
- [ ] Automation Example ("timer job")
- [ ] Automation Example ("auto vest")
- [ ] Unit Test Examples
- [ ] Live Examples
- [ ] Live Nocode MVP
- [ ] Hashlips integration
- [ ] Website + Request form


Assembly (or Low-Level) smart contracts refers to smart contracts for normal systems analyzed and an optimized to function in assembly. In assembly we cannot directly effect the stack by we can directly manipulate memory and storage. The everpresent redudency we see in normal code is the inefficent management of cold/warm storage and redudent code.

We maintain these deployment via a state contract storing data and delegate calls to upgradable proxy contracts. Contract updates are performed on a schedule using the given automation systme. All these functions are mux through our factory contracts that also determine the appropiate gas to be offset to be used on automation jobs.

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
