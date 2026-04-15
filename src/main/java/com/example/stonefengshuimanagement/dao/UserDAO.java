package com.example.stonefengshuimanagement.dao;

import com.example.stonefengshuimanagement.model.entity.User;
import com.example.stonefengshuimanagement.utils.DBConnectionUtil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    public User mapRow(ResultSet rs) throws SQLException {
        User user = new User();
        user.setId(rs.getInt("id"));
        user.setUsername(rs.getString("username"));
        user.setPassword(rs.getString("password"));
        user.setEmail(rs.getString("email"));
        user.setPhone(rs.getString("phone"));
        user.setRole(rs.getString("role"));
        return user;
    }

    public User findByUsername(String username) throws SQLException {
        try(Connection conn = DBConnectionUtil.getConnection()){

        }
    }
}
