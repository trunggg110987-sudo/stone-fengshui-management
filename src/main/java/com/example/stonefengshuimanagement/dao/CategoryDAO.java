package com.example.stonefengshuimanagement.dao;

import com.example.stonefengshuimanagement.model.entity.Category;
import com.example.stonefengshuimanagement.utils.DBConnectionUtil;
import exception.DatabaseException;
import exception.ExceptionUtil;

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

    public boolean existsByName(String name) throws DatabaseException {
        String sql = "SELECT COUNT(*) FROM categories WHERE name = ?";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0;
            }

        } catch (Exception e) {
            ExceptionUtil.throwDatabaseException(e);
        }

        return false;
    }
    public List<Category> findAll() throws DatabaseException {
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
            ExceptionUtil.throwDatabaseException(e);
        }
        return categories;
    }
    public boolean addCategory(Category category) throws DatabaseException {
        try (
                Connection conn = DBConnectionUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(INSERT_INTO_CATEGORY)
        ) {
            ps.setString(1, category.getName());
            ps.setString(2, category.getDescription());
            ps.setInt(3, category.getStatus());

            ps.executeUpdate();
            return true;

        } catch (java.sql.SQLIntegrityConstraintViolationException e) {
            return false;

        } catch (Exception e) {
            ExceptionUtil.throwDatabaseException(e);
        }
        return false;
    }

    public Category findCategoryById(int id) throws DatabaseException {
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
            ExceptionUtil.throwDatabaseException(e);
        }
        return category;
    }
// kiểm tra category có stone không
    public boolean existsStoneByCategoryId(int categoryId) throws DatabaseException {
        String sql = "SELECT COUNT(*) FROM stones WHERE category_id = ?";
        try (
                Connection conn = DBConnectionUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            ExceptionUtil.throwDatabaseException(e);
        }
        return false;
    }
    public static final String DELETE_CATEGORY = " DELETE FROM categories WHERE id = ?";
    public boolean deleteCategoryById(int id) throws DatabaseException {
        boolean result = false;
        try {
            Connection conn = DBConnectionUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(DELETE_CATEGORY);
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            ExceptionUtil.throwDatabaseException(e);
        }
        return result;
        }
    public static final String UPDATE_CATEGORY = "UPDATE categories SET name = ?, description = ?, status = ? WHERE id = ?";
    public boolean updateCategory(Category category) throws DatabaseException {
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
            ExceptionUtil.throwDatabaseException(e);
        }
        return update;
    }
    public static final String SEARCH_BY_NAME_AND_STATUS = "SELECT id, name, description, status FROM categories WHERE name LIKE ? AND status = ?";
    public List<Category> searchByNameAndStatus(String name, int status) throws DatabaseException {
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
            ExceptionUtil.throwDatabaseException(e);
        }
        return categories;
    }
    // tìm kiếm theo tên
    public List<Category> searchByName(String name) throws DatabaseException {
        List<Category> categories = new ArrayList<>();

        String sql = "SELECT id, name, description, status FROM categories WHERE name LIKE ?";

        try (
                Connection conn = DBConnectionUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setString(1, "%" + name + "%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                categories.add(new Category(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getInt("status")
                ));
            }

        } catch (Exception e) {
            ExceptionUtil.throwDatabaseException(e);
        }

        return categories;
    }
    // tìm kiếm theo status
    public List<Category> searchByStatus(int status) throws DatabaseException {
        List<Category> categories = new ArrayList<>();

        String sql = "SELECT id, name, description, status FROM categories WHERE status = ?";

        try (
                Connection conn = DBConnectionUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setInt(1, status);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                categories.add(new Category(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getInt("status")
                ));
            }

        } catch (Exception e) {
            ExceptionUtil.throwDatabaseException(e);
        }

        return categories;
    }
    // tổng category
    public int countAll() throws DatabaseException {
        String sql = "SELECT COUNT(*) FROM categories";

        try (
                Connection conn = DBConnectionUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()
        ) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            ExceptionUtil.throwDatabaseException(e);
        }
        return 0;
    }
    }


