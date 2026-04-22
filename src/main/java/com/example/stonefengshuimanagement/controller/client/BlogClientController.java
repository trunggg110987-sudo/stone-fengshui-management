package com.example.stonefengshuimanagement.controller.client;

import com.example.stonefengshuimanagement.model.entity.Blog;
import com.example.stonefengshuimanagement.service.BlogService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/blog")
public class BlogClientController extends HttpServlet {

    private BlogService blogService;

    @Override
    public void init() {
        blogService = new BlogService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Blog> blogs = blogService.getAllBlogs();

        request.setAttribute("blogs", blogs);

        // ================== IMPORTANT FIX ==================
        request.setAttribute("pageTitle", "Blog");
        request.setAttribute("contentPage", "/views/client/blog.jsp");

        request.getRequestDispatcher("/views/common/client-layout.jsp")
                .forward(request, response);
    }
}