const ProviderEngine = require("web3-provider-engine");
const WebsocketSubprovider = require("web3-provider-engine/subproviders/websocket.js");
const {
  ProfilerSubprovider,
  TruffleArtifactAdapter,
} = require("@0t/sol-profiler");

const solcVersion = "0.7.5+commit.eb77ed08";

global.profilerSubprovider = new ProfilerSubprovider(
  new TruffleArtifactAdapter("", solcVersion),
  "0x5409ed021d9299bf6814279a6a1411a7e866a631",
  true
);
global.profilerSubprovider.stop();

const provider = new ProviderEngine();
provider.addProvider(global.profilerSubprovider);
provider.addProvider(
  new WebsocketSubprovider({ rpcUrl: "http://localhost:8545" })
);
provider.start((err) => {
  if (err !== undefined) {
    console.log(err);
    process.exit(1);
  }
});
/**
 * HACK: Truffle providers should have `send` function, while `ProviderEngine` creates providers with `sendAsync`,
 * but it can be easily fixed by assigning `sendAsync` to `send`.
 */
provider.send = provider.sendAsync.bind(provider);

module.exports = {
  compilers: {
    solc: {
      version: solcVersion,
    },
  },
  networks: {
    development: {
      provider,
      network_id: "*",
    },
  },
};
