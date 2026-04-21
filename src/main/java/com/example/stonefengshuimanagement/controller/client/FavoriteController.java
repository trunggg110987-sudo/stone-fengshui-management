package com.example.stonefengshuimanagement.controller.client;

import com.example.stonefengshuimanagement.model.entity.Stone;
import com.example.stonefengshuimanagement.model.entity.User;
import com.example.stonefengshuimanagement.service.CartItem;
import com.example.stonefengshuimanagement.service.StoneService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "FavoriteController", urlPatterns = "/favorite")
public class FavoriteController extends HttpServlet {

    private final StoneService stoneService = new StoneService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        HttpSession session = req.getSession();

        // ================= CHECK LOGIN =================
        User user = (User) session.getAttribute("user");

        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/login");
            return;
        }
        String action = req.getParameter("action");

        int stoneId = Integer.parseInt(req.getParameter("stoneId"));

        List<CartItem> favorites =
                (List<CartItem>) session.getAttribute("favorites");

        if (favorites == null) favorites = new ArrayList<>();

        // ================= REMOVE ================= add by anh
        if ("remove".equals(action)) {

            favorites.removeIf(item -> item.getStoneId() == stoneId);

            session.setAttribute("favorites", favorites);
            session.setAttribute("msg", "🗑 Đã xóa khỏi yêu thích!");

            resp.sendRedirect(req.getContextPath() + "/favorite/view");
            return;
        }
        // ================= ADD =================
        try {
            Stone stone = stoneService.findById(stoneId);

            boolean found = false;

            for (CartItem item : favorites) {
                if (item.getStoneId() == stoneId) {
                    found = true;
                    break;
                }
            }

            if (!found) {
                favorites.add(new CartItem(
                        stone.getId(),
                        stone.getName(),
                        stone.getImageUrl(),
                        stone.getPrice(),
                        1
                ));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        session.setAttribute("favorites", favorites);
        session.setAttribute("msg", "❤️ Đã thêm vào yêu thích!");
        resp.sendRedirect(req.getHeader("Referer"));
    }
}