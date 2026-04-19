package com.example.stonefengshuimanagement.controller.admin;

import com.example.stonefengshuimanagement.dao.ContactRequestDAO;
import com.example.stonefengshuimanagement.model.entity.ContactRequest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminContactController", urlPatterns = "/admin/contact")
public class AdminContactController extends HttpServlet {

    private final ContactRequestDAO dao = new ContactRequestDAO();

    // ===== CREATE STATUS =====
    private void create(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");
        String stoneIdParam = request.getParameter("stoneId");

        Integer stoneId = null;
        if (stoneIdParam != null && !stoneIdParam.isEmpty()) {
            stoneId = Integer.parseInt(stoneIdParam);
        }

        ContactRequest contact = new ContactRequest();
        contact.setFullName(fullName);
        contact.setPhone(phone);
        contact.setEmail(email);
        contact.setSubject(subject);
        contact.setMessage(message);
        contact.setStoneId(stoneId);
        contact.setStatus("NEW");

        boolean success = dao.insert(contact);

        HttpSession session = request.getSession();
        session.setAttribute("msg", success ? "Add success" : "Add failed");

        response.sendRedirect(request.getContextPath() + "/admin/contact");
    }

    // ===== UPDATE STATUS =====
    private void update(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        String idParam = request.getParameter("id");
        String status = request.getParameter("status");

        HttpSession session = request.getSession();

        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/contact");
            return;
        }

        int id = Integer.parseInt(idParam);

        boolean success = dao.updateStatus(id, status);

        session.setAttribute("msg", success ? "Update success" : "Update failed");

        response.sendRedirect(request.getContextPath() + "/admin/contact");
    }

    // ===== DELETE =====
    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String idParam = request.getParameter("id");
        HttpSession session = request.getSession();

        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/contact");
            return;
        }

        int id = Integer.parseInt(idParam);

        boolean success = dao.deleteById(id);

        session.setAttribute("msg", success ? "Delete success" : "Delete failed");

        response.sendRedirect(request.getContextPath() + "/admin/contact");
    }

    // ===== POST =====
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        String action = req.getParameter("act");
        if (action == null) action = "";

        switch (action) {
            case "update":
                try {
                    update(req, resp);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                break;
            case "delete":
                delete(req, resp);
                break;
            case "create":
                try {
                    create(req, resp);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                break;
        }
    }

    // ===== GET =====
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("act");
        if (action == null) action = "";

        switch (action) {

            case "detail":
                int id = Integer.parseInt(request.getParameter("id"));
                ContactRequest contact = null;
                try {
                    contact = dao.findById(id);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }

                request.setAttribute("contact", contact);
                request.setAttribute("contentPage", "/views/admin/contact/detail.jsp");

                request.getRequestDispatcher("/views/admin/dashboard.jsp")
                        .forward(request, response);
                break;

            case "create":
                request.setAttribute("contentPage", "/views/admin/contact/create.jsp");
                request.getRequestDispatcher("/views/admin/dashboard.jsp")
                        .forward(request, response);
                break;

            default:
                List<ContactRequest> list = dao.findAll();

                request.setAttribute("total", list.size());
                request.setAttribute("contactRequests", list);
                request.setAttribute("contentPage", "/views/admin/contact/list.jsp");

                request.getRequestDispatcher("/views/admin/dashboard.jsp")
                        .forward(request, response);
                break;
        }
    }
}