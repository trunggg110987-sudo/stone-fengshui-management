package com.example.stonefengshuimanagement.filter;

import com.example.stonefengshuimanagement.dao.CategoryDAO;
import com.example.stonefengshuimanagement.model.entity.Category;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;
import java.util.List;

@WebFilter("/*")
public class CatetoryFilter implements Filter {

    private final CategoryDAO categoryDAO = new CategoryDAO();

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        try {
            List<Category> categories = categoryDAO.findAll();
            request.setAttribute("categories", categories);
        } catch (Exception e) {
            e.printStackTrace();
        }

        chain.doFilter(request, response);
    }
}
