contract Wallet {
    struct BalanceOfTuple {
        int n;
        bool _valid;
    }

    struct TotalSupplyTuple {
        int n;
        bool _valid;
    }

    struct OwnerTuple {
        address p;
        bool _valid;
    }

    mapping(address => BalanceOfTuple) balanceOf;
    TotalSupplyTuple totalSupply;
    OwnerTuple owner;

    event Transfer(address from, address to, int amount);
    event Mint(address p, int amount);
    event Burn(address p, int amount);
    constructor() public {
        updateOwnerOnInsertConstructor_r2();
    }
    function transfer(address s, address r, int n) public {
        //      bool r12 = updateTransferOnInsertRecv_transfer_r12(from,to,amount);

        bool r12 = false;
        //  function updateTransferOnInsertRecv_transfer_r12(address s,address r,int n) private   returns (bool)
        {
            BalanceOfTuple memory balanceOfTuple = balanceOf[s];
            if (true) {
                int m = balanceOfTuple.n;
                if (m >= n && n > 0) {
                    //  updateTotalOutOnInsertTransfer_r4(s,n);
                    //      function updateTotalOutOnInsertTransfer_r4(address p,int n) private
                    {
                        int delta = int(n);
                        //  updateBalanceOfOnIncrementTotalOut_r1(s,delta);
                        //          function updateBalanceOfOnIncrementTotalOut_r1(address p,int o) private
                        {
                            balanceOf[s].n -= delta;
                        }

                    }

                    //  updateTotalInOnInsertTransfer_r6(r,n);

                    //      function updateTotalInOnInsertTransfer_r6(address p,int n) private
                    {
                        int delta = int(n);
                        //  updateBalanceOfOnIncrementTotalIn_r1(r,delta);
                        //          function updateBalanceOfOnIncrementTotalIn_r1(address p,int i) private
                        {
                            balanceOf[r].n += delta;
                        }
                    }
                    emit Transfer(s, r, n);
                    r12 = true;
                }
            }
        }
        if (r12 == false) {
            revert("Rule condition failed");
        }
    }
    //  function mint(address p,int amount) public    {
    //      bool r9 = updateMintOnInsertRecv_mint_r9(p,amount);
    //      if(r9==false) {
    //        revert("Rule condition failed");
    //      }
    //  }

    function mint(address p, int n) public {
        //      bool r9 = updateMintOnInsertRecv_mint_r9(p,amount);

        bool r9 = false;
        {

            if (true) {
                address s = owner.p;
                if (s == msg.sender) {
                    if (n > 0 && p != address(0)) {
                        {
                            //                  updateAllMintOnInsertMint_r0(n);
                            int delta = int(n);
                            {
                                //                      updateTotalSupplyOnIncrementAllMint_r8(delta);
                                totalSupply.n += delta;
                            }
                        }
                        {
                            //                  updateTransferOnInsertMint_r10(p,n);


                            if (true) {
                                //                          updateTotalOutOnInsertTransfer_r4(address(0),n);

                                //                          function updateTotalOutOnInsertTransfer_r4(address p,int n) private
                                {
                                    int delta = int(n);
                                    //                      updateBalanceOfOnIncrementTotalOut_r1(address(0),delta);
                                    //                              function updateBalanceOfOnIncrementTotalOut_r1(address p,int o) private
                                    {
                                        balanceOf[address(0)].n -= delta;
                                    }
                                }

                                //                          updateTotalInOnInsertTransfer_r6(p,n);
                                //                          function updateTotalInOnInsertTransfer_r6(address p,int n) private
                                {
                                    int delta = int(n);
                                    //                      updateBalanceOfOnIncrementTotalIn_r1(p,delta);
                                    //                              function updateBalanceOfOnIncrementTotalIn_r1(address p,int i) private
                                    {
                                        balanceOf[p].n += delta;
                                    }

                                }
                                emit Transfer(address(0), p, n);
                            }
                        }
                        emit Mint(p, n);
                        r9 = true;
                    }

                }
            }

        }

        if (r9 == false) {
            revert("Rule condition failed");
        }
    }

    function getTotalSupply() public view returns (int) {
        int n = totalSupply.n;
        return n;
    }

    function getBalanceOf(address p) public view returns (int) {
        BalanceOfTuple memory balanceOfTuple = balanceOf[p];
        int n = balanceOfTuple.n;
        return n;
    }

    function burn(address p, int n) public {

        //      bool r3 = updateBurnOnInsertRecv_burn_r3(p,amount);
        //  function updateBurnOnInsertRecv_burn_r3(address p,int n) private   returns (bool)
        bool r3 = false;
        {
            if (true) {
                address s = owner.p;
                if (s == msg.sender) {
                    BalanceOfTuple memory balanceOfTuple = balanceOf[p];
                    if (true) {
                        int m = balanceOfTuple.n;
                        if (p != address(0) && n <= m) {
                            //                            updateTransferOnInsertBurn_r11(p, n);
                            //                            function updateTransferOnInsertBurn_r11(address p,int n) private
                            {
                                if (true) {
                                    //                        updateTotalOutOnInsertTransfer_r4(p,n);

                                    //                            function updateTotalOutOnInsertTransfer_r4(address p,int n) private
                                    {
                                        int delta = int(n);
                                        //                        updateBalanceOfOnIncrementTotalOut_r1(p,delta);
                                        //                                function updateBalanceOfOnIncrementTotalOut_r1(address p,int o) private
                                        {
                                            balanceOf[p].n -= delta;
                                        }
                                    }

                                    //                        updateTotalInOnInsertTransfer_r6(address(0),n);



                                    //                            function updateTotalInOnInsertTransfer_r6(address p,int n) private
                                    {
                                        int delta = int(n);
                                        //                        updateBalanceOfOnIncrementTotalIn_r1(p,delta);
                                        //                                function updateBalanceOfOnIncrementTotalIn_r1(address p,int i) private
                                        {
                                            balanceOf[address(0)].n += delta;
                                        }

                                    }
                                    emit Transfer(p, address(0), n);
                                }
                            }

                            //                            updateAllBurnOnInsertBurn_r7(n);
                            //                            function updateAllBurnOnInsertBurn_r7(int n) private
                            {
                                int delta = int(n);
                                //                        updateTotalSupplyOnIncrementAllBurn_r8(delta);
                                //                                function updateTotalSupplyOnIncrementAllBurn_r8(int b) private
                                {
                                    totalSupply.n -= delta;
                                }
                            }
                            emit Burn(p, n);
                            r3 = true;
                        }
                    }
                }
            }

        }
        if (r3 == false) {
            revert("Rule condition failed");
        }
    }


    function updateAllBurnOnInsertBurn_r7(int n) private {
        int delta = int(n);
        updateTotalSupplyOnIncrementAllBurn_r8(delta);
    }

    function updateOwnerOnInsertConstructor_r2() private {
        if (true) {
            address s = msg.sender;
            if (true) {
                owner = OwnerTuple(s, true);
            }
        }
    }

    function updateTransferOnInsertBurn_r11(address p, int n) private {
        if (true) {
            updateTotalOutOnInsertTransfer_r4(p, n);
            updateTotalInOnInsertTransfer_r6(address(0), n);
            emit Transfer(p, address(0), n);
        }
    }

    function updateTotalInOnInsertTransfer_r6(address p, int n) private {
        int delta = int(n);
        updateBalanceOfOnIncrementTotalIn_r1(p, delta);
    }

    function updateTotalSupplyOnIncrementAllBurn_r8(int b) private {
        totalSupply.n -= b;
    }

    function updateBalanceOfOnIncrementTotalIn_r1(address p, int i) private {
        balanceOf[p].n += i;
    }

    function updateuintByint(uint x, int delta) private returns (uint) {
        int convertedX = int(x);
        int value = convertedX + delta;
        uint convertedValue = uint(value);
        return convertedValue;
    }

    function updateTransferOnInsertMint_r10(address p, int n) private {
        if (true) {
            updateTotalOutOnInsertTransfer_r4(address(0), n);
            updateTotalInOnInsertTransfer_r6(p, n);
            emit Transfer(address(0), p, n);
        }
    }

    function updateintByint(int x, int delta) private returns (int) {
        int newValue = x + delta;
        return newValue;
    }

    function updateAllMintOnInsertMint_r0(int n) private {
        int delta = int(n);
        updateTotalSupplyOnIncrementAllMint_r8(delta);
    }

    function updateBurnOnInsertRecv_burn_r3(address p, int n) private returns (bool) {
        if (true) {
            address s = owner.p;
            if (s == msg.sender) {
                BalanceOfTuple memory balanceOfTuple = balanceOf[p];
                if (true) {
                    int m = balanceOfTuple.n;
                    if (p != address(0) && n <= m) {
                        updateTransferOnInsertBurn_r11(p, n);
                        updateAllBurnOnInsertBurn_r7(n);
                        emit Burn(p, n);
                        return true;
                    }
                }
            }
        }
        return false;
    }

    function updateTotalOutOnInsertTransfer_r4(address p, int n) private {
        int delta = int(n);
        updateBalanceOfOnIncrementTotalOut_r1(p, delta);
    }

    function updateTotalSupplyOnIncrementAllMint_r8(int m) private {
        totalSupply.n += m;
    }

    function updateTransferOnInsertRecv_transfer_r12(address s, address r, int n) private returns (bool) {
        BalanceOfTuple memory balanceOfTuple = balanceOf[s];
        if (true) {
            int m = balanceOfTuple.n;
            if (m >= n && n > 0) {
                updateTotalOutOnInsertTransfer_r4(s, n);
                updateTotalInOnInsertTransfer_r6(r, n);
                emit Transfer(s, r, n);
                return true;
            }
        }
        return false;
    }

    function updateMintOnInsertRecv_mint_r9(address p, int n) private returns (bool) {
        if (true) {
            address s = owner.p;
            if (s == msg.sender) {
                if (n > 0 && p != address(0)) {
                    updateAllMintOnInsertMint_r0(n);
                    updateTransferOnInsertMint_r10(p, n);
                    emit Mint(p, n);
                    return true;
                }
            }
        }
        return false;
    }

    function updateBalanceOfOnIncrementTotalOut_r1(address p, int o) private {
        balanceOf[p].n -= o;
    }
}