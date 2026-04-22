package com.example.stonefengshuimanagement.controller.client;

import com.example.stonefengshuimanagement.model.entity.Blog;
import com.example.stonefengshuimanagement.service.BlogService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/blog/detail")
public class BlogDetailController extends HttpServlet {

    private BlogService blogService;

    @Override
    public void init() {
        blogService = new BlogService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");

        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/blog");
            return;
        }

        int id = Integer.parseInt(idParam);

        Blog blog = blogService.getBlogById(id);

        if (blog == null) {
            response.sendRedirect(request.getContextPath() + "/blog");
            return;
        }

        request.setAttribute("blog", blog);

        request.setAttribute("pageTitle", "Blog Detail");
        request.setAttribute("contentPage", "/views/client/blog-detail.jsp");

        request.getRequestDispatcher("/views/common/client-layout.jsp")
                .forward(request, response);
    }
}