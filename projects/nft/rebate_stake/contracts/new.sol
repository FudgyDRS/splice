function process(uint256 gas) public returns (uint256, uint256, uint256) {
    	uint256 numberOfTokenHolders = tokenHoldersMap.keys.length;

    	if(numberOfTokenHolders == 0) { return (0, 0, lastProcessedIndex); }

    	uint256 _lastProcessedIndex = lastProcessedIndex;
    	uint256 gasUsed = 0;
    	uint256 gasLeft = gasleft();
    	uint256 iterations = 0;
    	uint256 claims = 0;

    	while(gasUsed < gas && iterations < numberOfTokenHolders) {
    		_lastProcessedIndex++;

    		if(_lastProcessedIndex >= tokenHoldersMap.keys.length) { _lastProcessedIndex = 0; }

    		address account = tokenHoldersMap.keys[_lastProcessedIndex];

    		if(canAutoClaim(lastClaimTimes[account])) {
    			if(processAccount(payable(account), true)) { claims++; }
    		}

    		iterations++;
    		uint256 newGasLeft = gasleft();

    		if(gasLeft > newGasLeft) { gasUsed = gasUsed.add(gasLeft.sub(newGasLeft));}
    		gasLeft = newGasLeft;
    	}

    	lastProcessedIndex = _lastProcessedIndex;
    	return (iterations, claims, lastProcessedIndex);
    }
