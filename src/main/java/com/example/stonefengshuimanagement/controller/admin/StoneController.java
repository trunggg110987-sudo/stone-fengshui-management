package com.example.stonefengshuimanagement.controller.admin;

import com.example.stonefengshuimanagement.model.entity.Stone;
import com.example.stonefengshuimanagement.service.StoneService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/admin/stones")
public class StoneController extends HttpServlet {

    private final StoneService stoneService = new StoneService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null) action = "list";

        switch (action) {
            case "create":
                request.getRequestDispatcher("views/admin/stone/form.jsp").forward(request, response);
                break;

            case "edit":
                int id = Integer.parseInt(request.getParameter("id"));
                try {
                    request.setAttribute("stone", stoneService.findById(id));
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                request.getRequestDispatcher("views/admin/stone/form.jsp").forward(request, response);
                break;

            case "delete":
                int deleteId = Integer.parseInt(request.getParameter("id"));
                try {
                    stoneService.deleteStone(deleteId);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                response.sendRedirect("/admin/stones");
                break;

            default:
                List<Stone> list = null;
                try {
                    list = stoneService.findAll();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                request.setAttribute("stones", list);
                request.getRequestDispatcher("views/admin/stone/list.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = request.getParameter("id") == null || request.getParameter("id").isEmpty()
                ? 0 : Integer.parseInt(request.getParameter("id"));

        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        String name = request.getParameter("name");
        String code = request.getParameter("code");
        double price = Double.parseDouble(request.getParameter("price"));
        String imageUrl = request.getParameter("imageUrl");
        String description = request.getParameter("description");
        int status = Integer.parseInt(request.getParameter("status"));

        Stone stone = new Stone(id, categoryId, name, code, price, imageUrl, description, status);

        if (id == 0) {
            stoneService.addStone(stone);
        } else {
            try {
                stoneService.updateStone(stone);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        response.sendRedirect("/admin/stones");
    }
}
