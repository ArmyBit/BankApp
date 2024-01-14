package com.bankapp.bank.daoImp;

import com.bankapp.bank.dao.doa_op;
import com.bankapp.bank.db.DatabaseConnectionManager;
import com.bankapp.bank.model.ClientBank;
import com.bankapp.bank.model.account;
import com.bankapp.bank.model.operation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
    }

