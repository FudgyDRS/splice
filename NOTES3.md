Hardhat unit tests have bad documentation.

Say you have a function that has multiple functions with the same name but different parameters (i.e. an 'overload'). There are many solutions on how to call these functions that can be found online. For example, [here](https://github.com/ethers-io/ethers.js/issues/407):

```
it("should call overloading functions - web3js", async function() {
  const sampleContractWeb3 = new web3.eth.Contract(abi, address);

  const f1 = await sampleContractWeb3.methods.overloading().call();
  const f2 = await sampleContractWeb3.methods.overloading("a").call();
  const f3 = await sampleContractWeb3.methods.overloading("a", "b").call();

  expect(f1).to.equal("1");
  expect(f2).to.equal("2");
  expect(f3).to.equal("3");
  });

it("should call overloading functions - ethers", async function() {
  const provider = new ethers.providers.JsonRpcProvider();
  const sampleContractEthers = new ethers.Contract(address, abi, provider);

  const f1 = await sampleContractEthers["overloading()"]();
  const f2 = await sampleContractEthers["overloading(string)"]("a");
  const f3 = await sampleContractEthers["overloading(string,string)"](
    "a",
    "b"
  );

  expect(f1.toNumber()).to.equal(1);
  expect(f2.toNumber()).to.equal(2);
  expect(f3.toNumber()).to.equal(3);
});
```

Okay great, but what if you need to call this specific function from a specific wallet. It will default to the Owner. If we add the `{from: account}` to the arguments we will either get an unacceptable number of parameters (reading and extra parater and forcing the runtime to default to the one with less parameters) or be rejected as a function that does not exist.

Well it's not documented but inside of a contract created using the new instance you can find the methods of that object:

```
const MainContract = artifacts.require("MainContract");
let mainContract;

contract("Main NFT", ([owner, ...users]) => {
  mainContract = await MainContract.new("My Token", "MYTKN", { from: owner });
  console.log(mainContract)
}

/** Output (the part that matters being the fucntion methods):
  * methods:
  * 'functionName()': [Function (anonymous)] {
  *       call: [Function (anonymous)],
  *       sendTransaction: [Function (anonymous)],
  *       estimateGas: [Function (anonymous)],
  *       request: [Function (anonymous)]
  * },
  * 'functionName(address,uint256)': [Function (anonymous)] {
  *       call: [Function (anonymous)],
  *       sendTransaction: [Function (anonymous)],
  *       estimateGas: [Function (anonymous)],
  *       request: [Function (anonymous)]
  * },
  */
```

Here you can now see the actual function method hardhat is calling and the function options that actual method has. Turns out the one we care about is `sendTransaction` and this is how you call specific function from a specific wallet:

```
await mainContract['functionName(address,uint256)']
  .sendTransaction(users[5], 12345, { from: users[0] });
```

Simple enough but not well known, maybe?
