const {
  BN,           // Big Number support
  constants,    // Common constants, like the zero address and largest integers
  expectEvent,  // Assertions for emitted events
  expectRevert,
  time, // Assertions for transactions that should fail
} = require('@openzeppelin/test-helpers');

var Auction = artifacts.require("Auction");


contract("Auction", async accounts => {
    it("test Auction.bid gas consumption", async () => {
      const instance = await Auction.new(accounts[0], 30);
        global.profilerSubprovider.start();

        const result = await instance.bid({value:10});
        global.profilerSubprovider.stop();

        const gasUsed = await result.receipt.gasUsed;
      console.log("Auction.bid Gas Used: ", gasUsed);


    });

    it("test Auction.withdraw gas consumption", async () => {
        const instance = await Auction.new(accounts[0], 30);
        await instance.bid({value:20, sender: accounts[1]});
        await instance.bid({value:40, sender: accounts[0]});
        await time.increase(time.duration.seconds(31));
        await instance.endAuction();
        global.profilerSubprovider.start();

        const result = await instance.withdraw();
        global.profilerSubprovider.stop();

        const gasUsed = await result.receipt.gasUsed;
        console.log("Auction.withdraw Gas Used: ", gasUsed);
  
  
      });

    it("test Auction.auctionEnd gas consumption", async () => {
    const instance = await Auction.new(accounts[0], 30);
    await time.increase(time.duration.seconds(31));
        global.profilerSubprovider.start();

        const result = await instance.endAuction();
        global.profilerSubprovider.stop();

        const gasUsed = await result.receipt.gasUsed;
    console.log("Auction.auctionEnd Gas Used: ", gasUsed);


    });


    after("write profiler output", async () => {
        await global.profilerSubprovider.writeProfilerOutputAsync();
    });

    
});