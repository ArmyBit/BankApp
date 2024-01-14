package com.bankapp.bank.test;

import com.bankapp.bank.daoImp.Doa_user_imp;
import com.bankapp.bank.db.DatabaseConnectionManager;
import com.bankapp.bank.model.ClientBank;
import com.bankapp.bank.model.account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class testClass {



    public static void main(String[] args) {
        Doa_user_imp a = new Doa_user_imp();
        Boolean resp_from_db = a.check_user("saad", "saad");
        System.out.println(resp_from_db);
        ClientBank c =new ClientBank(12);

        System.out.println(testClass.getAllClientAccounts(c));
    }
    public static List<account> getAllClientAccounts(ClientBank c){
            List<account> list = new ArrayList<>();

            try {
                Connection connection = DatabaseConnectionManager.getInstance().getConnection();
                PreparedStatement a = connection.prepareStatement("SELECT * FROM account WHERE codeClient=?");
                a.setString(1, String.valueOf(12));
                ResultSet b = a.executeQuery();
                while (b.next()) {
                    account aacc = new account();
                    aacc.setId(b.getString(1));
                    aacc.setAccountNum(b.getString(2));
                    aacc.setCodeClient(b.getString(3));
                    aacc.setSolde(b.getInt(4));
                    list.add(aacc);
                }
                a.close();
                return list;
            } catch (Exception e) {
                return null;
            }
        }
}
