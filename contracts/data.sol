pragma solidity >=0.4.21 <0.6.0;

contract data {
  address public owner;
  address public api_address;

  mapping(address => bytes32) public data1;
  mapping(address => bytes32) public data2;

  constructor() public {
    owner = msg.sender;
  }

  function set_api_address(address _api_address) public only_by(owner) {
    api_address = _api_address;
  }

  function get_data(address _address) public view only_by(api_address) returns(bytes32, bytes32){
    return (data1[_address], data2[_address]);
  }

  function set_data(address _sender, bytes32 _data1, bytes32 _data2) public only_by(api_address) returns(bool){
    data1[_sender] = _data1;
    data2[_sender] = _data2;
    return true;
  }

  modifier only_by(address allowed) {
    if (msg.sender == allowed) _;
  }
}
