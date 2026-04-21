package com.example.stonefengshuimanagement.controller.admin;

import com.example.stonefengshuimanagement.service.CategoryService;
import com.example.stonefengshuimanagement.service.ContactService;
import com.example.stonefengshuimanagement.service.StoneService;
import exception.DatabaseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "admin-dashboard", value = "/admin/dashboard")
public class AdminDashboardController extends HttpServlet {
    private final StoneService stoneService = new StoneService();
    private final CategoryService categoryService = new CategoryService();
    private final ContactService contactService = new ContactService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // thống kê
        int totalStones = stoneService.countAll();
        int totalCategories = 0;
        try {
            totalCategories = categoryService.getTotalCategories();
        } catch (DatabaseException e) {
            throw new RuntimeException(e);
        }
        int totalContacts = contactService.countAll();

        // set data cho dashboard
        req.setAttribute("totalStones", totalStones);
        req.setAttribute("totalCategories", totalCategories);
        req.setAttribute("totalContacts", totalContacts);

        // view
        req.getRequestDispatcher("/views/admin/dashboard.jsp")
                .forward(req, resp);
    }
}