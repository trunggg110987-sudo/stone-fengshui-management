package com.example.stonefengshuimanagement.controller.client;

import com.example.stonefengshuimanagement.model.entity.ContactRequest;
import com.example.stonefengshuimanagement.model.entity.Stone;
import com.example.stonefengshuimanagement.service.ContactService;
import com.example.stonefengshuimanagement.service.StoneService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ContactController", urlPatterns = "/contact")
public class ContactController extends HttpServlet {

    private final ContactService contactService = new ContactService();


    // ================= VIEW CONTACT PAGE =================
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException  {

        StoneService stoneService = new StoneService();

        List<Stone> stones = null;
        try {
            stones = stoneService.findAll();
        } catch (Exception e) {
            e.printStackTrace();
        }
        req.setAttribute("stones", stones);

        req.setAttribute("contentPage", "/views/client/contact.jsp");
        req.setAttribute("pageTitle", "Liên hệ");

        req.getRequestDispatcher("/views/common/client-layout.jsp")
                .forward(req, resp);
    }

    // ================= SUBMIT CONTACT FORM =================
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        HttpSession session = req.getSession();

        try {
            req.setCharacterEncoding("UTF-8");

            // ===== MAP DATA FROM FORM =====
            ContactRequest c = new ContactRequest();

            c.setFullName(req.getParameter("fullName"));
            c.setPhone(req.getParameter("phone"));
            c.setEmail(req.getParameter("email"));
            c.setSubject(req.getParameter("subject"));
            c.setMessage(req.getParameter("message"));

            // ===== OPTIONAL STONE ID =====
            String stoneId = req.getParameter("stoneId");
            if (stoneId != null && !stoneId.isEmpty()) {
                c.setStoneId(Integer.parseInt(stoneId));
            } else {
                c.setStoneId(null);
            }

            // ===== DEFAULT STATUS =====
            c.setStatus("NEW");

            // ===== SAVE TO DB =====
            boolean success = contactService.submitContact(c);

            if (success) {

                session.setAttribute("msg",
                        "🎉 Gửi liên hệ thành công! Chúng tôi sẽ phản hồi sớm.");

                resp.sendRedirect(req.getContextPath() + "/contact");

            } else {

                session.setAttribute("msg",
                        "❌ Gửi liên hệ thất bại. Vui lòng thử lại!");

                resp.sendRedirect(req.getContextPath() + "/contact");
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/contact?error=true");
        }
    }
}