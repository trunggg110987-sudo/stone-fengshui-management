package com.example.stonefengshuimanagement.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnectionUtil {
    public static final String jdbcURl = "jdbc:mysql://localhost:3306/fengshui_stone_db";
    public static final String jdbcUserName = "root";
    public static final String jdbcPassWord = "123456";
    private static Connection conn;
    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            if (conn == null || conn.isClosed()) {
                conn = DriverManager.getConnection(jdbcURl, jdbcUserName, jdbcPassWord);
                if (conn != null) {
                    System.out.println("Connected to the database.");
                }else{
                    System.out.println("Connection failed!");
                }
            }
            return conn;
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
