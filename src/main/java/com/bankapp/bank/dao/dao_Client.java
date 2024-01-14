package com.bankapp.bank.dao;

import com.bankapp.bank.model.ClientBank;
import com.bankapp.bank.model.account;

import java.util.List;

public interface dao_Client {
    public ClientBank getClientinfo(String CodeClient);

    List<account> getAllClientAccounts(String c);
}
