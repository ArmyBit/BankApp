package com.bankapp.bank.test;

import com.bankapp.bank.daoImp.Doa_user_imp;
import com.bankapp.bank.daoImp.doa_ClientBank;
import com.bankapp.bank.daoImp.doa_opImp;
import com.bankapp.bank.db.DatabaseConnectionManager;
import com.bankapp.bank.model.ClientBank;
import com.bankapp.bank.model.account;
import com.bankapp.bank.model.operation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class testClass {



    public static void main(String[] args) {
        doa_ClientBank a=new doa_ClientBank();
        doa_opImp b=new doa_opImp();
        Doa_user_imp c=new Doa_user_imp();
         ClientBank e =c.createClientforView("saad");
        System.out.println(e);
        List<operation> listofops=b.getallClientOps(e);

        System.out.println(listofops);
    }}
