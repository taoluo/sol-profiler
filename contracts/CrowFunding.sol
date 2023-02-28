contract CrowFunding {
    struct TargetTuple {
        uint t;
        bool _valid;
    }

    struct OwnerTuple {
        address p;
        bool _valid;
    }

    struct RaisedTuple {
        uint n;
        bool _valid;
    }

    struct ClosedTuple {
        bool b;
        bool _valid;
    }

    struct BeneficiaryTuple {
        address p;
        bool _valid;
    }

    struct BalanceOfTuple {
        uint n;
        bool _valid;
    }

    TargetTuple target;
    RaisedTuple raised;
    ClosedTuple closed;
    BeneficiaryTuple beneficiary;
    mapping(address => BalanceOfTuple) balanceOf;
    OwnerTuple owner;

    event Refund(address p, uint n);
    event Invest(address p, uint n);
    event Closed(bool b);
    event Withdraw(address p, uint n);
    constructor(uint t, address b) public {
        updateTotalBalanceOnInsertConstructor_r12();
        updateOwnerOnInsertConstructor_r7();
        updateTargetOnInsertConstructor_r11(t);
        updateRaisedOnInsertConstructor_r6();
        updateBeneficiaryOnInsertConstructor_r16(b);
    }
    function refund() public {
        //      bool r3 = updateRefundOnInsertRecv_refund_r3();
        bool r3 = false;
        {
            if (true == closed.b) {
                if (true) {
                    address p = msg.sender;
                    if (true) {
                        uint t = target.t;
                        if (true) {
                            uint r = raised.n;
                            BalanceOfTuple memory balanceOfTuple = balanceOf[p];
                            if (true) {
                                uint n = balanceOfTuple.n;
                                if (r < t && n > 0) {
                                    //                                  updateSendOnInsertRefund_r1(p,n);
                                    //                                  function updateSendOnInsertRefund_r1(address p,uint n) private
                                    {
                                        if (true) {
                                            payable(p).send(n);
                                        }
                                    }
                                    //                                  updateRefundTotalOnInsertRefund_r14(p,n);
                                    //                                  function updateRefundTotalOnInsertRefund_r14(address p,uint m) private
                                    {
                                        int delta = int(n);
                                        //                              updateBalanceOfOnIncrementRefundTotal_r2(p,delta);
                                        //                                      function updateBalanceOfOnIncrementRefundTotal_r2(address p,int r) private
                                        {
                                            int _delta = int(- delta);
                                            uint newValue = updateuintByint(balanceOf[p].n, _delta);
                                            balanceOf[p].n = newValue;
                                        }

                                    }
                                    emit Refund(p, n);
                                    r3 = true;
                                }
                            }
                        }
                    }
                }
            }
            //          return false;
        }
        if (r3 == false) {
            revert("Rule condition failed");
        }
    }

    function getRaised() public view returns (uint) {
        uint n = raised.n;
        return n;
    }

    function getClosed() public view returns (bool) {
        bool b = closed.b;
        return b;
    }

    function close() public {
        //      updateClosedOnInsertRecv_close_r9();

        //  function updateClosedOnInsertRecv_close_r9() private   returns (bool)
        bool r9 = false;
        {
            if (true) {
                address s = owner.p;
                if (s == msg.sender) {
                    if (true) {
                        closed = ClosedTuple(true, true);
                        emit Closed(true);
                        r9 = true;
                    }
                }
            }
            //  return false;
        }

        if (r9 == false) {
            revert("Rule condition failed");
        }
    }

    function invest() public payable {
        //      bool r4 = updateInvestOnInsertRecv_invest_r4();
        //  function updateInvestOnInsertRecv_invest_r4() private   returns (bool)
        bool r4 = false;
        {
            if (false == closed.b) {
                if (true) {
                    uint s = raised.n;
                    if (true) {
                        uint t = target.t;
                        if (true) {
                            uint n = msg.value;
                            if (true) {
                                address p = msg.sender;
                                if (s < t) {
                                    //  updateInvestTotalOnInsertInvest_r5(p, n);
                                    //      function updateInvestTotalOnInsertInvest_r5(address p,uint m) private
                                    {
                                        int delta = int(n);
                                        //  updateBalanceOfOnIncrementInvestTotal_r2(p,delta);
                                        //          function updateBalanceOfOnIncrementInvestTotal_r2(address p,int i) private
                                        {
                                            int _delta = int(delta);
                                            uint newValue = updateuintByint(balanceOf[p].n, _delta);
                                            balanceOf[p].n = newValue;
                                        }
                                    }
                                    //  updateRaisedOnInsertInvest_r13(n);
                                    //      function updateRaisedOnInsertInvest_r13(uint m) private
                                    {
                                        int _delta = int(n);
                                        uint newValue = updateuintByint(raised.n, _delta);
                                        raised.n = newValue;
                                    }
                                    emit Invest(p, n);
                                    r4 = true;
                                }
                            }
                        }
                    }
                }
            }
            //  return false;
        }

        if (r4 == false) {
            revert("Rule condition failed");
        }
    }

    function withdraw() public {
        //      bool r8 = updateWithdrawOnInsertRecv_withdraw_r8();

        //  function updateWithdrawOnInsertRecv_withdraw_r8() private   returns (bool)
        bool r8 = false;
        {
            if (true) {
                address p = beneficiary.p;
                if (true) {
                    uint t = target.t;
                    if (true) {
                        uint r = raised.n;
                        if (p == msg.sender) {
                            if (r >= t) {
                                //  updateSendOnInsertWithdraw_r0(p,r);
                                //      function updateSendOnInsertWithdraw_r0(address p,uint r) private
                                {
                                    if (true) {
                                        payable(p).send(r);
                                    }
                                }
                                emit Withdraw(p, r);
                                r8 = true;
                            }
                        }
                    }
                }
            }
            //  return false;
        }

        if (r8 == false) {
            revert("Rule condition failed");
        }
    }

    function updateBeneficiaryOnInsertConstructor_r16(address p) private {
        if (true) {
            beneficiary = BeneficiaryTuple(p, true);
        }
    }

    function updateClosedOnInsertRecv_close_r9() private returns (bool) {
        if (true) {
            address s = owner.p;
            if (s == msg.sender) {
                if (true) {
                    closed = ClosedTuple(true, true);
                    emit Closed(true);
                    return true;
                }
            }
        }
        return false;
    }

    function updateTotalBalanceOnInsertConstructor_r12() private {
        if (true) {
            // Empty()
        }
    }

    function updateInvestTotalOnInsertInvest_r5(address p, uint m) private {
        int delta = int(m);
        updateBalanceOfOnIncrementInvestTotal_r2(p, delta);
    }

    function updateSendOnInsertWithdraw_r0(address p, uint r) private {
        if (true) {
            payable(p).send(r);
        }
    }

    function updateRefundTotalOnInsertRefund_r14(address p, uint m) private {
        int delta = int(m);
        updateBalanceOfOnIncrementRefundTotal_r2(p, delta);
    }

    function updateBalanceOfOnIncrementInvestTotal_r2(address p, int i) private {
        int _delta = int(i);
        uint newValue = updateuintByint(balanceOf[p].n, _delta);
        balanceOf[p].n = newValue;
    }

    function updateTargetOnInsertConstructor_r11(uint t) private {
        if (true) {
            target = TargetTuple(t, true);
        }
    }

    function updateBalanceOfOnIncrementRefundTotal_r2(address p, int r) private {
        int _delta = int(- r);
        uint newValue = updateuintByint(balanceOf[p].n, _delta);
        balanceOf[p].n = newValue;
    }

    function updateSendOnInsertRefund_r1(address p, uint n) private {
        if (true) {
            payable(p).send(n);
        }
    }

    function updateRefundOnInsertRecv_refund_r3() private returns (bool) {
        if (true == closed.b) {
            if (true) {
                address p = msg.sender;
                if (true) {
                    uint t = target.t;
                    if (true) {
                        uint r = raised.n;
                        BalanceOfTuple memory balanceOfTuple = balanceOf[p];
                        if (true) {
                            uint n = balanceOfTuple.n;
                            if (r < t && n > 0) {
                                updateSendOnInsertRefund_r1(p, n);
                                updateRefundTotalOnInsertRefund_r14(p, n);
                                emit Refund(p, n);
                                return true;
                            }
                        }
                    }
                }
            }
        }
        return false;
    }

    function updateInvestOnInsertRecv_invest_r4() private returns (bool) {
        if (false == closed.b) {
            if (true) {
                uint s = raised.n;
                if (true) {
                    uint t = target.t;
                    if (true) {
                        uint n = msg.value;
                        if (true) {
                            address p = msg.sender;
                            if (s < t) {
                                updateInvestTotalOnInsertInvest_r5(p, n);
                                updateRaisedOnInsertInvest_r13(n);
                                emit Invest(p, n);
                                return true;
                            }
                        }
                    }
                }
            }
        }
        return false;
    }

    function updateuintByint(uint x, int delta) private returns (uint) {
        int convertedX = int(x);
        int value = convertedX + delta;
        uint convertedValue = uint(value);
        return convertedValue;
    }

    function updateRaisedOnInsertInvest_r13(uint m) private {
        int _delta = int(m);
        uint newValue = updateuintByint(raised.n, _delta);
        raised.n = newValue;
    }

    function updateOwnerOnInsertConstructor_r7() private {
        if (true) {
            address p = msg.sender;
            if (true) {
                owner = OwnerTuple(p, true);
            }
        }
    }

    function updateWithdrawOnInsertRecv_withdraw_r8() private returns (bool) {
        if (true) {
            address p = beneficiary.p;
            if (true) {
                uint t = target.t;
                if (true) {
                    uint r = raised.n;
                    if (p == msg.sender) {
                        if (r >= t) {
                            updateSendOnInsertWithdraw_r0(p, r);
                            emit Withdraw(p, r);
                            return true;
                        }
                    }
                }
            }
        }
        return false;
    }

    function updateRaisedOnInsertConstructor_r6() private {
        if (true) {
            raised = RaisedTuple(0, true);
        }
    }
}