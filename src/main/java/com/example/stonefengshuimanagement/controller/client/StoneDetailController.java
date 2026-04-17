package com.example.stonefengshuimanagement.controller.client;

import com.example.stonefengshuimanagement.model.entity.Stone;
import com.example.stonefengshuimanagement.service.StoneService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "stone-detail", value = "/stone-detail")
public class StoneDetailController extends HttpServlet {

    private StoneService stoneService;

    @Override
    public void init() throws ServletException {
        stoneService = new StoneService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action");
        if (action == null || action.isEmpty()) {
            action = "detail";
        }

        try {
            switch (action) {
                case "detail":
                    showDetail(req, resp);
                    break;
                default:
                    resp.sendRedirect("stones");
                    break;
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private void showDetail(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException, SQLException {

        int id = Integer.parseInt(req.getParameter("id"));
        Stone stone = stoneService.getStoneById(id);

        req.setAttribute("stone", stone);
        req.getRequestDispatcher("/views/client/stone-detail.jsp").forward(req, resp);
    }
}