package com.example.stonefengshuimanagement.controller.admin;

import com.example.stonefengshuimanagement.model.entity.User;
import com.example.stonefengshuimanagement.service.AuthService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "admin-login", value = "/admin/login")
public class AdminLoginController extends HttpServlet {

    private AuthService authService;

    @Override
    public void init() throws ServletException {
        authService = new AuthService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/admin/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        try {
            User user = authService.login(username, password);

            // ===== LOGIN FAIL =====
            if (user == null) {
                req.setAttribute("error", "Sai tài khoản hoặc mật khẩu");
                req.getRequestDispatcher("/views/admin/login.jsp")
                        .forward(req, resp);
                return;
            }

            // ===== SAVE SESSION =====
            HttpSession session = req.getSession(true);
            session.setAttribute("user", user);

            String redirectUrl;

            // ===== ROLE DECISION =====
            if ("ADMIN".equalsIgnoreCase(user.getRole())) {
                redirectUrl = req.getContextPath() + "/admin/dashboard";
            } else {
                redirectUrl = req.getContextPath() + "/home";
                session.setAttribute("msg", "👋 Đăng nhập thành công, chào " + user.getUsername());
            }

            // ===== EXIT IFRAME (CHO CẢ ADMIN + USER) =====
            resp.setContentType("text/html;charset=UTF-8");
            resp.getWriter().write(
                    "<script>window.top.location='" + redirectUrl + "';</script>"
            );

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}