package com.example.stonefengshuimanagement.controller.admin;

import com.example.stonefengshuimanagement.dao.CategoryDAO;
import com.example.stonefengshuimanagement.model.entity.Category;
import com.example.stonefengshuimanagement.model.entity.Stone;
import com.example.stonefengshuimanagement.service.StoneService;
import exception.DatabaseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.http.Part;
import java.nio.file.Paths;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 5 * 1024 * 1024,
        maxRequestSize = 5 * 1024 * 1024
)

@WebServlet("/admin/stones")
public class StoneController extends HttpServlet {

    private final StoneService stoneService = new StoneService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null) action = "list";

        switch (action) {
            case "create":
                CategoryDAO categoryDAO = new CategoryDAO();

                List<Category> categories = null;
                try {
                    categories = categoryDAO.findAll();
                } catch (DatabaseException e) {
                    throw new RuntimeException(e);
                }

                request.setAttribute("categories", categories);
                request.setAttribute("contentPage", "/views/admin/stone/create.jsp");
                request.getRequestDispatcher("/views/admin/dashboard.jsp").forward(request, response);
                break;

            case "edit":
                int id = Integer.parseInt(request.getParameter("id"));
                Stone stone = null;
                try {
                    stone = stoneService.findById(id);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }

                request.setAttribute("stone", stone);
                request.setAttribute("contentPage", "/views/admin/stone/edit.jsp");

                request.getRequestDispatcher("/views/admin/dashboard.jsp")
                        .forward(request, response);
                break;

            case "delete":
                int deleteId = Integer.parseInt(request.getParameter("id"));
                try {
                    stoneService.deleteStone(deleteId);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }

                response.sendRedirect(request.getContextPath() + "/admin/stones");
                break;

            default:
            String keyword = request.getParameter("keyword");

            List<Stone> list;

            if (keyword != null && !keyword.trim().isEmpty()) {
                try {
                    list = stoneService.searchByName(keyword);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                request.setAttribute("keyword", keyword); // giữ lại input
            } else {
                try {
                    list = stoneService.findAll();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }

            request.setAttribute("stones", list);
            request.setAttribute("total", list.size());
            request.setAttribute("contentPage", "/views/admin/stone/list.jsp");

            request.getRequestDispatcher("/views/admin/dashboard.jsp")
                    .forward(request, response);
            break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        int id = request.getParameter("id") == null || request.getParameter("id").isEmpty()
                ? 0 : Integer.parseInt(request.getParameter("id"));

        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        String name = request.getParameter("name");
        String code = request.getParameter("code");
        String priceStr = request.getParameter("price");
        priceStr = priceStr.replace(".", "");

        double price = Double.parseDouble(priceStr);
        Part filePart = request.getPart("imageFile");

        String fileName = Paths.get(filePart.getSubmittedFileName())
                .getFileName()
                .toString();
        String uploadPath = getServletContext().getRealPath("/images");

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        // chỉ lưu khi có file
        if (fileName != null && !fileName.isEmpty()) {
            filePart.write(uploadPath + File.separator + fileName);
        }
        String description = request.getParameter("description");
        int status = Integer.parseInt(request.getParameter("status"));

        String imageUrl = fileName;
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

        response.sendRedirect(request.getContextPath() + "/admin/stones");
    }
}
