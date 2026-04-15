package com.example.stonefengshuimanagement.dao;

import com.example.stonefengshuimanagement.model.entity.Stone;
import com.example.stonefengshuimanagement.utils.DBConnectionUtil;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

public class StoneDAO {

    public static final String SELECT_BY_ID = "SELECT id, name, price, image_url FROM stones WHERE id = ?";
    public static final String SELECT_ALL = "SELECT id, name, price, image_url FROM stones";
    public static final String SELECT_BY_NAME = "SELECT id, name, price, image_url FROM stones WHERE name like ?";
    public static final String SELECT_FILTER_BASE = "SELECT id, name, price, image_url FROM stones WHERE 1=1";
    private static final String DELETE_BY_ID = "DELETE FROM stones WHERE id = ?";
    public static final String INSERT_INTO_STONES = "INSERT INTO stones (name, price, image_url) VALUES (?, ?, ?)";
    public static final String UPDATE_STONE = "UPDATE stones SET name = ?, price = ?, image_url = ? WHERE id = ?";

    private Stone mapRow(ResultSet rs) throws SQLException {
        Stone stone = new Stone();
        stone.setId(rs.getInt("id"));
        stone.setName(rs.getString("name"));
        stone.setPrice(rs.getBigDecimal("price"));
        stone.setImageUrl(rs.getString("image_url"));
        return stone;
    }

    public List<Stone> findAll() throws SQLException {
        List<Stone> stones = new ArrayList<>();

        try(Connection conn = DBConnectionUtil.getConnection();
            PreparedStatement preparedStatement = conn.prepareStatement(SELECT_ALL);
            ResultSet rs = preparedStatement.executeQuery()
        ){
            while (rs.next()) {
                stones.add(mapRow(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return stones;
    }

    public Stone findById(int id) throws SQLException {

        try(Connection conn = DBConnectionUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(SELECT_BY_ID)
        ){
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return mapRow(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public List<Stone> search(String keyword) throws SQLException {

        List<Stone> stones = new ArrayList<>();

        try(Connection conn = DBConnectionUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(SELECT_BY_NAME)
        ){
            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                stones.add(mapRow(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return stones;
    }

    public List<Stone> filterByPrice(BigDecimal minPrice, BigDecimal maxPrice) {
        List<Stone> stones = new ArrayList<>();

        StringBuilder sql = new StringBuilder(SELECT_FILTER_BASE);

        if (minPrice != null) {
            sql.append(" AND price >= ?");
        }
        if (maxPrice != null) {
            sql.append(" AND price <= ?");
        }

        try (
                Connection conn = DBConnectionUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql.toString())
        ) {
            int index = 1;

            if (minPrice != null) {
                ps.setBigDecimal(index++, minPrice);
            }
            if (maxPrice != null) {
                ps.setBigDecimal(index++, maxPrice);
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                stones.add(mapRow(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return stones;
    }

    public void deleteById(int id) throws SQLException {
        try(Connection conn = DBConnectionUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(DELETE_BY_ID)
        ){
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void insert(Stone stone) throws SQLException {
        try(Connection conn = DBConnectionUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(INSERT_INTO_STONES)
        ){
            ps.setString(1, stone.getName());
            ps.setBigDecimal(2, stone.getPrice());
            ps.setString(3, stone.getImageUrl());
            ps.executeUpdate();
        }
    }

    public void update(int id, Stone stone) throws SQLException {
        try(Connection conn = DBConnectionUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(UPDATE_STONE)
        ){
            ps.setString(1, stone.getName());
            ps.setBigDecimal(2, stone.getPrice());
            ps.setString(3, stone.getImageUrl());
            ps.setInt(4, id);
            ps.executeUpdate();
        }
    }
}