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

<jsp:include page="/views/common/admin-header.jsp"/>

<div class="container mt-4">

    <h2 class="page-title text-center">Category List</h2>

    <div class="text-end mb-3">
        <a href="${pageContext.request.contextPath}/category?act=create"
           class="btn btn-success">
            + Add Category
        </a>
    </div>

    <div class="table-responsive">
        <table class="table table-bordered table-hover">

            <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Status</th>
                <th width="180">Action</th>
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
                                <span class="badge bg-success">Active</span>
                            </c:when>
                            <c:otherwise>
                                <span class="badge bg-secondary">Inactive</span>
                            </c:otherwise>
                        </c:choose>
                    </td>

                    <td>
                        <a class="btn btn-warning btn-sm"
                           href="${pageContext.request.contextPath}/category?act=edit&id=${c.id}">
                            Edit
                        </a>

                        <form action="${pageContext.request.contextPath}/category?act=delete&id=${c.id}"
                              method="post"
                              style="display:inline-block;"
                              class="form-delete">

                            <input type="hidden" name="act" value="delete"/>
                            <input type="hidden" name="id" value="${c.id}"/>

                            <button type="button" class="btn btn-danger btn-sm btn-delete">
                                Delete
                            </button>
                        </form>
                    </td>
                </tr>
            </c:forEach>

            </tbody>

        </table>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
    document.querySelectorAll(".btn-delete").forEach(btn => {
        btn.addEventListener("click", function () {

            const form = this.closest("form");

            Swal.fire({
                title: "Delete this category?",
                text: "This action cannot be undone",
                icon: "warning",
                showCancelButton: true,
                confirmButtonText: "Delete",
                cancelButtonText: "Cancel",
                confirmButtonColor: "#dc3545",
                cancelButtonColor: "#6c757d"
            }).then((result) => {
                if (result.isConfirmed) {
                    form.submit();
                }
            });

        });
    });
</script>

<jsp:include page="/views/common/admin-footer.jsp"/>