package com.example.stonefengshuimanagement.controller.client;

import com.example.stonefengshuimanagement.dao.CategoryDAO;
import com.example.stonefengshuimanagement.dao.StoneDAO;
import com.example.stonefengshuimanagement.model.entity.Stone;
import com.example.stonefengshuimanagement.service.StoneService;
import exception.DatabaseException;

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
            String categoryId = req.getParameter("categoryId"); // added by anh
            List<Stone> stone;
            if (categoryId != null && !categoryId.isEmpty()) {
                stone = stoneService.findByCategory(Integer.parseInt(categoryId));

            }// added by anh
            else if (keyword != null && !keyword.trim().isEmpty()) {
                stone  = stoneService.searchByName(keyword);
            } else {
                stone = stoneService.findAll();
            }
            req.setAttribute("stones", stone);
            // ===== CATEGORY LIST  =====
            CategoryDAO categoryDAO = new CategoryDAO(); // added by anh
            req.setAttribute("categories", categoryDAO.getAll());// added by anh
            // layout
            req.setAttribute("contentPage", "/views/client/stone-list.jsp");

            req.getRequestDispatcher("/views/common/client-layout.jsp")
                    .forward(req, resp);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (DatabaseException e) {
            throw new RuntimeException(e);
        }
    }
}
