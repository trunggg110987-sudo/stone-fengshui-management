package com.example.stonefengshuimanagement.controller.client;

import com.example.stonefengshuimanagement.model.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "CartViewController", urlPatterns = "/cart/view")
public class CartViewController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/login");
            return;
        }

        req.getRequestDispatcher("/views/client/cart.jsp")
                .forward(req, resp);
    }
}