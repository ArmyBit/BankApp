package com.bankapp.bank.test;

import com.bankapp.bank.daoImp.Doa_user_imp;
import com.bankapp.bank.daoImp.doa_ClientBank;
import com.bankapp.bank.daoImp.doa_account_imp;
import com.bankapp.bank.daoImp.doa_opImp;
import com.bankapp.bank.db.DatabaseConnectionManager;
import com.bankapp.bank.model.ClientBank;
import com.bankapp.bank.model.account;
import com.bankapp.bank.model.operation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class testClass {



    public static void main(String[] args) throws SQLException {

doa_opImp a=new doa_opImp();
        System.out.println(a.opsInterne("1001","1002",200.0));

    }}
