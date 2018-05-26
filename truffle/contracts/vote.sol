pragma solidity ^0.4.4;


contract vote {

	mapping (address => bool) public voted;
	uint clintonCount;
	uint trumpCount;

	event voteEvent((uint eventID, string message));

	function castVote(address voter, uint candidate) public {
		if(hasVoted(voter)){
			voteEvent(0, "Account has already voted");
			return;
		}
		if (candidate == 1){ clintonCount++; }
		else if (candidate == 2){ trumpCount++; }
		else{
			voteEvent(1, "Not a valid candidate.");
			return;
		}
		voted[voter] = true;
		voteEvent(2, "Vote cast. ");
		return;
	}
	function hasVoted(address, entityAddress) public view returns(bool voteRecordExists){
		return voted[entityAddress];
	}

	function voteCount(uint candidate) public view returns(uint votes) {
		if (candidate == 1){ return clintonCount;}
		else if (candidate == 2){ return trumpCount;}
		else{
			revert();
		}
	}
}
