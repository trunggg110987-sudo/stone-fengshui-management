package com.example.stonefengshuimanagement.dao;

import com.example.stonefengshuimanagement.model.entity.ContactRequest;
import com.example.stonefengshuimanagement.utils.DBConnectionUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ContactRequestDAO {

    public static final String SELECT_ALL = "SELECT * FROM contact_requests";
    private static final String SELECT_BY_ID = "SELECT id, full_name, phone, email, subject, message, stone_id, status, created_at " + "FROM contact_requests WHERE id = ?";
    public static final String UPDATE_STATUS = "UPDATE contact_requests SET status = ? WHERE id = ?";
    private static final String DELETE_BY_ID = "DELETE FROM contact_requests WHERE id = ?";

    private ContactRequest mapRow(ResultSet rs) throws Exception {
        ContactRequest contactRequest = new ContactRequest();
        contactRequest.setId(rs.getInt("id"));
        contactRequest.setFullName(rs.getString("full_name"));
        contactRequest.setPhone(rs.getString("phone"));
        contactRequest.setEmail(rs.getString("email"));
        contactRequest.setSubject(rs.getString("subject"));
        contactRequest.setMessage(rs.getString("message"));

        int stoneId = rs.getInt("stone_id");
        contactRequest.setStoneId(rs.wasNull() ? null : stoneId);

        contactRequest.setStatus(rs.getString("status"));
        contactRequest.setCreatedAt(rs.getTimestamp("created_at"));
        return contactRequest;
    }

    public List<ContactRequest> findAll() {
        List<ContactRequest> contactRequests = new ArrayList<>();

        try (
                Connection conn = DBConnectionUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(SELECT_ALL);
                ResultSet rs = ps.executeQuery()
        ) {
            while (rs.next()) {
                contactRequests.add(mapRow(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return contactRequests;
    }

    public ContactRequest findById(int id) throws Exception {
        try (Connection conn = DBConnectionUtil.getConnection()) {
            try (PreparedStatement ps = conn.prepareStatement(SELECT_BY_ID)) {
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    return mapRow(rs);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateStatus(int id, String status) throws Exception {
        try(Connection conn = DBConnectionUtil.getConnection();
        PreparedStatement ps = conn.prepareStatement(UPDATE_STATUS)){
            ps.setString(1, status);
            ps.setInt(2, id);
            return ps.executeUpdate() > 0;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    // ================= DELETE =================
    public boolean deleteById(int id) {
        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(DELETE_BY_ID)) {

            ps.setInt(1, id);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean insert(ContactRequest c) {
        String sql = "INSERT INTO contact_requests(full_name, phone, email, subject, message, stone_id, status) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, c.getFullName());
            ps.setString(2, c.getPhone());
            ps.setString(3, c.getEmail());
            ps.setString(4, c.getSubject());
            ps.setString(5, c.getMessage());

            if (c.getStoneId() == null) {
                ps.setNull(6, java.sql.Types.INTEGER);
            } else {
                ps.setInt(6, c.getStoneId());
            }

            ps.setString(7, c.getStatus());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public int countAll() {
        String sql = "SELECT COUNT(*) FROM contact_requests";
        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

}