<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 4/11/2026
  Time: 2:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/views/common/admin-header.jsp"/>

<div class="container mt-4">

    <h2>Category List</h2>

    <a href="${pageContext.request.contextPath}/category?act=create"
       class="btn btn-success mb-3">
        + Add Category
    </a>

    <table class="table table-bordered table-hover">

        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        </thead>

        <tbody>

        <c:forEach var="c" items="${categories}">
            <tr>
                <td>${c.id}</td>
                <td>${c.name}</td>
                <td>${c.description}</td>

                <td>
                    <c:choose>
                        <c:when test="${c.status == 1}">
                            Active
                        </c:when>
                        <c:otherwise>
                            Inactive
                        </c:otherwise>
                    </c:choose>
                </td>

                <td>
                    <a class="btn btn-warning btn-sm"
                       href="${pageContext.request.contextPath}/category?act=edit&id=${c.id}">
                        Edit
                    </a>

                    <a class="btn btn-danger btn-sm"
                       href="${pageContext.request.contextPath}/category?act=delete&id=${c.id}"
                       onclick="return confirm('Delete this category?')">
                        Delete
                    </a>
                </td>
            </tr>
        </c:forEach>

        </tbody>

    </table>

</div>

<jsp:include page="/views/common/admin-footer.jsp"/>