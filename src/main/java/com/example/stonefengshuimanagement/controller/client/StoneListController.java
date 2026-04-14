package com.example.stonefengshuimanagement.controller.client;

import com.example.stonefengshuimanagement.dao.StoneDAO;
import com.example.stonefengshuimanagement.model.entity.Stone;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name="stone-list", value = "/stones")
public class StoneListController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        StoneDAO stoneDAO = new StoneDAO();

        String keyword = req.getParameter("keyword");
        String minStr  = req.getParameter("minPrice");
        String maxStr  = req.getParameter("maxPrice");

        BigDecimal minPrice = null;
        BigDecimal maxPrice = null;
        try {
            if(minStr != null && !minStr.trim().isEmpty()){
                 minPrice = new BigDecimal(minStr);
            }

            if(maxStr != null && !maxStr.trim().isEmpty()) {
                 maxPrice = new BigDecimal(maxStr);
            }
            } catch (Exception e){
                e.printStackTrace();
            }
            List<Stone> stones;

        try{
            if(keyword != null && !keyword.trim().isEmpty()){
                stones = stoneDAO.search(keyword);
            }else if(minPrice != null || maxPrice != null){
                stones = stoneDAO.filterByPrice(minPrice, maxPrice);
            }else{
                stones = stoneDAO.findAll();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        req.setAttribute("stones", stones);
        req.setAttribute("keyword", keyword);
        req.setAttribute("minPrice", minStr);
        req.setAttribute("maxPrice", maxStr);
        req.getRequestDispatcher("/views/client/stone-list.jsp").forward(req, resp);
    }
}
