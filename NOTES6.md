## Concept

`modifier`, or function modifiers, are special blocks of code that are executed before, and/or after, a function call. They cannot be called directly and can only use inputs defined by the function they are modifying.

### Syntax
The syntax of a `modifier` is the naming of the function modifier followed by the input variables in parenthesis. The code block inside of a `modifier` must include the `_` operator.

Inside the `modifier` code block the `_` operator deontes the code where the function being modified executes. Knowing this, it would be correct to assume that code placed before the `_` operator would be executed before the modified function, and code placed after the `_` operator would be executed after the modified function.

The two methods for coding a `modifier` can be seen in the examples below:

```
modifier myModifier1 {
	// some input
	_;
	// some input
}
```
*Example 1.a shows a function modifier that doesn't accept any variables.*

*Note: in `example 1.a` above we could have denoted the `modifier myModifier1` as `modifier myModifier1()` instead and it would be completely the same function.*

```
modifier myModifier2(address address_, uint256 number_) {
	// some input
	_;
	// some input
}
```
*Example 1.b shows a function modifier that accepts multiple variables.*



### Differentiation

Any code that's ran inside of a `modifier` could be replaced by code blocks at the beginning and end of the function to be modified. These code blocks could be calling `private` or `internal` function(s) or even be pasted code.

The `modifier` makes life easier by making code more readable and enforcing control flow.

## Documentation

### Definition & Initalization

Define the function modifier:

```
modifier myModifier { 
    _;
}
```

Remember that `_` operator denotes where the code block of the modified function takes place.

Define the function to be modified:

```
function myFunction() public myModifier {}
```

### Example

```
pragma solidity ^0.8.16;

import "hardhat/console.sol";

contract test {
    modifier myModifier(uint256 input1, uint256 input2) {
        console.log("before:", input1);
        _;
        console.log("after:", input2);
    }

    function myFunction(uint256 input1, uint256 input2, uint256 input3) public myModifier(input1, input2) {
        console.log("during:", input3);
    }
}
```
*Example 2.a shows a full Remix coding example of how to use a `modifier`*

After running the above code with the inputs of 1, 2, and 3 for input1, input2, and input 3, respectively, the following code will output to you console:

```
console.log:
before: 1
during: 3
after: 2
```
*Example 2.b exemplifies the control flow of Example 2.a given the inputs 1, 2, 3*

### Advance Example

```
pragma solidity ^0.8.16;

contract test {
    mapping(address => uint256) public accountFunds;
    bool locked;

    modifier noReentry {
        locked = true;
        _;
        locked = false;
    }

    function deposit() public payable noReentry {
        accountFunds[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public noReentry {
        require(accountFunds[msg.sender] >= amount, "Insufficent balance");
        msg.sender.call{value: amount}("");
    }
    
    receive() external payable {}
}
```
*Example 3 is an simple deposit and withdraw contract (like an ATM). `noReentry` modifier in this example prevents call of any other function with the `noReentry` modifier.*