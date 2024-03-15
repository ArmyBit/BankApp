package com.bankapp.bank.daoImp;

import com.bankapp.bank.dao.dao_Client;
import com.bankapp.bank.db.DatabaseConnectionManager;
import com.bankapp.bank.model.ClientBank;
import com.bankapp.bank.model.CommissionModel;
import com.bankapp.bank.model.account;
import com.bankapp.bank.model.operation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class doa_ClientBank implements dao_Client {
    @Override
    public ClientBank getClientinfo(String CodeClient) {
        try{
            ClientBank client =new ClientBank();
        Connection connection = DatabaseConnectionManager.getInstance().getConnection();
        PreparedStatement a=connection.prepareStatement("SELECT * FROM clientinfo WHERE CodeClient=?");
        a.setString(1, CodeClient);
        ResultSet b=a.executeQuery();
        while(b.next())
        {
            client.setCodeClient(b.getInt(1));
            client.setNomClient(b.getString(2));
            client.setPrenomClient(b.getString(3));
            client.setTelClient(b.getInt(4));
            client.setMailClient(b.getString(5));
        }
        a.close();
        return client;
    }
        catch(Exception e){
            return null;
        }
    }


    @Override
    public List<account> getAllClientAccounts(String c) {
        List<account> list = new ArrayList<>();

        try{
            Connection connection = DatabaseConnectionManager.getInstance().getConnection();
            PreparedStatement a=connection.prepareStatement("SELECT * FROM account WHERE codeClient=(select codeClient from user where username=?)");
            a.setString(1, c);
            ResultSet b=a.executeQuery();
            while(b.next())
            {
                account aacc=new account();
                aacc.setId(b.getString(1));
                aacc.setAccountNum(b.getString(2));
                aacc.setCodeClient(b.getString(3));
                aacc.setSolde(b.getInt(4));
                list.add(aacc);
            }
            a.close();
            return list;
        }
        catch(Exception e){
            return null;
        }
    }
    @Override
    public List<CommissionModel> getAllBankAccountCommission(String c){

        List<CommissionModel> list = new ArrayList<>();
        try{
            Connection connection = DatabaseConnectionManager.getInstance().getConnection();
            PreparedStatement a=connection.prepareStatement("SELECT * FROM Commission WHERE AccIdentifier=?");
            a.setString(1,c);
            ResultSet b=a.executeQuery();
            while(b.next())
            {
                CommissionModel Com=new CommissionModel();
                Com.setIdCommission(b.getInt(1));
                Com.setId_Op(b.getInt(2));
                Com.setAccountNum(b.getString(3));
                Com.setVal(b.getFloat(4));

                list.add(Com);
            }
            a.close();
            return list;
        }
        catch(Exception e){
            return null;
        }
    }
}
