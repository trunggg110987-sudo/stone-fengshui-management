package com.example.stonefengshuimanagement.controller.client;

import com.example.stonefengshuimanagement.service.StoneService;
import com.example.stonefengshuimanagement.model.entity.Stone;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "stoneDetail", urlPatterns = "/stone-detail")
public class StoneDetailController extends HttpServlet {
    private final StoneService stoneService = new StoneService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        try {
            Stone stone = stoneService.findById(id);
            req.setAttribute("stone", stone);
            req.setAttribute("contentPage", "/views/client/stone-detail.jsp");

            req.getRequestDispatcher("/views/common/client-layout.jsp")
                    .forward(req, resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}