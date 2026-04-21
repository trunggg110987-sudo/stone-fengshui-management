package com.example.stonefengshuimanagement.service;

import com.example.stonefengshuimanagement.dao.CategoryDAO;
import com.example.stonefengshuimanagement.exception.DatabaseException;
import com.example.stonefengshuimanagement.model.entity.Category;

import java.util.List;

public class CategoryService {

    private final CategoryDAO categoryDAO = new CategoryDAO();

    private void validate(Category category) {
        if (category == null) {
            throw new IllegalArgumentException("Category không được null");
        }
        String name = category.getName();
        String description = category.getDescription();
        if (name == null || name.trim().isEmpty()) {
            throw new IllegalArgumentException("Tên không được để trống");
        }
        int length = name.trim().length();
        if (length < 3 || length > 100) {
            throw new IllegalArgumentException("Tên từ 3 -> 100 ký tự");
        }
        if (description == null || description.trim().isEmpty()) {
            throw new IllegalArgumentException("Mô tả không được để trống");
        }
        if (description.trim().length() > 500) {
            throw new IllegalArgumentException("Mô tả tối đa 500 ký tự");
        }
        if (category.getStatus() < 0 || category.getStatus() > 1) {
            throw new IllegalArgumentException("Status chỉ nhận 0 hoặc 1");
        }
        try {
            if (categoryDAO.existsByName(name.trim())) {
                throw new IllegalArgumentException("Tên category đã tồn tại");
            }
        } catch (DatabaseException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Category> getAllCategories() throws DatabaseException {
        return categoryDAO.findAll();
    }

    public Category getCategoryById(int id) throws DatabaseException {
        if (id <= 0) {
            return null;
        }
        return categoryDAO.findCategoryById(id);
    }

    public boolean createCategory(Category category) throws DatabaseException {
        validate(category);
        return categoryDAO.addCategory(category);
    }

    public boolean updateCategory(Category category) throws DatabaseException {

        if (category == null || category.getId() <= 0) {
            return false;
        }

        Category old = categoryDAO.findCategoryById(category.getId());

        if (old == null) {
            return false;
        }


        if (old.getName().equals(category.getName())
                && old.getDescription().equals(category.getDescription())
                && old.getStatus() == category.getStatus()) {
            return false;
        }

        return categoryDAO.updateCategory(category);
    }

    public boolean deleteCategory(int id) throws DatabaseException {
        if (id <= 0) {
            return false;
        }
        return categoryDAO.deleteCategoryById(id);
    }

    public List<Category> getCategoryByName(String name) throws DatabaseException {
        if (name == null || name.trim().isEmpty()) {
            name = "";
        }
        return categoryDAO.searchByName(name);
    }
    public List<Category> getCategoryByStatus(int status) throws DatabaseException {
        if (status != 0 && status != 1) {
            return categoryDAO.findAll();
        }
        return categoryDAO.searchByStatus(status);
    }
    public List<Category> getCategoryByNameAndStatus(String name, int status) throws DatabaseException {

        if (name == null || name.trim().isEmpty()) {
            name = "";
        }
        if (status < 0 || status > 1) {
            throw new IllegalArgumentException("Status không hợp lệ");
        }
        return categoryDAO.searchByNameAndStatus(name, status);
    }

    public int getTotalCategories() throws DatabaseException {
        return categoryDAO.countAll();
    }
}