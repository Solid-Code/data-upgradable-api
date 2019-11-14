pragma solidity >=0.4.21 <0.6.0;

contract api {
  address public owner;
  address public data_address;

  constructor(address _data_address) public {
    owner = msg.sender;
    data_address = _data_address;
  }

  function set_owner(address _owner) public only_by(owner) {
    owner = _owner;
  }

  function set_data_address(address _data_address) public only_by(owner) {
    data_address = _data_address;
  }

  function set_data(bytes32 _data1, bytes32 _data2) public {
    require(Data_interface(data_address).set_data(msg.sender,_data1, _data2), "failed");
  }
  
  function get_data(address _address) public view returns (bytes32, bytes32) {
    return Data_interface(data_address).get_data(_address);
  }

  modifier only_by(address allowed) {
    if (msg.sender == allowed) _;
  }
}

interface Data_interface{
  function get_data(address _address) external view returns(bytes32, bytes32);
  function set_data(address _sender, bytes32 _data1, bytes32 _data2) external  returns(bool);
}