package com.example.stonefengshuimanagement.controller.client;


import com.example.stonefengshuimanagement.dao.CategoryDAO;
import com.example.stonefengshuimanagement.model.entity.Category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeController", urlPatterns = "/home")
public class HomeController extends HttpServlet {
    private final CategoryDAO categoryDAO = new CategoryDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> categoryList = categoryDAO.findAll() ;
        req.setAttribute("categoryList", categoryList);
        req.getRequestDispatcher("/WEB-INF/views/client/home.jsp").forward(req, resp);
    }
}
