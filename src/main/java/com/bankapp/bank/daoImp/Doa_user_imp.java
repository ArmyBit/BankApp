package com.bankapp.bank.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.bankapp.bank.dao.daouser;
import com.bankapp.bank.db.DatabaseConnectionManager;
import com.bankapp.bank.model.user;
import jakarta.inject.Singleton;

public class Doa_user_imp implements daouser {

    @Override
    public boolean check_user(String Username, String Password) {
        try {
            Connection connection = DatabaseConnectionManager.getInstance().getConnection();
            PreparedStatement a=connection.prepareStatement("SELECT CASE WHEN EXISTS ( SELECT * FROM user WHERE Username=? and Password=? )THEN 'TRUE'  ELSE 'FALSE' END");
            a.setString(1, Username);
            a.setString(2, user.toHash(Password));
            ResultSet b=a.executeQuery();
            System.out.println(b);
            boolean c=false;
            while(b.next())
                c=b.getBoolean(1);
            a.close();
            return c;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
        }


    }

}
