package com.example.stonefengshuimanagement.service;

import com.example.stonefengshuimanagement.dao.UserDAO;
import com.example.stonefengshuimanagement.model.entity.User;
import com.example.stonefengshuimanagement.utils.PasswordUtil;
import com.example.stonefengshuimanagement.utils.ValidationUtil;

import java.sql.SQLException;

public class AuthService {

    private final UserDAO userDAO;

    public AuthService() {
        this.userDAO = new UserDAO();
    }

    public User login(String username, String password) throws SQLException {

        // validate input
        if (ValidationUtil.isNullOrEmpty(username) || ValidationUtil.isNullOrEmpty(password)) {
            return null;
        }

        User user = userDAO.findByUsername(username);

        if (user == null) {
            return null;
        }

        // check password (hash)
        if (!PasswordUtil.checkPassword(password, user.getPassword())) {
            return null;
        }

        return user;
    }
}