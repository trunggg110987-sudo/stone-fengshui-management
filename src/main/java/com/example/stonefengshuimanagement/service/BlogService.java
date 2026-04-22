package com.example.stonefengshuimanagement.service;

import com.example.stonefengshuimanagement.dao.BlogDAO;
import com.example.stonefengshuimanagement.model.entity.Blog;

import javax.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import java.util.List;

public class BlogService {

    private final BlogDAO blogDAO;

    public BlogService() {
        this.blogDAO = new BlogDAO();
    }

    // ===================== GET ALL =====================
    public List<Blog> getAllBlogs() {
        return blogDAO.findAll();
    }

    // ===================== GET BY ID =====================
    public Blog getBlogById(int id) {
        if (id <= 0) return null;
        return blogDAO.findById(id);
    }

    // ===================== CREATE =====================
    public boolean createBlog(Blog blog) {
        if (!isValidBlog(blog)) return false;
        return blogDAO.insert(blog);
    }

    // ===================== UPDATE =====================
    public boolean updateBlog(Blog blog) {
        if (blog.getId() <= 0 || !isValidBlog(blog)) return false;
        return blogDAO.update(blog);
    }

    // ===================== DELETE =====================
    public boolean deleteBlog(int id) {
        if (id <= 0) return false;
        return blogDAO.delete(id);
    }

    // ======================================================
    // ⭐ NEW: HANDLE IMAGE (UPLOAD + SELECT EXISTING)
    // ======================================================
    public String handleImage(Part uploadImage, String imageOption, String uploadDirPath) {

        try {

            // ===================== 1. UPLOAD IMAGE =====================
            if (uploadImage != null && uploadImage.getSize() > 0) {

                String fileName = Paths.get(uploadImage.getSubmittedFileName())
                        .getFileName().toString();

                // tạo folder nếu chưa có
                File dir = new File(uploadDirPath);
                if (!dir.exists()) {
                    dir.mkdirs();
                }

                String fullPath = uploadDirPath + File.separator + fileName;

                uploadImage.write(fullPath);

                return "uploads/" + fileName;
            }

            // ===================== 2. CHỌN IMAGE CÓ SẴN =====================
            if (imageOption != null && !imageOption.isEmpty()) {
                return imageOption;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        // fallback default
        return null;
    }

    // ===================== VALIDATION =====================
    private boolean isValidBlog(Blog blog) {
        if (blog == null) return false;

        if (blog.getTitle() == null || blog.getTitle().trim().isEmpty()) {
            return false;
        }

        if (blog.getContent() == null || blog.getContent().trim().isEmpty()) {
            return false;
        }

        return true;
    }
}