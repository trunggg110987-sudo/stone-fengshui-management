package com.example.stonefengshuimanagement.controller.client;

import com.example.stonefengshuimanagement.model.entity.Stone;
import com.example.stonefengshuimanagement.service.StoneService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "stone-list", value = "/stones")
public class StoneListController extends HttpServlet {

    private StoneService stoneService;

    @Override
    public void init() throws ServletException {
        stoneService = new StoneService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action");
        if (action == null || action.isEmpty()) {
            action = "list";
        }

        try {
            switch (action) {
                case "detail":
                    showDetail(req, resp);
                    break;
                case "search":
                    search(req, resp);
                    break;
                case "filter":
                    filter(req, resp);
                    break;
                default:
                    showList(req, resp);
                    break;
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action");

        try {
            switch (action) {
                case "add":
                    addStone(req, resp);
                    break;
                case "update":
                    updateStone(req, resp);
                    break;
                case "delete":
                    deleteStone(req, resp);
                    break;
                default:
                    resp.sendRedirect("stones");
                    break;
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        List<Stone> stones = stoneService.getAllStones();
        req.setAttribute("stones", stones);
        req.getRequestDispatcher("/views/client/stone-list.jsp").forward(req, resp);
    }

    private void showDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(req.getParameter("id"));
        Stone stone = stoneService.getStoneById(id);
        req.setAttribute("stone", stone);
        req.getRequestDispatcher("/views/client/stone-detail.jsp").forward(req, resp);
    }

    private void search(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        String keyword = req.getParameter("keyword");
        List<Stone> stones = stoneService.search(keyword);
        req.setAttribute("stones", stones);
        req.setAttribute("keyword", keyword);
        req.getRequestDispatcher("/views/client/stone-list.jsp").forward(req, resp);
    }

    private void filter(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        BigDecimal min = parsePrice(req.getParameter("minPrice"));
        BigDecimal max = parsePrice(req.getParameter("maxPrice"));

        List<Stone> stones = stoneService.filterByPrice(min, max);
        req.setAttribute("stones", stones);
        req.setAttribute("minPrice", req.getParameter("minPrice"));
        req.setAttribute("maxPrice", req.getParameter("maxPrice"));
        req.getRequestDispatcher("/views/client/stone-list.jsp").forward(req, resp);
    }

    private void addStone(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException {
        Stone stone = new Stone();
        stone.setName(req.getParameter("name"));
        stone.setPrice(new BigDecimal(req.getParameter("price")));
        stone.setImageUrl(req.getParameter("imageUrl"));

        stoneService.addStone(stone);
        resp.sendRedirect("stones");
    }

    private void updateStone(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException {
        int id = Integer.parseInt(req.getParameter("id"));

        Stone stone = new Stone();
        stone.setName(req.getParameter("name"));
        stone.setPrice(new BigDecimal(req.getParameter("price")));
        stone.setImageUrl(req.getParameter("imageUrl"));

        stoneService.updateStone(id, stone);
        resp.sendRedirect("stones");
    }

    private void deleteStone(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException {
        int id = Integer.parseInt(req.getParameter("id"));
        stoneService.deleteStone(id);
        resp.sendRedirect("stones");
    }

    private BigDecimal parsePrice(String value) {
        try {
            if (value != null && !value.trim().isEmpty()) {
                return new BigDecimal(value);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}