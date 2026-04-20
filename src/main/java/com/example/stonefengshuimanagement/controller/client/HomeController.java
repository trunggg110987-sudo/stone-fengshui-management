package com.example.stonefengshuimanagement.controller.client;

import com.example.stonefengshuimanagement.model.entity.Stone;
import com.example.stonefengshuimanagement.service.StoneService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeController", urlPatterns = {"/home"})
public class HomeController extends HttpServlet {

    private final StoneService stoneService = new StoneService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // UTF-8 (đặt trước forward)
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=UTF-8");

            // ===== PAGINATION =====
            int page = 1;
            int pageSize = 12;

            String pageParam = request.getParameter("page");

            if (pageParam != null && !pageParam.isEmpty()) {
                try {
                    page = Integer.parseInt(pageParam);
                } catch (NumberFormatException e) {
                    page = 1;
                }
            }

            if (page < 1) page = 1;

            int offset = (page - 1) * pageSize;

            // ===== DATA =====
            List<Stone> stones = stoneService.getPaging(page, pageSize);
            int total = stoneService.countAll();

            int totalPage = (int) Math.ceil((double) total / pageSize);

            if (page > totalPage && totalPage > 0) {
                page = totalPage;
            }

            // ===== SET ATTRIBUTE =====
            request.setAttribute("stones", stones);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPage", totalPage);

            request.setAttribute("contentPage", "/views/client/home.jsp");

            // cart
            request.setAttribute("contentPage", "/views/client/cart.jsp");
            request.setAttribute("pageTitle", "Giỏ hàng");

            // yêu thích
            request.setAttribute("contentPage", "/views/client/favorite.jsp");
            request.setAttribute("pageTitle", "❤ Danh sách yêu thích");

            // ===== FORWARD =====
            request.getRequestDispatcher("/views/common/client-layout.jsp")
                    .forward(request, response);

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}