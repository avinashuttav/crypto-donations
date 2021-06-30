pragma solidity ^0.8.3;

contract Polyeon {
    
    mapping(uint => address) public creatorAddress;
    mapping(uint => string) public creatorName;
    mapping(string => address) public nameToAddress;
    uint256 public id;
    event Details (address from, address to, uint amount);
    event CreatorAdded (address addressOfCreator, uint id, string name);
    
    function addCreator(address _newAddress, string memory _name) public {
        creatorAddress[id] = _newAddress;
        creatorName[id] = _name;
        nameToAddress[_name] = _newAddress;
        emit CreatorAdded(_newAddress, id, _name);
        id++;
    }
    
    function getAddress(uint _id) public view returns(address){
        return creatorAddress[_id];
    }
    
    function getName(uint _id) public view returns(string memory){
        return creatorName[_id];
    }
    
    // function donateTo(uint _id) public payable{
    //     address payable _to = payable(creatorAddress[_id]);
    //     _to.transfer(msg.value);
    //     emit Details(msg.sender, _to, msg.value);
    // }
    
    function donateUsingName(string memory _name) public payable{
        address payable _to = payable(nameToAddress[_name]);
        _to.transfer(msg.value);
        emit Details(msg.sender, _to, msg.value);
    }
}