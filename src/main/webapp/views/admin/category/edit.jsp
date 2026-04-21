<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 4/11/2026
  Time: 2:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/views/css/category.css">

<%--<jsp:include page="/views/common/admin-header.jsp"/>--%>

<div class="container mt-4">

    <h2 class="page-title">Edit Category</h2>

    <div class="form-container">

        <form action="${pageContext.request.contextPath}/admin/category?act=update&id=${category.id}" method="post">

            <input type="hidden" name="act" value="update"/>
            <input type="hidden" name="id" value="${category.id}"/>

            <div class="mb-3">
                <label class="form-label">Name</label>
                <input type="text" name="name" class="form-control"
                       value="${category.name}" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Description</label>
                <textarea name="description" class="form-control">${category.description}</textarea>
            </div>

            <div class="mb-3">
                <label class="form-label">Status</label>
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
            <div class="d-flex gap-2">
                <button class="btn btn-success flex-fill">
                    Save
                </button>

                <a href="${pageContext.request.contextPath}/admin/category"
                   class="btn btn-secondary flex-fill"
                   id="btnBack">
                    Back
                </a>
            </div>
        </form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    document.getElementById("btnBack").addEventListener("click", function (e) {
        e.preventDefault();

        let url = this.getAttribute("href");

        Swal.fire({
            title: "Exit without saving?",
            icon: "warning",
            showCancelButton: true,
            confirmButtonText: "Exit",
            cancelButtonText: "Stay",
            confirmButtonColor: "#dc3545",
            cancelButtonColor: "#6c757d",
            reverseButtons: true
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = url;
            }
        });
    });
</script>
<%--<jsp:include page="/views/common/dashboard-home.jsp"/>--%>