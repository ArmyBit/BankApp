package com.bankapp.bank.daoImp;

import com.bankapp.bank.dao.doa_op;
import com.bankapp.bank.db.DatabaseConnectionManager;
import com.bankapp.bank.model.ClientBank;
import com.bankapp.bank.model.account;
import com.bankapp.bank.model.operation;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class doa_opImp implements doa_op {
    @Override
    public List<operation> getaccountOps(account u) {
        List<operation> list = new ArrayList<>();

        try{
            Connection connection = DatabaseConnectionManager.getInstance().getConnection();
            PreparedStatement a=connection.prepareStatement("SELECT * FROM operation WHERE accountNum=?");
            a.setString(1, String.valueOf(u.getAccountNum()));
            ResultSet b=a.executeQuery();
            while(b.next())
            {
                operation op=new operation();
                op.setIdOperation(b.getInt(1));
                op.setDateOperation(b.getDate(2));
                op.setTypeOperation(b.getString(3));
                op.setAccountNum(b.getString(4));
                op.setMontant(b.getDouble(5));
                list.add(op);
            }
            a.close();
            return list;
        }
        catch(Exception e){
            return null;
        }
    }


    @Override
    public List<operation> getallClientOps(ClientBank c) {
        List<operation> list = new ArrayList<>();
        try{
            Connection connection = DatabaseConnectionManager.getInstance().getConnection();
            PreparedStatement a=connection.prepareStatement("SELECT * FROM operation WHERE codeClient=?");
            a.setString(1, String.valueOf(c.getCodeClient()));
            ResultSet b=a.executeQuery();
            while(b.next())
            {
                operation op=new operation();
                op.setIdOperation(b.getInt(1));
                op.setDateOperation(b.getDate(2));
                op.setTypeOperation(b.getString(3));
                op.setAccountNum(b.getString(4));
                op.setMontant(b.getDouble(5));
                list.add(op);
            }
            a.close();
            return list;
        }
        catch(Exception e){
            return null;
        }
    }

    @Override
    public String opsInterne(String accountNum, String accountNumdest, Double montant) throws SQLException {
        account ac = new account(accountNum);
        account dest=new account(accountNumdest);
        doa_account_imp a = new doa_account_imp();
        Double solde = a.getSoldebyAccountNum(ac);
        List<account> listofaccounts=a.getallAccount();
        Double rest=solde-montant;
        if(listofaccounts.contains(dest))
        {
            if(rest>0){
                Connection connection = DatabaseConnectionManager.getInstance().getConnection();
                PreparedStatement pr=connection.prepareStatement("update account set solde=? where accountNum=?");
                pr.setString(1, String.valueOf(rest));
                pr.setString(2,String.valueOf(accountNum));
                int b=pr.executeUpdate();
                pr=connection.prepareStatement("update account set solde=solde+? where accountNum=?");
                pr.setString(1, String.valueOf(montant));
                pr.setString(2,String.valueOf(accountNumdest));
                int c=pr.executeUpdate();
                //for history
                pr=connection.prepareStatement("insert into operation (typeOperation, accountNum, montant) values(?,?,?),(?,?,?) ");
               pr.setString(1,"transfer");
                pr.setString(2,accountNum);
                pr.setString(3,String.valueOf(montant));
                pr.setString(4,"deposit");
                pr.setString(5,accountNumdest);
                pr.setString(6,String.valueOf(montant));

                int d=pr.executeUpdate();
                pr=connection.prepareStatement("UPDATE operation\n" +
                        "SET codeClient = (\n" +
                        "    SELECT codeClient\n" +
                        "    FROM account\n" +
                        "    WHERE accountNum = operation.accountNum\n" +
                        ")");
                int e=pr.executeUpdate();



              return "Operation Done";
            }
            else return "Error :Insuffisant Balance";
        }
        else
            return "Error : Account Dest Not Found ";
    }



}

