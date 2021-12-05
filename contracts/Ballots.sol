// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Ballots{

    struct Voter {
        mapping(uint => uint) votedCampaigns;
    }

    struct Campaign{
        uint id;
        string name;
        uint voteCount;
    }

    mapping(uint => Campaign) public campaigns;
    uint campaignsCount;

    mapping(address => Voter) voters;

    function createCampaign(string memory _name) public {
        campaignsCount++;
        campaigns[campaignsCount] = Campaign(campaignsCount, _name, 0);
    }

    function voteCampaign(uint campaignId) external {
        require(voters[msg.sender].votedCampaigns[campaignId] != campaignId, "Already Voted");
        voters[msg.sender].votedCampaigns[campaignId] = campaignId;
        campaigns[campaignId].voteCount++;
    }

}