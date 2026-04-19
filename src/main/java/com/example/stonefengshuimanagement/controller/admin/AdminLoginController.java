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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        try {
            User user = authService.login(username, password);

            if (user != null && "ADMIN".equalsIgnoreCase(user.getRole())) {
                HttpSession session = req.getSession(true);
                session.setAttribute("user", user);

//                resp.sendRedirect(req.getContextPath() + "/admin/dashboard");
                // redirect toàn trang (thoát khỏi iframe) add by anh
                resp.setContentType("text/html;charset=UTF-8");
                resp.getWriter().write(
                        "<script>window.top.location='"
                                + req.getContextPath()
                                + "/admin/dashboard';</script>"
                );

            } else {
                req.setAttribute("error", "Sai tài khoản hoặc mật khẩu");
                req.getRequestDispatcher("/views/admin/login.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}