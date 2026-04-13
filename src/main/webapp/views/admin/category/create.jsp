<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 4/11/2026
  Time: 2:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="/views/common/admin-header.jsp"/>

<div class="container mt-4">

    <h2>Create Category</h2>

    <form action="${pageContext.request.contextPath}/category?act=create" method="post">

        <input type="hidden" name="act" value="create"/>

        <div class="mb-3">
            <label>Name</label>
            <input type="text" name="name" class="form-control" required>
        </div>

        <div class="mb-3">
            <label>Description</label>
            <textarea name="description" class="form-control"></textarea>
        </div>

        <div class="mb-3">
            <label>Status</label>
            <select name="status" class="form-control">
                <option value="1">Active</option>
                <option value="0">Inactive</option>
            </select>
        </div>

        <button class="btn btn-success">Save</button>
        <a href="${pageContext.request.contextPath}/category"
           class="btn btn-secondary">Back</a>

    </form>

</div>

<jsp:include page="/views/common/admin-footer.jsp"/>
