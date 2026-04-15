package com.example.stonefengshuimanagement.service;

import com.example.stonefengshuimanagement.dao.StoneDAO;
import com.example.stonefengshuimanagement.model.entity.Stone;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;

public class StoneService {

    private final StoneDAO stoneDAO;

    public StoneService() {
        this.stoneDAO = new StoneDAO();
    }

    public List<Stone> getAllStones() throws SQLException {
        return stoneDAO.findAll();
    }

    public Stone getStoneById(int id) throws SQLException {
        return stoneDAO.findById(id);
    }

    public List<Stone> search(String keyword) throws SQLException {
        return stoneDAO.search(keyword);
    }

    public List<Stone> filterByPrice(BigDecimal minPrice, BigDecimal maxPrice) {
        return stoneDAO.filterByPrice(minPrice, maxPrice);
    }

    public void addStone(Stone stone) throws SQLException {
        stoneDAO.insert(stone);
    }

    public void updateStone(int id, Stone stone) throws SQLException {
        stoneDAO.update(id, stone);
    }

    public void deleteStone(int id) throws SQLException {
        stoneDAO.deleteById(id);
    }
}