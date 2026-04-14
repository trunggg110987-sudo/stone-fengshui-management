package com.example.stonefengshuimanagement.controller.admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "AdminLogin", urlPatterns = "/login")
public class AdminLoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if("logout".equals(action)){
            HttpSession session = req.getSession(false);
            if(session != null) {
                session.invalidate();
            }
            HttpSession newSession = req.getSession();
            newSession.setAttribute("admin", null);
            resp.sendRedirect("/stonefengshuimanagement/admin/login");
        }
    }
}
