package com.example.stonefengshuimanagement.dao;

import com.example.stonefengshuimanagement.model.entity.Blog;
import com.example.stonefengshuimanagement.utils.DBConnectionUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BlogDAO {

    private static final String SELECT_ALL =
            "SELECT * FROM blog ORDER BY created_at DESC";

    private static final String SELECT_BY_ID =
            "SELECT * FROM blog WHERE id = ?";

    private static final String INSERT =
            "INSERT INTO blog(title, content, image) VALUES (?, ?, ?)";

    private static final String UPDATE =
            "UPDATE blog SET title = ?, content = ?, image = ? WHERE id = ?";

    private static final String DELETE =
            "DELETE FROM blog WHERE id = ?";

    // ===================== GET ALL =====================
    public List<Blog> findAll() {
        List<Blog> list = new ArrayList<>();

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_ALL)) {

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Blog blog = new Blog();
                blog.setId(rs.getInt("id"));
                blog.setTitle(rs.getString("title"));
                blog.setContent(rs.getString("content"));
                blog.setImage(rs.getString("image"));
                blog.setCreatedAt(rs.getTimestamp("created_at"));

                list.add(blog);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    // ===================== GET BY ID =====================
    public Blog findById(int id) {
        Blog blog = null;

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_BY_ID)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                blog = new Blog();
                blog.setId(rs.getInt("id"));
                blog.setTitle(rs.getString("title"));
                blog.setContent(rs.getString("content"));
                blog.setImage(rs.getString("image"));
                blog.setCreatedAt(rs.getTimestamp("created_at"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return blog;
    }

    // ===================== INSERT =====================
    public boolean insert(Blog blog) {
        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(INSERT)) {

            ps.setString(1, blog.getTitle());
            ps.setString(2, blog.getContent());
            ps.setString(3, blog.getImage());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // ===================== UPDATE =====================
    public boolean update(Blog blog) {
        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(UPDATE)) {

            ps.setString(1, blog.getTitle());
            ps.setString(2, blog.getContent());
            ps.setString(3, blog.getImage());
            ps.setInt(4, blog.getId());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // ===================== DELETE =====================
    public boolean delete(int id) {
        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(DELETE)) {

            ps.setInt(1, id);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
}