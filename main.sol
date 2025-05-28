// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Contract to record and validate environmental data submissions
contract CarbonChain {
    address public owner; //stores the address of the contract deployer (ownership tracking)

    // Data submission structure and impact score
    struct Submission {
        address company; //address of company submitting the data
        string data; //description of the environmental action submitted 
        int impactValue; // Score either positive or negative
        bool validated; //whether the submission has been validated
        bool exists; //used to confirm if the submission has a valid ID
    }
    struct ImpactToken {
        int score; //total imapct score (sum of all validated submissions)
        bool exists; //wether the token exists for a given company
    }

    uint public submissionCount; //counter to assign UIDS to submissions
    mapping (uint => Submission) public submissions; //maps submission ID to submissions struct
    mapping (address => ImpactToken) public impactTokens; //maps company address to thier impact score

    // Track activity on the blockchain though events
    event SubmissionCreated(uint id, address indexed company);
    event SubmissionValidated(uint id, bool valid, int impactValue);
    event ScoreUpdated(address indexed company, int newScore);

    constructor() {
        owner = msg.sender; //sets the owner to the address that deploys the contract
    }

    // Companies submit environmental actions
    function submitEnvironmentalAction(string memory _data) public {
        submissionCount++; //inc submission ID
        submissions[submissionCount] = Submission({ //store new submission in submission the mapping
            company: msg.sender, // the company submitting the data
            data: _data, // submitted environemntal action
            impactValue: 0, // placeholder for now
            validated: false, // not valdiated
            exists: true //mark submission as valid
        });
        emit SubmissionCreated(submissionCount, msg.sender); //emit event for transparecny
    }

    // Validators to approve and assign a score to a submission
    function validateAction(uint _id, int _impactValue) public {
        require(submissions[_id].exists, "submission does not exist"); //ensure submission exists
        require(!submissions[_id].validated, "already validated"); // prevent reevaulation

        Submission storage s = submissions[_id]; //load submission from storage
        s.validated = true; //mark as validated
        s.impactValue = _impactValue; // assign score

        // Update or create the token for company
        ImpactToken storage token = impactTokens[s.company]; //load companies impact token
        if (!token.exists) {
            impactTokens[s.company] = ImpactToken({ //if no token exists make one
                score: _impactValue,
                exists: true
            });
        } else { //otherwise update existing score
            token.score += _impactValue;
        }

        emit SubmissionValidated(_id, true, _impactValue); //emit validation event
        emit ScoreUpdated(s.company, impactTokens[s.company].score); //emit score update
    }

    // Public function to check the total environmental score of a company
    function getCompanyScore(address _company) public view returns (int) {
        require(impactTokens[_company].exists, "NO score for this company"); //ensure toekn exists
        return impactTokens[_company].score; //returns score
    }

    // Function for the public to view a submission's detail by it's ID
    function viewSubmission(uint _id) public view returns (
        address company,
        string memory data,
        int impactValue,
        bool validated
    ) {
        require(submissions[_id].exists, "Submissions not found"); //ensure submission exists
        Submission memory s = submissions[_id]; //load into memory
        return (s.company, s.data, s.impactValue, s.validated); //return all submission details
    }
}
