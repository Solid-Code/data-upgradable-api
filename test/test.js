const API = artifacts.require("./api.sol");
const Data = artifacts.require("./data.sol");

contract("save and retrieve data", async accounts => {
    it("Values should equal set values", async () => {
        let data_instance = await Data.deployed();
        let api_instance = await API.deployed();
        var bytes32 = await web3.utils.randomHex(32);
        console.log("Random bytes32: " + bytes32);
        await api_instance.set_data(bytes32,bytes32);
        var get_data = await api_instance.get_data(accounts[0]);
        console.log("Returned Data: " + get_data[0]);

        assert.equal(get_data[0], bytes32, "Return Value should equal value set.");
        assert.equal(get_data[1], bytes32, "Return Value should equal value set.");
    });
});