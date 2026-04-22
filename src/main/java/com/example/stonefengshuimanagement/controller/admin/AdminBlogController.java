package com.example.stonefengshuimanagement.controller.admin;

import com.example.stonefengshuimanagement.model.entity.Blog;
import com.example.stonefengshuimanagement.service.BlogService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BlogController", urlPatterns = "/admin/blog")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class AdminBlogController extends HttpServlet {

    private BlogService blogService;

    @Override
    public void init() {
        blogService = new BlogService();
    }

    // ===================== GET =====================
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {

            case "create":
                loadImageList(request);
                request.setAttribute("pageTitle", "Thêm Blog");
                request.setAttribute("contentPage", "/views/admin/blog/blog-form.jsp");

                request.getRequestDispatcher("/views/admin/dashboard.jsp")
                        .forward(request, response);
                break;

            case "edit":
                showEditForm(request, response);
                break;

            case "detail":
                showDetail(request, response);
                break;

            case "delete":
                deleteBlog(request, response);
                break;

            default:
                listBlogs(request, response);
                break;
        }
    }

    // ===================== POST =====================
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String idStr = request.getParameter("id");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String imageOption = request.getParameter("imageOption");

        Part uploadImage = request.getPart("uploadImage");

        // upload folder
        String uploadDir = getServletContext().getRealPath("/uploads");

        // xử lý image (UPLOAD + SELECT)
        String imagePath = blogService.handleImage(uploadImage, imageOption, uploadDir);

        Blog blog = new Blog();
        blog.setTitle(title);
        blog.setContent(content);
        blog.setImage(imagePath);

        if (idStr == null || idStr.isEmpty()) {
            blogService.createBlog(blog);
        } else {
            blog.setId(Integer.parseInt(idStr));
            blogService.updateBlog(blog);
        }

        response.sendRedirect(request.getContextPath() + "/admin/blog");
    }

    // ===================== LIST =====================
    private void listBlogs(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Blog> blogs = blogService.getAllBlogs();

        request.setAttribute("blogs", blogs);
        request.setAttribute("pageTitle", "Quản lý Blog");
        request.setAttribute("contentPage", "/views/admin/blog/blog-list.jsp");

        request.getRequestDispatcher("/views/admin/dashboard.jsp")
                .forward(request, response);
    }

    // ===================== EDIT =====================
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");

        if (idStr == null) {
            response.sendRedirect(request.getContextPath() + "/admin/blog");
            return;
        }

        int id = Integer.parseInt(idStr);
        Blog blog = blogService.getBlogById(id);

        loadImageList(request);

        request.setAttribute("blog", blog);
        request.setAttribute("pageTitle", "Sửa Blog");
        request.setAttribute("contentPage", "/views/admin/blog/blog-form.jsp");

        request.getRequestDispatcher("/views/admin/dashboard.jsp")
                .forward(request, response);
    }

    // ===================== DETAIL =====================
    private void showDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");

        if (idStr == null) {
            response.sendRedirect(request.getContextPath() + "/admin/blog");
            return;
        }

        int id = Integer.parseInt(idStr);
        Blog blog = blogService.getBlogById(id);

        request.setAttribute("blog", blog);
        request.setAttribute("pageTitle", "Chi tiết Blog");
        request.setAttribute("contentPage", "/views/admin/blog/blog-detail.jsp");

        request.getRequestDispatcher("/views/admin/dashboard.jsp")
                .forward(request, response);
    }

    // ===================== DELETE =====================
    private void deleteBlog(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String idStr = request.getParameter("id");

        if (idStr != null) {
            int id = Integer.parseInt(idStr);
            blogService.deleteBlog(id);
        }

        response.sendRedirect(request.getContextPath() + "/admin/blog");
    }

    // ===================== LOAD IMAGE LIST =====================
    private void loadImageList(HttpServletRequest request) {

        String path = getServletContext().getRealPath("/images");
        File folder = new File(path);

        String[] images = folder.list();

        request.setAttribute("imageList", images);
    }
}