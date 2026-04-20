package com.example.stonefengshuimanagement.service;

import com.example.stonefengshuimanagement.dao.UserDAO;
import com.example.stonefengshuimanagement.model.entity.User;

import java.sql.SQLException;

public class AuthService {

    private final UserDAO userDAO;

    public AuthService() {
        this.userDAO = new UserDAO();
    }

    public User login(String username, String password) throws SQLException {
        User user = userDAO.findByUsername(username);

        if (user == null) {
            return null;
        }

        if (user.getPassword() == null || !user.getPassword().equals(password)) {
            return null;
        }
        return user;
    }
}