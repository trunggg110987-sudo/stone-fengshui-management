package com.example.stonefengshuimanagement.dao;

import com.example.stonefengshuimanagement.model.entity.Stone;
import com.example.stonefengshuimanagement.utils.DBConnectionUtil;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;
import java.util.ArrayList;

public class StoneDAO {

    private Stone mapRow(ResultSet rs) throws Exception {
        Stone stone = new Stone();
        stone.setId(rs.getInt("id"));
        stone.setName(rs.getString("name"));
        stone.setPrice(rs.getBigDecimal("price"));
        stone.setImageUrl(rs.getString("image_url"));
        return stone;
    }

    public List<Stone> findAll() throws SQLException {
        List<Stone> stones = new ArrayList<>();

        String sql = "SELECT id, name, price, image_url FROM stones";
        try(Connection conn = DBConnectionUtil.getConnection();
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery()
        ){
            while (rs.next()) {
                stones.add(mapRow(rs));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return stones;
    }

    public Stone findById(int id) throws SQLException {
        String sql = "SELECT id, name, price, image_url FROM stones WHERE id = ?";

        try(Connection conn = DBConnectionUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)
        ){
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return mapRow(rs);
            }
            ps.setInt(1, id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return null;
    }
    public List<Stone> search(String keyword) throws SQLException {
        String sql = "SELECT id, name, price, image_url FROM stones WHERE name like ?";

        List<Stone> stones = new ArrayList<>();

        try(Connection conn = DBConnectionUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)
        ){
            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                stones.add(mapRow(rs));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return stones;
    }

    public List<Stone> filterByPrice(BigDecimal minPrice, BigDecimal maxPrice) {
        List<Stone> stones = new ArrayList<>();

        StringBuilder sql = new StringBuilder("SELECT id, name, price, image_url FROM stones WHERE 1=1");

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
}