package com.example.stonefengshuimanagement.dao;

import com.example.stonefengshuimanagement.model.entity.User;
import com.example.stonefengshuimanagement.utils.DBConnectionUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

    public static final String SELECT_USER_BY_NAME = "SELECT * FROM users WHERE username = ? ";
    public static final String INSERT_USERS = "INSERT INTO users (username, password, email, phone, role) VALUES (?, ?, ?, ?, ?)";
    public static final String UPDATE_USERS = "UPDATE users SET username = ?, password = ?, email = ?, phone = ?, role = ? WHERE id = ?";
    public static final String DELETE_FROM_USERS_WHERE_ID = "DELETE FROM users WHERE id = ?";

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
        try(Connection conn = DBConnectionUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(SELECT_USER_BY_NAME)){
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return mapRow(rs);
            }
            return null;
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    public void add(User user) throws SQLException {
        try(Connection conn = DBConnectionUtil.getConnection();
        PreparedStatement ps = conn.prepareStatement(INSERT_USERS)){
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getRole());
            ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void updateUser(User user , int id) throws SQLException {
        try(Connection conn = DBConnectionUtil.getConnection();
        PreparedStatement ps = conn.prepareStatement(UPDATE_USERS)){
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getRole());
            ps.setInt(6, id);
            ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void deleteUser(int id) throws SQLException {
        try(Connection conn = DBConnectionUtil.getConnection();
        PreparedStatement ps = conn.prepareStatement(DELETE_FROM_USERS_WHERE_ID)){
            ps.setInt(1, id);
            ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
