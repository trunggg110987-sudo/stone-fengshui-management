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

@WebServlet(name = "HomeController", urlPatterns = {"/home"})
public class HomeController extends HttpServlet {

    private final CategoryDAO categoryDAO = new CategoryDAO();
    private final StoneDAO stoneDAO = new StoneDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // CHỈ LẤY 10 SẢN PHẨM HIỂN THỊ HOME
            List<Stone> stones = stoneDAO.getLimit(10);

            request.setAttribute("stones", stones);

            request.setAttribute("contentPage", "/views/client/home.jsp");
            request.setAttribute("pageCss", "/views/css/home.css");

            request.getRequestDispatcher("/views/common/client-layout.jsp")
                    .forward(request, response);

        } catch (Exception e) {
            throw new RuntimeException(e);

        }
    }
}
