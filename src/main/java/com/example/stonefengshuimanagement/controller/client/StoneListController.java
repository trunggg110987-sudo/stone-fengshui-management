package com.example.stonefengshuimanagement.controller.client;

import com.example.stonefengshuimanagement.dao.StoneDAO;
import com.example.stonefengshuimanagement.model.entity.Stone;
import com.example.stonefengshuimanagement.service.StoneService;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "stone-list", value = "/stones")
public class StoneListController extends HttpServlet {

    @Override
    public void init() throws ServletException {
        StoneDAO stoneDAO = new StoneDAO();
        StoneService stoneService = new StoneService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Stone> stoneList = new StoneService().getAllStones();
        req.setAttribute("stoneList", stoneList);
        req.getRequestDispatcher("/views/client/stone-list.jsp").forward(req, resp);
    }
}
