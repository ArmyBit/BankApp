package com.bankapp.bank.daoImp;

import com.bankapp.bank.dao.doa_account;
import com.bankapp.bank.db.DatabaseConnectionManager;
import com.bankapp.bank.model.account;
import com.bankapp.bank.model.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

public class doa_account_imp implements doa_account {
    @Override
    public account getAccountinfo(String accountNum) {
        try{
            account accountTobeReturned = new account();
            Connection connection = DatabaseConnectionManager.getInstance().getConnection();
            PreparedStatement a=connection.prepareStatement("SELECT * FROM account WHERE accountNum=?");
            a.setString(1, accountNum);
            ResultSet b=a.executeQuery();
            while(b.next()){
                accountTobeReturned.setId(b.getString(1));
                accountTobeReturned.setAccountNum(b.getString(2));
                accountTobeReturned.setCodeClient(b.getString(3));
                accountTobeReturned.setSolde(b.getInt(4));



            }
            a.close();

            return accountTobeReturned;

        }
        catch (Exception e){
            return null;
        }


    }

    @Override
    public Double getSolde(account u) {
        try{
            Connection connection = DatabaseConnectionManager.getInstance().getConnection();
            PreparedStatement a=connection.prepareStatement("SELECT solde FROM account WHERE codeClient=?");
            a.setString(1, u.getCodeClient());
            ResultSet b=a.executeQuery();
            Double solde=null;
            while(b.next()){
               solde=b.getDouble(1);


            }
            a.close();

            return solde;

        }
        catch (Exception e){
            return null;
        }
    }
}
