package com.bankapp.bank.dao;

import com.bankapp.bank.model.ClientBank;
import com.bankapp.bank.model.account;
import com.bankapp.bank.model.operation;

import java.util.List;

public interface doa_op {
    public List<operation> getaccountOps(account u);
    public List<operation> getallClientOps(ClientBank c);

}
