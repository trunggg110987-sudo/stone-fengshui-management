package com.example.stonefengshuimanagement.dao;

import com.example.stonefengshuimanagement.model.entity.Category;
import com.example.stonefengshuimanagement.utils.DBConnectionUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {
    public static final String SELECT_ALL_CATEGORY =
            "SELECT id, name, description, status FROM categories";
    public static final String INSERT_INTO_CATEGORY =
            "INSERT INTO categories(name, description, status) VALUES (?, ?, ?)";
    public static final String SELECT_CATEGORY_BY_ID =
            "SELECT id, name, description, status FROM categories WHERE id = ?";

    public List<Category> findAll() {
        List<Category> categories = new ArrayList<>();
        try (
                Connection conn = DBConnectionUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(SELECT_ALL_CATEGORY);
                ResultSet rs = ps.executeQuery();
        ) {
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                int status = rs.getInt("status");

                Category category = new Category(id, name, description, status);
                categories.add(category);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return categories;
    }

    public boolean addCategory(Category category) {
        try {
            Connection conn = DBConnectionUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(INSERT_INTO_CATEGORY);
            ps.setString(1, category.getName());
            ps.setString(2, category.getDescription());
            ps.setInt(3, category.getStatus());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public Category findCategoryById(int id) {
        Category category = null;
        try {
            Connection conn = DBConnectionUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(SELECT_CATEGORY_BY_ID);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String name = rs.getString("name");
                String description = rs.getString("description");
                int status = rs.getInt("status");
                category = new Category(id, name, description, status);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return category;
    }

    public static final String DELETE_CATEGORY = " DELETE FROM categories WHERE id = ?";
    public boolean deleteCategoryById(int id) {
        boolean result = false;
        try {
            Connection conn = DBConnectionUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(DELETE_CATEGORY);
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
        }
    public static final String UPDATE_CATEGORY = "UPDATE categories SET name = ?, description = ?, status = ? WHERE id = ?";
    public boolean updateCategory(Category category) {
        boolean update = false;
        try {
            Connection conn = DBConnectionUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(UPDATE_CATEGORY);
            ps.setString(1, category.getName());
            ps.setString(2, category.getDescription());
            ps.setInt(3, category.getStatus());
            ps.setInt(4, category.getId());
            update = ps.executeUpdate() > 0;

        }catch (Exception e) {
            e.printStackTrace();
        }
        return update;
    }
    public static final String SEARCH_BY_NAME_AND_STATUS = "SELECT id, name, description, status FROM categories WHERE name LIKE ? AND status = ?";
    public List<Category> searchByName(String name, int status) {
        List<Category> categories = new ArrayList<>();
        try {
            Connection conn = DBConnectionUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(SEARCH_BY_NAME_AND_STATUS);
            ps.setString(1, "%" + name + "%");
            ps.setInt(2, status);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String nameCategory = rs.getString("name");
                String descriptionCategory = rs.getString("description");
                int statusCategory = rs.getInt("status");
                Category category = new Category(id, nameCategory, descriptionCategory, statusCategory);
                categories.add(category);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return categories;
    }
    }


