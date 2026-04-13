package com.example.stonefengshuimanagement.service;

import com.example.stonefengshuimanagement.dao.CategoryDAO;
import com.example.stonefengshuimanagement.model.entity.Category;

import java.util.List;

public class CategoryService {
    private final CategoryDAO categoryDAO = new CategoryDAO();
    public List<Category> getAllCategories() {
        return categoryDAO.findAll();
    }
    public Category getCategoryById(int id) {
        if(id <= 0) {
            return null;
        }
        Category category = categoryDAO.findCategoryById(id);
        if(category == null) {
            return null;
        }
        return category;
    }
    public boolean createCategory(Category category) {
        if(category == null) {
            return false;
        }
        if(category.getName() == null ||category.getName().trim().isEmpty()) {
            return false;
        }
        if (category.getStatus() < 0 || category.getStatus() > 1) {
            return false;
        }
        return categoryDAO.addCategory(category);
    }
    public boolean updateCategory(Category category) {
        if(category == null) {
            return false;
        }
        if(category.getId() <= 0) { return  false; }
        if(category.getName() == null ||category.getName().trim().isEmpty()) {return false; }
        if (category.getStatus() < 0 || category.getStatus() > 1) {
            return false;
        }
        return categoryDAO.updateCategory(category);
    }
    public boolean deleteCategory(int id) {
        if(id <= 0 ) {
            return false;
        }
        return categoryDAO.deleteCategoryById(id);
    }
    public List<Category> getCategoryByName(String name, int status) {
        if(name == null || name.trim().isEmpty()) {
            name = "";
        }
        return categoryDAO.searchByName(name, status);
    }
}
