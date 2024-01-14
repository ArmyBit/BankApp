package com.bankapp.bank.dao;

import com.bankapp.bank.model.ClientBank;

public interface daouser {
	public boolean check_user(String Username	, String Password);
	public ClientBank createClientforView(String u) ;

}
