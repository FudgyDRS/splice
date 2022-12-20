import { assert } from "chai";
import { artifacts, contract } from "hardhat";
import { BN, constants, expectEvent, expectRevert, ether, time, balance, send } from "@openzeppelin/test-helpers";
import { parseEther, formatUnits } from "ethers/lib/utils";
import { transferableAbortController } from "util";
//import { time } from "@nomicfoundation/hardhat-network-helpers";

const MainNFT = artifacts.require("TestNFT");
const MockERC20 = artifacts.require("./test/MockERC20");
const MockERC721 = artifacts.require("./test/MockERC721");
const MockERC721Sale = artifacts.require("./test/MockERC721Sale");

let users = new Array<String>(5);
contract("Main NFT", ([owner, operator, ...users]) => {
  let mainNFT;
  let mockERC721Sale;
  let mockERC20_1, mockERC20_2;
  let mockURI;
  let tempOwner;
  let baseURI;
  let tokenURI;
  let n = 0;
  let maxSupply, maxReserveSupply, totalSupply;

  let startTimestamp;
  let maxPerAddress;
  let maxPerTransaction;
  let pricePerTicket;

  let beforeBalance, beforeBalanceOwner;
  let changedBalance, changedBalanceOwner;
  let _balance;
  let div10 = "10000000000";
  let div18 = "100000000000000000";
  let div10bn = BN(div10);
  let div18bn = BN(div18);

  let beforeStake;
  let afterStake;

  before(async () => {
    let amount = parseEther("10000");

    // Random tokens setup
    mockERC20_1 = await MockERC20.new("Test Token 1", "TEST1", amount, { from: owner });
    mockERC20_2 = await MockERC20.new("Test Token 2", "TEST2", amount, { from: owner });
    mockERC721Sale = await MockERC721Sale.new({ from: owner })

    maxSupply = "2500";
    maxReserveSupply = "10";
    pricePerTicket = parseEther("1").toString(); // 1 CAKE

    // Deploy Main NFT
    mainNFT = await MainNFT.new("Test NFT", "tMFT", maxSupply, { from: owner, });

    mockURI = "ipfs://qwertyuiop/";

    // Set the Base URI
    await mainNFT.setBaseURI(mockURI, { from: owner });
  });

  describe("#1 - Normal behavior", async () => {
    it("Only owner can lock contract", async () => {
      await expectRevert(mainNFT.lock(true, { from: users[1] }), "Ownable: caller is not the owner");
      await expectRevert(mainNFT.lock(false, { from: users[1] }), "Ownable: caller is not the owner");

      // Owner should be able to both unlock and lock
      await expectRevert(mainNFT.lock(false, { from: owner }), "InputAlreadySet()");
      await mainNFT.lock(true, {from: owner});
      await mainNFT.lock(false, {from: owner});
    });

    it("Only owner can mint ", async () => {
      // only owner can call function
      await expectRevert(mainNFT.mint(users[1], n++, { from: users[1] }), "Ownable: caller is not the owner");
      await expectRevert(mainNFT.mint(owner, n++, { from: users[2] }), "Ownable: caller is not the owner");

      // owner to self
      await mainNFT.mint(owner, n, { from: owner });
      await mainNFT.totalSupply();
      tempOwner = await mainNFT.ownerOf(n);
      assert.equal(tempOwner, owner);
      n++;

      // owner to someone else
      await mainNFT.mint(users[1], n, { from: owner });
      tempOwner = await mainNFT.ownerOf(n);
      assert.equal(tempOwner, users[1]);
      n++;
    });

    it("Only owner can set base URI", async () => {
      // only owner can set base URI
      await expectRevert(mainNFT.setBaseURI("some new uri", { from: users[1] }), "Ownable: caller is not the owner");
      await expectRevert(mainNFT.setBaseURI("some new uri", { from: users[2] }), "Ownable: caller is not the owner");

      // Owner set baseURI
      await mainNFT.lock(true, {from: owner});
      await expectRevert(mainNFT.setBaseURI("some new uri", {from: owner}), "ContractLocked()");

      // Owner can only change baseURI when contract is NOT locked
      await mainNFT.lock(false, { from: owner });
      await mainNFT.setBaseURI("some new uri", { from: owner });
      baseURI = await mainNFT.baseURI();
      assert.equal(baseURI, "some new uri");

      let i = 0

      for(i; i<5; i++) {
        await mainNFT.mint(users[1], n, { from: owner });
        tempOwner = await mainNFT.ownerOf(n);
        assert.equal(tempOwner, users[1]);
        n++;
      }

      for(let i=n-5; i<n; i++) {
        tokenURI = await mainNFT.tokenURI(i);
        assert.equal("some new uri" + i.toString() + ".json", tokenURI);
      }

      // check still works after changing base URI
      await mainNFT.setBaseURI("some new uri33", { from: owner });
      for(let i=n-5; i<n; i++) {
        tokenURI = await mainNFT.tokenURI(i);
        assert.equal("some new uri33" + i.toString() + ".json", tokenURI);
      }
      
    });

    it("Only owner can mint", async () => {
      // only owner can call function
      await expectRevert(mainNFT.mint(users[1], n++, { from: users[1] }), "Ownable: caller is not the owner");
      await expectRevert(mainNFT.mint(owner, n++, { from: users[2] }), "Ownable: caller is not the owner");

      // owner to self
      await mainNFT.mint(owner, n, { from: owner });
      await mainNFT.totalSupply();
      tempOwner = await mainNFT.ownerOf(n);
      assert.equal(tempOwner, owner);
      tokenURI = mainNFT.tokenURI(n)
      n++;

      // owner to someone else
      await mainNFT.mint(users[1], n, { from: owner });
      tempOwner = await mainNFT.ownerOf(n);
      assert.equal(tempOwner, users[1]);
      n++;
    });
  });

  describe("#2 - MockERC721Sale", async () => {
    let recoveryAmount = parseEther("100");
    it("pre-pre-Sell NFTs", async () => {
      maxSupply = await mainNFT.maxSupply({ from: owner });
      console.log("maxSupply: ", maxSupply.toString());

      totalSupply = await mainNFT.totalSupply({ from: owner });
      console.log("totalSupply: ", totalSupply.toString());
    });

    it("pre-Sell NFTs", async () => {
      //await mockERC721Sale.sellToken
      let i, j = 0, g = 0, temp;
      let groups: number[][] = [];

      totalSupply = await mainNFT.totalSupply({ from: owner });
      console.log("totalSupply group" + g.toString() + ": ", totalSupply.toString());
      // Test group of tokens minted to owner
      temp = n
      for(i=n-5; i<temp; i++) {
        await mainNFT.mint(owner, n++, {from: owner});
        tempOwner = await mainNFT.ownerOf(n-1);
        assert.equal(tempOwner, owner);
        groups.push([]);
        groups[g].push(i);
      }
      g++;

      // Test group of tokens transfered from owner
      // totalSupply = await mainNFT.totalSupply({ from: owner });
      // console.log("totalSupply group" + g.toString() + ": ", totalSupply.toString());
      temp = n
      for(i=n-5; i<temp; i++) {
        await mainNFT.mint(owner, n++, {from: owner});
        await mainNFT.transferFrom(owner, users[3], n-1, { from: owner });
        tempOwner = await mainNFT.ownerOf(n-1);
        assert.equal(tempOwner, users[3]);
        groups[g].push(i);
      }
      g++;

      // Test group of tokens transfered from users[1]
      temp = n
      for(i=n-5; i<temp; i++) {
        await mainNFT.mint(users[1], n++, {from: owner});
        await mainNFT.transferFrom(users[1], users[4], n-1, { from: users[1]});
        tempOwner = await mainNFT.ownerOf(n-1);
        assert.equal(tempOwner, users[4]);
        groups[g].push(i);
      }
      g++;

      // Test group of tokens minted to users[2]
      temp = n
      for(i=n-5; i<temp; i++) {
        await mainNFT.mint(users[2], n++, {from: owner});
        tempOwner = await mainNFT.ownerOf(n-1);
        assert.equal(tempOwner, users[2]);
        console.log("owner of " + (n-1).toString() + ": ", tempOwner)
        console.log(users[2])
        groups[g].push(i);
      }
      g++;
      console.log("groups: ", groups);
    });

    it("Sell NFTs", async () => {
      // groups:  [
      //   [  8,  9, 10, 11, 12 ],  // 
      //   [ 13, 14, 15, 16, 17 ],  // owner
      //   [ 18, 19, 20, 21, 22 ],  // user 3
      //   [ 23, 24, 25, 26, 27 ],  // user 4
      //   [ 28, 29, 30, 31, 32 ],  // user 2
      // ]

      // Owner shouldn't be able to sell someone else's NFTs
      //console.log(mainNFT.contract._address)
      await expectRevert(mockERC721Sale.sellToken(mainNFT.contract._address, 32, parseEther("10"), { from: owner }), "NotOwner()");
      await expectRevert(mockERC721Sale.sellToken(mainNFT.contract._address, 21, parseEther("10"), { from: owner }), "NotOwner()");

      //// Nobody shouldn't be able to sell someone else's NFTs
      await expectRevert(mockERC721Sale.sellToken(mainNFT.contract._address, 13, parseEther("10"), { from: users[1] }), "NotOwner()");
      await expectRevert(mockERC721Sale.sellToken(mainNFT.contract._address, 11, parseEther("10"), { from: users[3] }), "NotOwner()");

      // Sell tokens
      totalSupply = await mainNFT.totalSupply();
      console.log("totalSupply: ", totalSupply.toString())
      await mockERC721Sale.sellToken(mainNFT.contract._address, 16, parseEther("1"), { from: owner });
      await mockERC721Sale.sellToken(mainNFT.contract._address, 17, parseEther("1"), { from: owner });
      await mockERC721Sale.sellToken(mainNFT.contract._address, 20, parseEther("1"), { from: users[3] });
      await mockERC721Sale.sellToken(mainNFT.contract._address, 21, parseEther("1"), { from: users[3] });
      await mockERC721Sale.sellToken(mainNFT.contract._address, 23, parseEther("1"), { from: users[4] });
      await mockERC721Sale.sellToken(mainNFT.contract._address, 27, parseEther("10"), { from: users[4] });
      await mockERC721Sale.sellToken(mainNFT.contract._address, 28, parseEther("5"), { from: users[2] });
      await mockERC721Sale.sellToken(mainNFT.contract._address, 32, parseEther("22"), { from: users[2] });

      await mainNFT.setApprovalForAll(mockERC721Sale.contract._address, true, { from: owner});
      await mainNFT.setApprovalForAll(mockERC721Sale.contract._address, true, { from: users[2]});
      await mainNFT.setApprovalForAll(mockERC721Sale.contract._address, true, { from: users[3]});
      await mainNFT.setApprovalForAll(mockERC721Sale.contract._address, true, { from: users[4]});
      let sale;

      // verify sales were saved to contract
      let sales = [16, 17, 20, 21, 23, 27, 28, 32];
      for(let i = 0; i<sales.length; i++) {
        sale = await mockERC721Sale.sale(mainNFT.contract._address, sales[i]);
        console.log("sale: ", 
          "#" + sales[i],
          sale.amount.div(BN(parseEther("1").toString())).toString() + " ETH", 
          +(sale.fee.toString()) / 10000, 
          sale.seller,
          sale.active.toString()
      );
      }
    });

    it("Buy NFTs", async () => {
      //mockERC721Sale.buyToken(mainNFT.contract._address, 16, { from: users[5], value: parseEther("1")});
      
      beforeBalanceOwner = await balance.current(owner);

      // 13 and 24 should not be for sale
      await expectRevert(mockERC721Sale.buyToken(mainNFT.contract._address, 13, { from: owner, value: parseEther("1")}), "NotForSale()");
      await expectRevert(mockERC721Sale.buyToken(mainNFT.contract._address, 24, { from: owner, value: parseEther("1")}), "NotForSale()");
      // 16 should not be able to bought by same owner (owner)
      await expectRevert(mockERC721Sale.buyToken(mainNFT.contract._address, 16, { from: owner, value: parseEther("1")}), "SameOwner()");
      // insufficent funds should not be able to buy 32
      await expectRevert(mockERC721Sale.buyToken(mainNFT.contract._address, 32, { from: users[1], value: parseEther("0.1")}), "InsufficentPayment()");

      console.log("before balance: ", +(beforeBalanceOwner.div(div10bn)).toString() / 100000000);
      await mockERC721Sale.buyToken(mainNFT.contract._address, 16, { from: users[1], value: parseEther("1")});
      changedBalanceOwner = await balance.current(owner).then(
        (result: BN) => { 
          return (result.sub(beforeBalanceOwner));
      });
      console.log("changed balance: ", +(changedBalanceOwner.div(div10bn)).toString() / 100000000);
      
      //buy more
      await mockERC721Sale.buyToken(mainNFT.contract._address, 20, { from: users[1], value: parseEther("1")});
      await mockERC721Sale.buyToken(mainNFT.contract._address, 21, { from: users[1], value: parseEther("1")});
      await mockERC721Sale.buyToken(mainNFT.contract._address, 28, { from: users[1], value: parseEther("5")});
      await mockERC721Sale.buyToken(mainNFT.contract._address, 32, { from: users[1], value: parseEther("22")});
      
      changedBalanceOwner = await balance.current(owner).then(
        (result: BN) => { 
          return (result.sub(beforeBalanceOwner));
      });
      console.log("changed balance: ", +(changedBalanceOwner.div(div10bn)).toString() / 100000000);

      // transfer 5 ETH to the mainNFT contract to see what it does (should send 5 ETH to the owner)
      beforeBalanceOwner = await balance.current(owner);
      console.log("Before 5 ETH & transfer; owner balance: ", +beforeBalanceOwner.div(div10bn) / 100000000);
      beforeBalance = await balance.current(users[4]);
      await send.ether(users[1], mainNFT.contract._address, parseEther("5"));
      beforeStake = await mainNFT.checkStake(23, { from: users[1] });
      console.log(beforeStake)
      
      await mockERC721Sale.buyToken(mainNFT.contract._address, 23, { from: users[1], value: parseEther("1")});
      await mockERC721Sale.buyToken(mainNFT.contract._address, 27, { from: users[1], value: parseEther("10")});
      beforeBalanceOwner = await balance.current(owner);
      changedBalanceOwner = await balance.current(owner);
      console.log("After 5 ETH & transfer; owner balance: ", +changedBalanceOwner.div(div10bn) / 100000000);
    });

    it("Check stake (rebate)", async () => {
      console.log("stake of #20:");
      beforeStake = await mainNFT.checkStake(20, { from: users[1] });
      //console.log(beforeStake)
      _balance = await balance.current(mainNFT.contract._address);
      //console.log("contract bal: ", +BN(_balance).div(div10bn).toString() / 100000000);
      console.log("remaining: ", +BN(beforeStake[3]).div(div10bn).toString() / 100000000);
      console.log("initial: ", +BN(beforeStake[4]).div(div10bn).toString() / 100000000);

      console.log("stake of #21:");
      beforeStake = await mainNFT.checkStake(21, { from: users[1] });
      //console.log(beforeStake)
      _balance = await balance.current(mainNFT.contract._address);
      //console.log("contract bal: ", +BN(_balance).div(div10bn).toString() / 100000000);
      console.log("remaining: ", +BN(beforeStake[3]).div(div10bn).toString() / 100000000);
      console.log("initial: ", +BN(beforeStake[4]).div(div10bn).toString() / 100000000);

      console.log("stake of #28:");
      beforeStake = await mainNFT.checkStake(28, { from: users[1] });
      //console.log(beforeStake)
      _balance = await balance.current(mainNFT.contract._address);
      //console.log("contract bal: ", +BN(_balance).div(div10bn).toString() / 100000000);
      console.log("remaining: ", +BN(beforeStake[3]).div(div10bn).toString() / 100000000);
      console.log("initial: ", +BN(beforeStake[4]).div(div10bn).toString() / 100000000);
      await time.increase(604800);

      console.log("stake of #32:");
      beforeStake = await mainNFT.checkStake(32, { from: users[1] });
      //console.log(beforeStake)
      _balance = await balance.current(mainNFT.contract._address);
      //console.log("contract bal: ", +BN(_balance).div(div10bn).toString() / 100000000);
      console.log("remaining: ", +BN(beforeStake[3]).div(div10bn).toString() / 100000000);
      console.log("initial: ", +BN(beforeStake[4]).div(div10bn).toString() / 100000000);
      await time.increase(604800);

      console.log("stake of #23:");
      beforeStake = await mainNFT.checkStake(23, { from: users[1] });
      //console.log(beforeStake)
      _balance = await balance.current(mainNFT.contract._address);
      //console.log("contract bal: ", +BN(_balance).div(div10bn).toString() / 100000000);
      console.log("remaining: ", +BN(beforeStake[3]).div(div10bn).toString() / 100000000);
      console.log("initial: ", +BN(beforeStake[4]).div(div10bn).toString() / 100000000);

      console.log("stake of #27:");
      beforeStake = await mainNFT.checkStake(27, { from: users[1] });
      //console.log(beforeStake)
      _balance = await balance.current(mainNFT.contract._address);
      //console.log("contract bal: ", +BN(_balance).div(div10bn).toString() / 100000000);
      console.log("remaining: ", +BN(beforeStake[3]).div(div10bn).toString() / 100000000);
      console.log("initial: ", +BN(beforeStake[4]).div(div10bn).toString() / 100000000);
    });

    it("Claim stake (rebate)", async () => {
      await mainNFT.claimStake(21, { from: users[1] });
      await time.increaseTo((await time.latest()).add(new BN("3600")));
      expectRevert(await mainNFT.claimStake(21, { from: users[1] }), "OncePerDay(uint256, uint256");

      // perform stake after 1 year
      // ----------------------------------------------------------------------
      console.log("before claim stake of #27:");
      beforeStake = await mainNFT.checkStake(27, { from: users[1] });
      console.log(beforeStake)
      _balance = await balance.current(mainNFT.contract._address);
      //console.log("contract bal: ", +BN(_balance).div(div10bn).toString() / 100000000);
      console.log("balance: ", +(await balance.current(beforeStake[5])).div(div10bn).toString() / 100000000);
      console.log("remaining: ", +BN(beforeStake[3]).div(div10bn).toString() / 100000000);
      console.log("initial: ", +BN(beforeStake[4]).div(div10bn).toString() / 100000000);
      console.log("current time: ", (await time.latest()).toString());

      await time.increaseTo((await time.latest()).add(new BN("31536000"))); // second
      await mainNFT.claimStake(27, { from: users[1] });

      console.log("after claim stake of #27:");
      beforeStake = await mainNFT.checkStake(27, { from: users[1] });
      //console.log(beforeStake)
      _balance = await balance.current(mainNFT.contract._address);
      //console.log("contract bal: ", +BN(_balance).div(div10bn).toString() / 100000000);
      console.log("balance: ", +(await balance.current(beforeStake[5])).div(div10bn).toString() / 100000000);
      console.log("remaining: ", +BN(beforeStake[3]).div(div10bn).toString() / 100000000);
      console.log("initial: ", +BN(beforeStake[4]).div(div10bn).toString() / 100000000);
      console.log("current time: ", (await time.latest()).toString());

      // cannot claim twice in 24hr period
      //expectRevert(await mainNFT.claimStake(27));




      //await time.increaseTo(startTimestamp.add(new BN("1"))); // second
      //await time.increaseTo(startTimestamp.add(new BN("60"))); // minute
      //await time.increaseTo(startTimestamp.add(new BN("3600"))); // hour
      //await time.increaseTo(startTimestamp.add(new BN("86400"))); // day
      //await time.increaseTo(startTimestamp.add(new BN("31516000"))); // year
    });

    it("User cannot buy tickets before startTimestamp", async () => {
      //startTimestamp = (await time.latest()).add(new BN("3650"));
      //const result = await nftSale.setSaleProperties(startTimestamp.toString(), maxPerAddress, maxPerTransaction, { from: operator, });

      //expectEvent(result, "NewSaleProperties", {
      //  startTimestamp: startTimestamp.toString(),
      //  maxPerAddress: maxPerAddress,
      //  maxPerTransaction: maxPerTransaction,
      //});

      //await expectRevert(nftSale.buyTickets("10", { from: alice }), "Tickets: Too early to buy");
      //await time.increaseTo(startTimestamp.add(new BN("1")));
    });

    it("User can buy 40 tickets in multiple transactions", async () => {
      //let result = await nftSale.buyTickets("10", { from: alice });
      //expectEvent(result, "TicketsDistributed", { user: alice, numberTickets: "10" });
//
      //assert.equal(String(await nftSale.viewNumberTicketsOfUser(alice)), "11");
//
      //expectEvent.inTransaction(result.receipt.transactionHash, mockCake, "Transfer", {
      //  from: alice,
      //  to: nftSale.address,
      //  value: parseEther("10").toString(),
      //});
    });
  });
});
