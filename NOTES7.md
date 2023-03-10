People:
Trev			TIX Protocol / Angel Protocol
			TG@twiceinabluemoon
			VC / Grant
			Interest in both (VC Rep?)
Jordan		Groth Node Real / VC Republic
			TG@jordantg
			VC / Grant / RPC company
			Interest in Both (only described Splice
Peter H		Offchain Labs / Works with ARB rollups
			@peterhaymond
			wants to know more about Arbinium
Jeffrey J		Former VC and BD
			@whatupjeff
			might have former connections
Binlesh		cofounder of Foundership - DeFi Incubator
Gundurno	@Binleshgundurno
			interested in space, qi, and learnweb3dao devs
Sebastian	
Varela

Data Notes:
Script is going to hold the values of gas at different times, to exemplify

Initial Supply is 50B for GAS @10gwei = LP: 500k * 10 * 10^8 / 10^18 = 50ETH
How we do a redemption

Token erc20 basic
Static quantity
No burn restriction
Subtract from the total supply
Other contract has permission to do mints
RouterPair TBA

Staking contract has ability to mint
Stake ETH and get 100 PGas per day
Staking shares (diluted shares as more people pool)

Arbitrage
Buy/sell Pgas and exchange for tokens - floating fee
If selling Pgas - create position

Minting tokens
Maint

Test Example: buy NFT using gas
OPTION #1:
Call mint via protocol(address, quantity?)
> calculate function call with leniency 
> liquidate(liquidate quantity to cover gas input)
> contract called mints mintTo caller origin 
	/ if basic mint Function exists call from contract and transferFrom to origin
OPTION #2:
User input NFT address, call etherscan to get ABI (or add ABI) if it exists, list functions
> liquidate(liquidate quantity to cover gas input)
> contract called mints mintTo caller origin 
> call function in question




Initialization fee must be > 0
Create a futures market for the collateral
Liquidation:
Undercollateralized (under 149%)
	other person uses gas token


How to iterate over a
64 nibbles 0~16 value
11*64*n+ leverages
704*n
Maybe score report of overall collateral positions
cTotal pTotal dTotal posTotal
pTotal does not nesicarily influence overall leverage report
y is ETH collateral === constant
y / P*x = CR -> CR / P
0000 / P
Need to determine the ratio of Pgas:basefee
Find value of debt in ETH -> Pgas * basefee
A_c / A_d -> CR_i
A_c / A_d2 -> CR_i2
A_d = Pgas * basefee_i
A_d2 = Pgas * basefee_i2
A_c /Pgas * basefee_i ?= A_c / Pgas * basefee_i2
CR_i * basefee_i ?= if add more collateral to stabilize CR how to add?
-> add
	treated base fee changes for store itterable index
T0 ideal base = 200 for 1000 eth
T1 ideal base = 250 for 1000 eth
	cr = 5 -> cr = 4
	base score = 5000 -> base score = 4000
	add 200 eth -> mint 50 Pgas

Redemption
	when redeeming it targets the lowest CR and covers the redeem off of that collateral that’s under leveraged, use a doublely linked list. All good and well but when CR is improved via minting more, it will cost O(n) to reposition position
Thought: what about a doubly linked list hash table, or just a has table
Maybe a doubly linked list hash map, grouped…NO
Hashmap cannot work since CR is floating
Maybe using the total collateral vs the total debt and number of positions find roughly where the new position could fit in

dadd54bc3edcd9a29c4d3712fe8f9bc5c0dd71e0580627826605568531747961


Link to compilation video: https://youtu.be/p6Mjvg9N_H0

 