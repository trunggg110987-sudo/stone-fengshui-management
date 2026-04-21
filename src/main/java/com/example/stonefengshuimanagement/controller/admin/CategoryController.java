package com.example.stonefengshuimanagement.controller.admin;

import com.example.stonefengshuimanagement.dao.CategoryDAO;
import com.example.stonefengshuimanagement.model.entity.Category;
import com.example.stonefengshuimanagement.service.CategoryService;
import exception.DatabaseException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoryController", urlPatterns = "/admin/category")
public class CategoryController extends HttpServlet {

    private final CategoryDAO categoryDAO = new CategoryDAO();

    private void createCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, DatabaseException {

        String name = request.getParameter("name");
        String description = request.getParameter("description");
        int status = Integer.parseInt(request.getParameter("status"));

        Category category = new Category(name, description, status);

        boolean success = categoryDAO.addCategory(category);

        if (success) {

            request.getSession().setAttribute("msg", "Add success");
            response.sendRedirect(request.getContextPath() + "/admin/category");

        } else {
            request.setAttribute("errorName", "Tên category đã tồn tại");

            // giữ dữ liệu form
            request.setAttribute("name", name);
            request.setAttribute("description", description);
            request.setAttribute("status", status);

            request.getRequestDispatcher("/views/admin/category/create.jsp")
                    .forward(request, response);
        }
    }

    private final CategoryService categoryService = new CategoryService();

    private void updateCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, DatabaseException {

        String idCategory = request.getParameter("id");
        if (idCategory == null || idCategory.trim().isEmpty()) {
            return;
        }

        int id = Integer.parseInt(idCategory);
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String statusParam = request.getParameter("status");

        int status = (statusParam == null || statusParam.isEmpty())
                ? 0 : Integer.parseInt(statusParam);
        Category category = new Category(id, name, description, status);
        // sửa ở đây
        boolean success = categoryService.updateCategory(category);
        HttpSession session = request.getSession();
        if (success) {
            session.setAttribute("msg", "Update success");
        } else {
            session.setAttribute("msg", "No changes detected");
        }
        response.sendRedirect(request.getContextPath() + "/admin/category");
    }
    private void deleteCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, DatabaseException {

        String idCategory = request.getParameter("id");
        if (idCategory == null || idCategory.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/category");
            return;
        }

        int id = Integer.parseInt(idCategory);

        HttpSession session = request.getSession();

        // kiểm tra khóa ngoại đến stones
        if (categoryDAO.existsStoneByCategoryId(id)) {
            session.setAttribute("msg", "Cannot delete! Category is in use");
            response.sendRedirect(request.getContextPath() + "/admin/category");
            return;
        }

        boolean success = categoryDAO.deleteCategoryById(id);

        if (success) {
            session.setAttribute("msg", "Delete success");
        } else {
            session.setAttribute("msg", "Delete fail");
        }

        response.sendRedirect(request.getContextPath() + "/admin/category");
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        String action = req.getParameter("act");
        if (action == null) action = "";

        try {
            switch (action) {
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
        } catch (DatabaseException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("act");
        if (action == null) action = "";

        try {
            switch (action) {

                case "create":
                    request.setAttribute("contentPage","/views/admin/category/create.jsp");
                    request.getRequestDispatcher("/views/admin/dashboard.jsp")
                            .forward(request, response);
                    break;

                case "edit":
                    String idCategory = request.getParameter("id");
                    if (idCategory == null || idCategory.isEmpty()) {
                        response.sendRedirect(request.getContextPath() + "/admin/category");
                        return;
                    }

                    int id = Integer.parseInt(idCategory);
                    Category category = categoryDAO.findCategoryById(id);

                    request.setAttribute("category", category);
                    request.setAttribute("contentPage","/views/admin/category/edit.jsp");
                    request.getRequestDispatcher("/views/admin/dashboard.jsp")
                            .forward(request, response);
                    break;

                case "detail":
                    int idDetail = Integer.parseInt(request.getParameter("id"));
                    Category detail = categoryDAO.findCategoryById(idDetail);
                    request.setAttribute("category", detail);
                    request.setAttribute("contentPage","/views/admin/category/detail.jsp");
                    request.getRequestDispatcher("/views/admin/dashboard.jsp")
                            .forward(request, response);
                    break;
                default:

                    String keyword = request.getParameter("keyword");
                    String statusParam = request.getParameter("status");

                    List<Category> listCategory;

                    boolean hasKeyword = keyword != null && !keyword.trim().isEmpty();
                    boolean hasStatus = statusParam != null && !statusParam.trim().isEmpty();

                    if (hasKeyword && hasStatus) {

                        listCategory = categoryDAO.searchByNameAndStatus(
                                keyword,
                                Integer.parseInt(statusParam)
                        );

                    } else if (hasKeyword) {

                        listCategory = categoryDAO.searchByName(keyword);

                    } else if (hasStatus) {

                        listCategory = categoryDAO.searchByStatus(
                                Integer.parseInt(statusParam)
                        );

                    } else {

                        listCategory = categoryDAO.findAll();
                    }

                    request.setAttribute("total", listCategory.size());
                    request.setAttribute("categories", listCategory);

                    request.setAttribute("pageTitle", "Quản lý Category");
                    request.setAttribute("contentPage", "/views/admin/category/list.jsp");
                    request.getRequestDispatcher("/views/admin/dashboard.jsp")
                            .forward(request, response);
                    break;
            }

        } catch (DatabaseException e) {
            throw new ServletException(e);
        }
    }
}