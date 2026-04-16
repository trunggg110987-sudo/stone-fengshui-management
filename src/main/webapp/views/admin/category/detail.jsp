<%--
  Created by IntelliJ IDEA.
  User: Welcome to Windows10
  Date: 04/17/2026
  Time: 4:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container mt-4">
    <h3>Category Detail</h3>

    <table class="table table-bordered">
        <tr>
            <th>ID</th>
            <td>${category.id}</td>
        </tr>
        <tr>
            <th>Name</th>
            <td>${category.name}</td>
        </tr>
        <tr>
            <th>Description</th>
            <td>${category.description}</td>
        </tr>
        <tr>
            <th>Status</th>
            <td>${category.status == 1 ? "Active" : "Inactive"}</td>
        </tr>
    </table>

    <a href="${pageContext.request.contextPath}/category"
       class="btn btn-secondary">
        Back
    </a>
</div>
