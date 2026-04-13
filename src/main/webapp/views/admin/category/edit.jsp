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

    <h2>Edit Category</h2>

    <form action="${pageContext.request.contextPath}/category?act=update&id=${category.id}" method="post">

        <input type="hidden" name="act" value="update"/>
        <input type="hidden" name="id" value="${category.id}"/>

        <div class="mb-3">
            <label>Name</label>
            <input type="text" name="name" class="form-control"
                   value="${category.name}" required>
        </div>

        <div class="mb-3">
            <label>Description</label>
            <textarea name="description" class="form-control">${category.description}</textarea>
        </div>

        <div class="mb-3">
            <label>Status</label>
            <select name="status" class="form-control">

                <option value="1"
                        <c:if test="${category.status == 1}">selected</c:if>>
                    Active
                </option>

                <option value="0"
                        <c:if test="${category.status == 0}">selected</c:if>>
                    Inactive
                </option>

            </select>
        </div>

        <button class="btn btn-primary">Update</button>
        <a href="${pageContext.request.contextPath}/category"
           class="btn btn-secondary">Back</a>

    </form>

</div>

<jsp:include page="/views/common/admin-footer.jsp"/>