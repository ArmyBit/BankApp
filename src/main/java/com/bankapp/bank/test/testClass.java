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
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class testClass {



    public static void main(String[] args) {

        List<account> listofallAccount=new ArrayList<>();
        try{
            Connection connection = DatabaseConnectionManager.getInstance().getConnection();
            PreparedStatement prini=connection.prepareStatement("Select accountNum from account");
            ResultSet b=prini.executeQuery();
            while(b.next()){
                account ac=new account(b.getString(1));
                listofallAccount.add(ac);

            }
            System.out.println(listofallAccount);}
        catch (Exception e) {
            System.out.println("error");
        }


    }}
