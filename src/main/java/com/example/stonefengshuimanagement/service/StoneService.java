package com.example.stonefengshuimanagement.service;

import com.example.stonefengshuimanagement.dao.StoneDAO;
import com.example.stonefengshuimanagement.model.entity.Stone;

import java.sql.SQLException;
import java.util.List;

public class StoneService {
    private StoneDAO stoneDAO = new StoneDAO();

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
    public boolean addStone(Stone stone) {

        if (stone.getName() == null || stone.getName().isEmpty()) {
            return false;
        }

        if (stone.getPrice() < 0) {
            return false;
        }

        stoneDAO.insert(stone);
        return true;
    }

    // Update stone
    public boolean updateStone(Stone stone) throws SQLException {

        Stone existing = stoneDAO.findById(stone.getId());
        if (existing == null) {
            return false;
        }

        return stoneDAO.update(stone);
    }

    // Delete stone
    public boolean deleteStone(int id) throws SQLException {

        Stone existing = stoneDAO.findById(id);
        if (existing == null) {
            return false;
        }

        return stoneDAO.delete(id);
    }
}
