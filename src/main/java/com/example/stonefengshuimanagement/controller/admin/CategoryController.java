package com.example.stonefengshuimanagement.controller.admin;

import com.example.stonefengshuimanagement.dao.CategoryDAO;
import com.example.stonefengshuimanagement.model.entity.Category;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoryController", urlPatterns = "/category")
public class CategoryController extends HttpServlet {
    private final CategoryDAO  categoryDAO = new CategoryDAO();

    private void createCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String statusParam = request.getParameter("status");
        int status = (statusParam == null || statusParam.isEmpty()) ? 0 : Integer.parseInt(statusParam);
        Category category = new Category(name, description, status);
        boolean success = categoryDAO.addCategory(category);
        HttpSession session = request.getSession();
        if(success) {
            session.setAttribute("msg", "add success");
        }
        else {
            session.setAttribute("msg", "add fail");
        }
        response.sendRedirect(request.getContextPath() + "/category");
    }

    private void updateCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idCategory = request.getParameter("id");
        if(idCategory == null || idCategory.trim().isEmpty()) {

            return;
        }
        int id = Integer.parseInt(idCategory);
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String statusParam = request.getParameter("status");
        int status = (statusParam == null || statusParam.isEmpty()) ? 0 : Integer.parseInt(statusParam);
        Category category = new Category(id, name, description, status);
        boolean success = categoryDAO.updateCategory(category);
        HttpSession session = request.getSession();
        if(success) {
            session.setAttribute("msg", "Update  success");
        }
        else {
            session.setAttribute("msg", "Update  fail");
        }
        response.sendRedirect(request.getContextPath() + "/category");
    }

    private void deleteCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idCategory = request.getParameter("id");
        if(idCategory == null || idCategory.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/category");
            return;
        }
        int id = Integer.parseInt(idCategory);
        boolean success = categoryDAO.deleteCategoryById(id);
        HttpSession session = request.getSession();
        if(success) {
            session.setAttribute("msg", "Delete  success");
        }
        else {
            session.setAttribute("msg", "Delete  fail");
        }
        response.sendRedirect(request.getContextPath() + "/category");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String action = req.getParameter("act");
        if(action == null) action ="";
        switch(action) {
            case "create":
                createCategory(req, resp);
                break;
            case "update":
                updateCategory(req, resp);
                break;
            case "delete":
                deleteCategory(req, resp);
                break;

        }
    }
// hiển thị form
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("act");
        if(action == null) action ="";
        switch(action) {
            default:
                List<Category> listCategory = categoryDAO.findAll();
                request.setAttribute("categories", listCategory);
                request.getRequestDispatcher("/views/admin/category/list.jsp").forward(request, response);
                break;
            case "create":
                request.getRequestDispatcher("/views/admin/category/create.jsp").forward(request, response);
                break;
            case "edit":
                String idCategory = request.getParameter("id");
                if(idCategory == null || idCategory.isEmpty()) {
                    response.sendRedirect(request.getContextPath() + "/category");
                    return;
                }
                int id = Integer.parseInt(idCategory);
                 Category category = categoryDAO.findCategoryById(id);
                if(category == null) {
                    response.sendRedirect(request.getContextPath() + "/category");
                    return;
                }

                request.setAttribute("category", category);
                request.getRequestDispatcher("/views/admin/category/edit.jsp").forward(request, response);
                break;
        }
    }

}
