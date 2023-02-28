contract Auction {
    struct BalanceTuple {
        uint n;
        bool _valid;
    }

    struct OwnerTuple {
        address p;
        bool _valid;
    }

    struct BeneficiaryTuple {
        address p;
        bool _valid;
    }

    struct HighestBidTuple {
        address bidder;
        uint amount;
        bool _valid;
    }

    struct EndTimeTuple {
        uint t;
        bool _valid;
    }

    struct EndTuple {
        bool b;
        bool _valid;
    }

    mapping(address => BalanceTuple) balance;
    BeneficiaryTuple beneficiary;
    HighestBidTuple highestBid;
    EndTimeTuple endTime;
    OwnerTuple owner;
    EndTuple end;

    event Withdraw(address bidder, uint amount);
    event Send(address p, uint amount);
    event Bid(address bidder, uint amount);
    event End(bool b);
    constructor(address beneficiary, uint biddingTime) public {
        updateOwnerOnInsertConstructor_r9();
        updateBeneficiaryOnInsertConstructor_r11(beneficiary);
        updateEndTimeOnInsertConstructor_r14(biddingTime);
    }


    function bid() public payable {
        //        bool r10 = updateBidOnInsertRecv_bid_r10();

        //    function updateBidOnInsertRecv_bid_r10() private returns (bool)
        bool r10 = false;
        {
            if (true) {
                uint t1 = block.timestamp;
                if (true) {
                    uint t2 = endTime.t;
                    if (true) {
                        uint m = highestBid.amount;
                        if (false == end.b) {
                            if (true) {
                                uint n = msg.value;
                                if (true) {
                                    address p = msg.sender;
                                    if (n > m && t1 < t2) {
                                        //    updateHighestBidOnInsertBid_r0(p, n);

                                        //        function updateHighestBidOnInsertBid_r0(address p, uint m) private
                                        {
                                            HighestBidTuple memory highestBidTuple = highestBid;
                                            uint _max = highestBid.amount;
                                            if (n > _max) {
                                                highestBid = HighestBidTuple(p, n, true);
                                            }
                                        }

                                        //    updateBidTotalOnInsertBid_r12(p, n);

                                        //        function updateBidTotalOnInsertBid_r12(address p, uint m) private
                                        {
                                            int delta = int(n);
                                            //    updateBalanceOnIncrementBidTotal_r7(p, delta);

                                            //            function updateBalanceOnIncrementBidTotal_r7(address p, int b) private
                                            {
                                                int _delta = int(delta);
                                                uint newValue = updateuintByint(balance[p].n, _delta);
                                                balance[p].n = newValue;
                                            }
                                        }
                                        emit Bid(p, n);
                                        r10 = true;
                                    }
                                }
                            }
                        }
                    }
                }
            }
            //    return false;
        }
        if (r10 == false) {
            revert("Rule condition failed");
        }
    }


    function withdraw() public {
        //        bool r1 = updateWithdrawOnInsertRecv_withdraw_r1();

        //        function updateWithdrawOnInsertRecv_withdraw_r1() private returns (bool)
        bool r1 = false;
        {
            if (true) {
                address p = highestBid.bidder;
                uint m = highestBid.amount;
                if (true == end.b) {
                    if (p == msg.sender) {
                        BalanceTuple memory balanceTuple = balance[p];
                        if (true) {
                            uint n = balanceTuple.n;
                            if (n > m) {
                                uint s = n - m;
                                //    updateWithdrawTotalOnInsertWithdraw_r3(p, s);
                                //        function updateWithdrawTotalOnInsertWithdraw_r3(address p, uint m) private
                                {
                                    int delta = int(s);
                                    //    updateBalanceOnIncrementWithdrawTotal_r7(p, delta);

                                    //            function updateBalanceOnIncrementWithdrawTotal_r7(address p, int w) private
                                    {
                                        int _delta = int(- delta);
                                        uint newValue = updateuintByint(balance[p].n, _delta);
                                        balance[p].n = newValue;
                                    }
                                }
                                //    updateSendOnInsertWithdraw_r8(p, s);
                                //        function updateSendOnInsertWithdraw_r8(address p, uint n) private
                                {
                                    if (true) {
                                        payable(p).send(s);
                                        emit Send(p, s);
                                    }
                                }
                                emit Withdraw(p, s);
                                r1 = true;
                            }
                        }
                    }
                }
            }
            //    return false;
        }
        bool r5 = updateWithdrawOnInsertRecv_withdraw_r5();
        if (r1 == false && r5 == false) {
            revert("Rule condition failed");
        }
    }


    function endAuction() public {
        //        bool r2 = updateSendOnInsertRecv_endAuction_r2();

        //        function updateSendOnInsertRecv_endAuction_r2() private returns (bool)
        bool r2 = false;
        {
            if (true) {
                uint t1 = block.timestamp;
                if (true) {
                    address s = msg.sender;
                    if (true) {
                        address p = beneficiary.p;
                        if (true) {
                            uint t2 = endTime.t;
                            if (true) {
                                uint n = highestBid.amount;
                                if (false == end.b) {
                                    if (s == owner.p) {
                                        if (t1 >= t2) {
                                            payable(p).send(n);
                                            emit Send(p, n);
                                            r2 = true;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            //    return false;
        }


        //        bool r4 = updateEndOnInsertRecv_endAuction_r4();

        //    function updateEndOnInsertRecv_endAuction_r4() private returns (bool)
        bool r4 = false;
        {
            if (true) {
                uint t1 = block.timestamp;
                if (true) {
                    address s = msg.sender;
                    if (true) {
                        uint t2 = endTime.t;
                        if (false == end.b) {
                            if (s == owner.p) {
                                if (t1 >= t2) {
                                    end = EndTuple(true, true);
                                    emit End(true);
                                    r4 = true;
                                }
                            }
                        }
                    }
                }
            }
            //    return false;
        }


        if (r2 == false && r4 == false) {
            revert("Rule condition failed");
        }
    }

    function getBalance(address p) public view returns (uint) {
        BalanceTuple memory balanceTuple = balance[p];
        uint n = balanceTuple.n;
        return n;
    }

    function updateOwnerOnInsertConstructor_r9() private {
        if (true) {
            address s = msg.sender;
            if (true) {
                owner = OwnerTuple(s, true);
            }
        }
    }

    function updateEndOnInsertRecv_endAuction_r4() private returns (bool) {
        if (true) {
            uint t1 = block.timestamp;
            if (true) {
                address s = msg.sender;
                if (true) {
                    uint t2 = endTime.t;
                    if (false == end.b) {
                        if (s == owner.p) {
                            if (t1 >= t2) {
                                end = EndTuple(true, true);
                                emit End(true);
                                return true;
                            }
                        }
                    }
                }
            }
        }
        return false;
    }

    function updateBidTotalOnInsertBid_r12(address p, uint m) private {
        int delta = int(m);
        updateBalanceOnIncrementBidTotal_r7(p, delta);
    }

    function updateuintByint(uint x, int delta) private returns (uint) {
        int convertedX = int(x);
        int value = convertedX + delta;
        uint convertedValue = uint(value);
        return convertedValue;
    }

    function updateBalanceOnIncrementBidTotal_r7(address p, int b) private {
        int _delta = int(b);
        uint newValue = updateuintByint(balance[p].n, _delta);
        balance[p].n = newValue;
    }

    function updateSendOnInsertRecv_endAuction_r2() private returns (bool) {
        if (true) {
            uint t1 = block.timestamp;
            if (true) {
                address s = msg.sender;
                if (true) {
                    address p = beneficiary.p;
                    if (true) {
                        uint t2 = endTime.t;
                        if (true) {
                            uint n = highestBid.amount;
                            if (false == end.b) {
                                if (s == owner.p) {
                                    if (t1 >= t2) {
                                        payable(p).send(n);
                                        emit Send(p, n);
                                        return true;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return false;
    }

    function updateWithdrawTotalOnInsertWithdraw_r3(address p, uint m) private {
        int delta = int(m);
        updateBalanceOnIncrementWithdrawTotal_r7(p, delta);
    }

    function updateBeneficiaryOnInsertConstructor_r11(address p) private {
        if (true) {
            beneficiary = BeneficiaryTuple(p, true);
        }
    }

    function updateSendOnInsertWithdraw_r8(address p, uint n) private {
        if (true) {
            payable(p).send(n);
            emit Send(p, n);
        }
    }

    function updateHighestBidOnInsertBid_r0(address p, uint m) private {
        HighestBidTuple memory highestBidTuple = highestBid;
        uint _max = highestBid.amount;
        if (m > _max) {
            highestBid = HighestBidTuple(p, m, true);
        }
    }

    function updateWithdrawOnInsertRecv_withdraw_r1() private returns (bool) {
        if (true) {
            address p = highestBid.bidder;
            uint m = highestBid.amount;
            if (true == end.b) {
                if (p == msg.sender) {
                    BalanceTuple memory balanceTuple = balance[p];
                    if (true) {
                        uint n = balanceTuple.n;
                        if (n > m) {
                            uint s = n - m;
                            updateWithdrawTotalOnInsertWithdraw_r3(p, s);
                            updateSendOnInsertWithdraw_r8(p, s);
                            emit Withdraw(p, s);
                            return true;
                        }
                    }
                }
            }
        }
        return false;
    }

    function updateWithdrawOnInsertRecv_withdraw_r5() private returns (bool) {
        if (true == end.b) {
            if (true) {
                address h = highestBid.bidder;
                if (true) {
                    address p = msg.sender;
                    BalanceTuple memory balanceTuple = balance[p];
                    if (true) {
                        uint n = balanceTuple.n;
                        if (p != h && n > 0) {
                            updateSendOnInsertWithdraw_r8(p, n);
                            updateWithdrawTotalOnInsertWithdraw_r3(p, n);
                            emit Withdraw(p, n);
                            return true;
                        }
                    }
                }
            }
        }
        return false;
    }

    function updateEndTimeOnInsertConstructor_r14(uint d) private {
        if (true) {
            uint t = block.timestamp;
            if (true) {
                uint t2 = t + d;
                endTime = EndTimeTuple(t2, true);
            }
        }
    }

    function updateBidOnInsertRecv_bid_r10() private returns (bool) {
        if (true) {
            uint t1 = block.timestamp;
            if (true) {
                uint t2 = endTime.t;
                if (true) {
                    uint m = highestBid.amount;
                    if (false == end.b) {
                        if (true) {
                            uint n = msg.value;
                            if (true) {
                                address p = msg.sender;
                                if (n > m && t1 < t2) {
                                    updateHighestBidOnInsertBid_r0(p, n);
                                    updateBidTotalOnInsertBid_r12(p, n);
                                    emit Bid(p, n);
                                    return true;
                                }
                            }
                        }
                    }
                }
            }
        }
        return false;
    }

    function updateBalanceOnIncrementWithdrawTotal_r7(address p, int w) private {
        int _delta = int(- w);
        uint newValue = updateuintByint(balance[p].n, _delta);
        balance[p].n = newValue;
    }
}