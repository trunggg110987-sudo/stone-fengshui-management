package com.example.stonefengshuimanagement.service;

import com.example.stonefengshuimanagement.dao.StoneDAO;
import com.example.stonefengshuimanagement.model.entity.Stone;

import java.sql.SQLException;
import java.util.List;

public class StoneService {
    private final StoneDAO stoneDAO = new StoneDAO();


    // find all stone
    public List<Stone> findAll() throws SQLException {
        return stoneDAO.findAll();
    }

    // Find by ID
    public Stone findById(int id) throws SQLException {
        return stoneDAO.findById(id);
    }

    // Search by name
    public List<Stone> searchByName(String keyword) throws SQLException {
        return stoneDAO.search(keyword);
    }

    // Insert stone
    public void addStone(Stone stone) {

        if (stone.getName() == null || stone.getName().isEmpty()) {
            return;
        }

        if (stone.getPrice() < 0) {
            return;
        }

        stoneDAO.insert(stone);
    }

    public void updateStone(Stone stone) throws SQLException {

        Stone existing = stoneDAO.findById(stone.getId());
        if (existing == null) {
            return;
        }

        stoneDAO.update(stone);
    }

    public void deleteStone(int id) throws SQLException {

        Stone existing = stoneDAO.findById(id);
        if (existing == null) {
            return;
        }

        stoneDAO.delete(id);
    }

    public List<Stone> getPaging(int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        return stoneDAO.getPaging(offset, pageSize);
    }

    public int countAll() {
        return stoneDAO.countAll();
    }
    public List<Stone> getPagingByCategory(int categoryId, int offset, int limit) {
        return stoneDAO.getPagingByCategory(categoryId, offset, limit);
    }

    public int countByCategory(int categoryId) {
        return stoneDAO.countByCategory(categoryId);
    }
}