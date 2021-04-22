const MetaCoin = artifacts.require("MetaCoin");

const mode = process.env.MODE;

contract("MetaCoin", (accounts) => {
  it("should send coin correctly", async () => {
    const metaCoinInstance = await MetaCoin.deployed();
    const accountOne = accounts[0];
    const accountTwo = accounts[1];
    global.profilerSubprovider.start();
    const amount = 1;
    await metaCoinInstance.sendCoin(accountTwo, amount, { from: accountOne });
    global.profilerSubprovider.stop();
  });

  after("write profiler output", async () => {
    await global.profilerSubprovider.writeProfilerOutputAsync();
  });
});
