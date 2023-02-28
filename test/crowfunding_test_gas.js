var CrowFunding = artifacts.require("CrowFunding");


contract("CrowFunding", async accounts => {
    it("test datalog CrowFunding.invest gas consumption", async () => {
      const instance = await CrowFunding.new(10, accounts[0]);
        global.profilerSubprovider.start();

        const result = await instance.invest();
        global.profilerSubprovider.stop();

        const gasUsed = await result.receipt.gasUsed;
      console.log("datalog CrowFunding.invest Gas Used: ", gasUsed);


    });

    it("test datalog CrowFunding.close gas consumption", async () => {
        const instance = await CrowFunding.new(10, accounts[0]);
        global.profilerSubprovider.start();

        const result = await instance.close();
        global.profilerSubprovider.stop();

        const gasUsed = await result.receipt.gasUsed;
        console.log("datalog CrowFunding.close Gas Used: ", gasUsed);
  
  
      });

    it("test datalog CrowFunding.refund gas consumption", async () => {
        const instance = await CrowFunding.new(10, accounts[0]);
        await instance.invest({value: 5});
        await instance.close();
        global.profilerSubprovider.start();

        const result = await instance.refund();
        global.profilerSubprovider.stop();

        const gasUsed = await result.receipt.gasUsed;
        console.log("datalog CrowFunding.refund Gas Used: ", gasUsed);
  
  
  
      });

      it("test datalog CrowFunding.withdraw gas consumption", async () => {
        const instance = await CrowFunding.deployed();
          global.profilerSubprovider.start();

          const result = await instance.withdraw();
          global.profilerSubprovider.stop();

          const gasUsed = await result.receipt.gasUsed;
        console.log("datalog CrowFunding.withdraw Gas Used: ", gasUsed);
  

  
  
      });



    after("write profiler output", async () => {
        await global.profilerSubprovider.writeProfilerOutputAsync();
    });




});