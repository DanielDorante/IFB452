// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract CarbonChain {
    address public owner;

    struct Submission {
        address company;
        string data;
        int impactValue; // pos or neg
        bool validated;
        bool exists;
    }

    struct ImpactToken {
        int score;
        bool exists;
    }

    uint public submissionCount;
    mapping (uint => Submission) public submissions;
    mapping (address => ImpactToken) public impactTokens;

    event SubmissionCreated(uint id, address indexed company);
    event SubmissionValidated(uint id, bool valid, int impactValue);
    event ScoreUpdated(address indexed company, int newScore);

    constructor() {
        owner = msg.sender;
    }

    // companies submit environmental actions
    function submitEnvironmentalAction(string memory _data) public {
        submissionCount++;
        submissions[submissionCount] = Submission({
            company: msg.sender,
            data: _data,
            impactValue: 0, // placeholder for now
            validated: false,
            exists: true
        });
        emit SubmissionCreated(submissionCount, msg.sender);
    }

    // validator assigns a pos or neg score to submission
    function validateAction(uint _id, int _impactValue) public {
        require(submissions[_id].exists, "submission does not exist");
        require(!submissions[_id].validated, "already validated");

        Submission storage s = submissions[_id];
        s.validated = true;
        s.impactValue = _impactValue;

        // update or create the token for company
        ImpactToken storage token = impactTokens[s.company];
        if (!token.exists) {
            impactTokens[s.company] = ImpactToken({
                score: _impactValue,
                exists: true
            });
        } else {
            token.score += _impactValue;
        }

        emit SubmissionValidated(_id, true, _impactValue);
        emit ScoreUpdated(s.company, impactTokens[s.company].score);
    }

    // public seeing company score
    function getCompanyScore(address _company) public view returns (int) {
        require(impactTokens[_company].exists, "NO score for this company");
        return impactTokens[_company].score;
    }

    // view submission full info
    function viewSubmission(uint _id) public view returns (
        address company,
        string memory data,
        int impactValue,
        bool validated
    ) {
        require(submissions[_id].exists, "Submissions not found");
        Submission memory s = submissions[_id];
        return (s.company, s.data, s.impactValue, s.validated);
    }
}
