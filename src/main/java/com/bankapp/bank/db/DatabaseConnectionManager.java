package com.bankapp.bank.db;

import jakarta.inject.Singleton;

import java.sql.*;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.Executor;
@Singleton



public class DatabaseConnectionManager {
        private static final String DATABASE_URL = "jdbc:mysql://localhost:3306/isga";
        private static final String USERNAME = "root";
        private static final String PASSWORD = "";

        private static Connection connection;

        private DatabaseConnectionManager() {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                connection = DriverManager.getConnection(DATABASE_URL, USERNAME, PASSWORD);


            } catch (Exception e) {
                throw new RuntimeException(e);

            }
        }

        // Singleton instance holder
        private static class SingletonHolder {
            private static final DatabaseConnectionManager INSTANCE = new DatabaseConnectionManager();
        }

        // Access method for the singleton instance
        public static DatabaseConnectionManager getInstance() {
            return SingletonHolder.INSTANCE;
        }

        // Method to get a connection
        public Connection getConnection() throws SQLException {
            if (connection == null || connection.isClosed()) {
                // Create a new connection if it's not already available or closed
                connection = DriverManager.getConnection(DATABASE_URL, USERNAME, PASSWORD);
            }
            return connection;
        }

        // Close the connection
        public void closeConnection() throws SQLException {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        }
    }




