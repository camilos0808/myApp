pragma solidity 0.8.0;

/// @title Votación con voto delegado
contract Ballot {

  struct Voter {
    uint weight;
    bool voted;
    address delegate;
    uint vote;
  }

  struct Proposal {
    bytes32 name;
    uint voteCount;
  }

  address public chairperson;
  bool init;

  mapping(address => Voter) public voters;
  Proposal[] public proposals;

  constructor(){
    chairperson = msg.sender;
    voters[chairperson].weight = 1;
  }

  function addProposal(bytes32 proposalNames) public {
    require(!init);
    proposals.push(Proposal({name: proposalNames,voteCount: 0}));
  }

  function get_first_proposal() view public returns (bytes32) {
    require(proposals.length > 0, 'No hay propuestas definidas');
    return proposals[0].name;
  }
}
