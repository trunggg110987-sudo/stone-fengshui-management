package com.example.stonefengshuimanagement.controller.client;


import com.example.stonefengshuimanagement.dao.CategoryDAO;
import com.example.stonefengshuimanagement.dao.StoneDAO;
import com.example.stonefengshuimanagement.model.entity.Category;
import com.example.stonefengshuimanagement.model.entity.Stone;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeController", urlPatterns = {"/", "/home"})
public class HomeController extends HttpServlet {

    private final CategoryDAO categoryDAO = new CategoryDAO();
    private final StoneDAO  stoneDAO = new StoneDAO();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Nếu vào "/" thì redirect sang /home
        if (req.getServletPath().equals("/")) {
            resp.sendRedirect(req.getContextPath() + "/home");
            return;
        }
        req.getRequestDispatcher("/views/client/home.jsp")
                .forward(req, resp);
    }
}
