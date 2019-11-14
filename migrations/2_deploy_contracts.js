const data = artifacts.require("data");
const api = artifacts.require("api")

module.exports = async function(deployer,networks,accounts) {
  await deployer.deploy(data);
  await deployer.deploy(api, data.address);
  var Data = await data.deployed();
  await Data.set_api_address(api.address);
};
