package com.example.stonefengshuimanagement.controller.admin;

import com.example.stonefengshuimanagement.dao.ContactRequestDAO;
import com.example.stonefengshuimanagement.model.entity.ContactRequest;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "admin-contact", value = "/admin/contact")
public class AdminContactController extends HttpServlet {
    private ContactRequestDAO contactRequestDAO;

    @Override
    public void init() throws ServletException {
        contactRequestDAO = new ContactRequestDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null || action.isEmpty()) {
            action = "list";
        }
        switch (action) {
            case "list":
                showList(req, resp);
                break;
            default:
                resp.sendError(404);
                break;
        }
    }


    private void showList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<ContactRequest> contactRequests = contactRequestDAO.findAll();
        req.setAttribute("contactRequests", contactRequests);
        req.getRequestDispatcher("/views/admin/contact/list.jsp").forward(req, resp);
    }
}
