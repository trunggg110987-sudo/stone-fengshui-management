package com.example.stonefengshuimanagement.controller.client;

import com.example.stonefengshuimanagement.dao.StoneDAO;
import com.example.stonefengshuimanagement.model.entity.Stone;
import com.example.stonefengshuimanagement.service.StoneService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name="stone-list", value = "/stones")
public class StoneListController extends HttpServlet {
    private final StoneService stoneService = new StoneService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        StoneDAO stoneDAO = new StoneDAO();
        try {
            String keyword = req.getParameter("keyword");
            List<Stone> stone;
            if (keyword != null && !keyword.trim().isEmpty()) {
                stone  = stoneService.searchByName(keyword);
                if (stone != null) {
                    req.setAttribute("stone", stone);
                    req.getRequestDispatcher("/views/client/stone-detail.jsp").forward(req, resp);
                    return;
                }
            } else {
                stone = stoneService.findAll();
            }
            req.setAttribute("stones", stone);
            req.getRequestDispatcher("/views/client/stone-list.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
