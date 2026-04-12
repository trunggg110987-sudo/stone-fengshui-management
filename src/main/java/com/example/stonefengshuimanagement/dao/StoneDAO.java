package com.example.stonefengshuimanagement.dao;

import com.example.stonefengshuimanagement.model.entity.Stone;
import com.example.stonefengshuimanagement.utils.DBConnectionUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

public class StoneDAO {
    public List<Stone> findAll() throws SQLException {
        List<Stone> stones = new ArrayList<>();

        String sql = "SELECT id, name, price, image_url FROM stones";
        try(Connection conn = DBConnectionUtil.getConnection();
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery()
        ){
            while (rs.next()) {
                Stone stone = new Stone();
                stone.setId(rs.getInt("id"));
                stone.setName(rs.getString("name"));
                stone.setPrice(rs.getBigDecimal("price"));
                stone.setImageUrl(rs.getString("image_url"));
                stones.add(stone);
            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
        return stones;
    }

    public Stone findById(int id) throws SQLException {
        String sql = "SELECT id, name, price, image_url FROM stones WHERE id = ?";
        try(Connection conn = DBConnectionUtil.getConnection();
            PreparedStatement preparedStatement = conn.prepareStatement(sql)
        ){
            preparedStatement.setInt(1, id);
            Stone stone = getStone(preparedStatement);
            if (stone != null) return stone;
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
        return null;
    }
    public Stone search(String keyword) throws SQLException {
        String sql = "SELECT id, name, price, image_url FROM stones WHERE name like ?";
        try(Connection conn = DBConnectionUtil.getConnection();
            PreparedStatement preparedStatement = conn.prepareStatement(sql)
        ){
            preparedStatement.setString(1, "%" + keyword + "%");
            Stone stone = getStone(preparedStatement);
            if (stone != null) return stone;
        }
        return null;
    }

    private Stone getStone(PreparedStatement preparedStatement) throws SQLException {
        ResultSet rs = preparedStatement.executeQuery();
        if (rs.next()){
            Stone stone = new Stone();
            stone.setId(rs.getInt("id"));
            stone.setName(rs.getString("name"));
            stone.setPrice(rs.getBigDecimal("price"));
            stone.setImageUrl(rs.getString("image_url"));
            return stone;
        }
        return null;
    }
}
