package com.example.stonefengshuimanagement.service;

import com.example.stonefengshuimanagement.dao.ContactRequestDAO;
import com.example.stonefengshuimanagement.model.entity.ContactRequest;

import java.sql.SQLException;
import java.util.List;

public class ContactService {
    private final ContactRequestDAO dao = new ContactRequestDAO();

    public boolean submitContact(ContactRequest request) throws SQLException {
        request.setStatus("NEW");
        return dao.insert(request);
    }

    public List<ContactRequest> getAll() {
        return dao.findAll();
    }

    public boolean updateStatus(int id, String status) throws Exception {
        return dao.updateStatus(id, status);
    }

    public boolean delete(int id) {
        return dao.deleteById(id);
    }
}
