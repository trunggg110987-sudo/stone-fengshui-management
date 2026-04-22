package com.example.stonefengshuimanagement.controller.client;

import com.example.stonefengshuimanagement.model.entity.Stone;
import com.example.stonefengshuimanagement.model.entity.User;
import com.example.stonefengshuimanagement.model.entity.CartItem;
import com.example.stonefengshuimanagement.service.StoneService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CartController", urlPatterns = "/cart")
public class CartController extends HttpServlet {

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

        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null) cart = new ArrayList<>();

        Stone stone = null;
        try {
            stone = stoneService.findById(stoneId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        // ================= REMOVE =================
        if ("remove".equals(action)) {

            cart.removeIf(item -> item.getStoneId() == stoneId);

            session.setAttribute("cart", cart);
            session.setAttribute("msg", "🗑 Đã xóa khỏi giỏ hàng!");

            resp.sendRedirect(req.getContextPath() + "/cart/view");
            return;
        }

        boolean found = false;

        for (CartItem item : cart) {
            if (item.getStoneId() == stoneId) {
                item.setQuantity(item.getQuantity() + 1);
                found = true;
                break;
            }
        }

        if (!found) {
            cart.add(new CartItem(
                    stone.getId(),
                    stone.getName(),
                    stone.getImageUrl(),
                    stone.getPrice(),
                    1
            ));
        }

        session.setAttribute("cart", cart);
        session.setAttribute("msg", "🛒 Đã thêm vào giỏ hàng!");
        resp.sendRedirect(req.getHeader("Referer"));
    }
}