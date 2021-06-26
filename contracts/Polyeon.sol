pragma solidity ^0.8.3;

contract Polyeon {
    
    mapping(uint => address) public creatorAddress;
    uint256 public id;
    
    function addCreator(address _newAddress) public {
        creatorAddress[id] = _newAddress;
        id++;
    }
    
    function getAddress(uint _id) public view returns(address){
        return creatorAddress[_id];
    }
    
    function donateTo(uint _id) public payable{
        address payable _to = payable(creatorAddress[_id]);
        _to.transfer(msg.value);
    }
}