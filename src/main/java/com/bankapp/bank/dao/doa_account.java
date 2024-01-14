package com.bankapp.bank.dao;

import com.bankapp.bank.model.account;
import com.bankapp.bank.model.user;

import java.util.List;

public interface doa_account {
    public account getAccountinfo(String id);
    public Double getSolde(account acc);


}
