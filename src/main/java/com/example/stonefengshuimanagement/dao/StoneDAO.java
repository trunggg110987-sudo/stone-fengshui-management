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

    private static final String SELECT_ALL = "SELECT * FROM stones";
    private static final String SELECT_BY_ID = "SELECT * FROM stones WHERE id = ?";
    private static final String SEARCH_BY_NAME = "SELECT * FROM stones WHERE name LIKE ?";
    private static final String INSERT = "INSERT INTO stones (category_id, name, code, price, image_url, description, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
    private static final String UPDATE = "UPDATE stones SET category_id=?, name=?, code=?, price=?, image_url=?, description=?, status=? WHERE id=?";
    private static final String DELETE = "DELETE FROM stones WHERE id=?";


    public List<Stone> findAll() throws SQLException {
        List<Stone> list = new ArrayList<>();

        try(Connection conn = DBConnectionUtil.getConnection();
            PreparedStatement preparedStatement = conn.prepareStatement(SELECT_ALL);
            ResultSet rs = preparedStatement.executeQuery()
        ){
            while (rs.next()) {
                list.add(mapResultSetToStone(rs));
            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
        return list;
    }

    public Stone findById(int id) throws SQLException {
        Stone stone = null;

        try(Connection conn = DBConnectionUtil.getConnection();
            PreparedStatement preparedStatement = conn.prepareStatement(SELECT_BY_ID)
        ){
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                stone = mapResultSetToStone(rs);
            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
        return stone;
    }
    public List<Stone> search(String keyword) throws SQLException {
        List<Stone> list = new ArrayList<>();

        try(Connection conn = DBConnectionUtil.getConnection();
            PreparedStatement preparedStatement = conn.prepareStatement(SEARCH_BY_NAME)
        ){
            preparedStatement.setString(1, "%" + keyword + "%");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                list.add(mapResultSetToStone(rs));
            }
        } catch (SQLException e){
            throw new RuntimeException(e);
        }
        return list;
    }

    public void insert(Stone stone) {
        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(INSERT)) {

            ps.setInt(1, stone.getCategoryId());
            ps.setString(2, stone.getName());
            ps.setString(3, stone.getCode());
            ps.setDouble(4, stone.getPrice());
            ps.setString(5, stone.getImageUrl());
            ps.setString(6, stone.getDescription());
            ps.setInt(7, stone.getStatus());

            ps.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean update(Stone stone) {
        boolean rowUpdated = false;

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(UPDATE)) {

            ps.setInt(1, stone.getCategoryId());
            ps.setString(2, stone.getName());
            ps.setString(3, stone.getCode());
            ps.setDouble(4, stone.getPrice());
            ps.setString(5, stone.getImageUrl());
            ps.setString(6, stone.getDescription());
            ps.setInt(7, stone.getStatus());
            ps.setInt(8, stone.getId());

            rowUpdated = ps.executeUpdate() > 0;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return rowUpdated;
    }

    public boolean delete(int id) {
        boolean rowDeleted = false;

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(DELETE)) {

            ps.setInt(1, id);
            rowDeleted = ps.executeUpdate() > 0;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return rowDeleted;
    }

    private Stone mapResultSetToStone(ResultSet rs) throws SQLException {
        return new Stone(
                rs.getInt("id"),
                rs.getInt("category_id"),
                rs.getString("name"),
                rs.getString("code"),
                rs.getDouble("price"),
                rs.getString("image_url"),
                rs.getString("description"),
                rs.getInt("status")
        );
    }
    // added by anh
    public List<Stone> findByCategory(int categoryId) throws SQLException {
        List<Stone> list = new ArrayList<>();

        String sql = "SELECT * FROM stones WHERE category_id = ?";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(mapResultSetToStone(rs));
            }
        }

        return list;
    }
    public List<Stone> getLimit(int limit) {
        List<Stone> list = new ArrayList<>();

        String sql = "SELECT * FROM stones WHERE status = 1 LIMIT ?";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, limit);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Stone s = new Stone();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setCode(rs.getString("code"));
                s.setPrice(rs.getDouble("price"));
                s.setImageUrl(rs.getString("image_url"));
                s.setDescription(rs.getString("description"));
                s.setStatus(rs.getInt("status"));
                s.setCategoryId(rs.getInt("category_id"));

                list.add(s);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
