pragma solidity >=0.4.18;
contract vote {
    mapping(bytes32 => uint8) public getVotedNum;
    bytes32[] public voterList;

    function vote() public {
        voterList[voterList.length++] = "James";
    }

    function addCandidate(bytes32 name) public returns (bytes32) {
        require(!checkVoter(name));
        voterList[voterList.length++] = name;
        return voterList[voterList.length - 1];
    }
    
    function getVoteNum(bytes32 name) public view returns (uint8) {
        require(checkVoter(name));
        return getVotedNum[name];
    }
    
    function voteForOne(bytes32 name) public{
        require(checkVoter(name));
        getVotedNum[name]++;
    }
    
    function cancelVoteForOne(bytes32 name) public {
        require(checkVoter(name));
        getVotedNum[name]--;
    }
    
    function checkVoter(bytes32 name) public view returns (bool) {
        for (uint i = 0; i < voterList.length; ++i) {
            if (voterList[i] == name) {
                return true;
            }
        }
        return false;
    }
}