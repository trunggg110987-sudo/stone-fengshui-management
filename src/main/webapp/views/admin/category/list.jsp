<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 4/11/2026
  Time: 2:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<div class="container mt-4">

    <h2 class="page-title text-center">Category List</h2>

    <!-- SEARCH -->
    <div class="card p-3 mb-3">
        <form method="get" action="${pageContext.request.contextPath}/admin/category">
            <div class="row">

                <div class="col-md-4">
                    <input type="text"
                           name="keyword"
                           value="${param.keyword}"
                           class="form-control"
                           placeholder="Search by name">
                </div>

                <div class="col-md-3">
                    <select name="status" class="form-select">
                        <option value="">All status</option>
                        <option value="1" ${param.status == '1' ? 'selected' : ''}>Active</option>
                        <option value="0" ${param.status == '0' ? 'selected' : ''}>Inactive</option>
                    </select>
                </div>

                <div class="col-md-3">
                    <button class="btn btn-primary">Search</button>
                    <a href="${pageContext.request.contextPath}/admin/category"
                       class="btn btn-secondary">Reset</a>
                </div>

                <div class="col-md-2 text-end">
                    <strong>Total: ${total}</strong>
                </div>

            </div>
        </form>
    </div>

    <!-- ADD -->
    <div class="text-end mb-3">
        <a href="${pageContext.request.contextPath}/admin/category?act=create"
           class="btn btn-success">
            + Add Category
        </a>
    </div>

    <!-- TABLE -->
    <div class="table-responsive">
        <table class="table table-bordered table-hover">

            <thead class="table-dark">
            <tr>
                <th>#</th>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Status</th>
                <th width="180">Action</th>
            </tr>
            </thead>

            <tbody>

            <c:forEach var="c" items="${categories}" varStatus="i">

                <!-- row click -->
                <tr class="clickable-row" data-id="${c.id}">

                    <!-- STT -->
                    <td>${i.index + 1}</td>

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

                        <!-- EDIT -->
                        <a class="btn btn-warning btn-sm"
                           href="${pageContext.request.contextPath}/admin/category?act=edit&id=${c.id}">
                            Edit
                        </a>

                        <!-- DELETE -->
                        <form action="${pageContext.request.contextPath}/admin/category"
                              method="post"
                              style="display:inline-block;">

                            <input type="hidden" name="act" value="delete"/>
                            <input type="hidden" name="id" value="${c.id}"/>

                            <button type="button"
                                    class="btn btn-danger btn-sm btn-delete">
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

<!-- SWEET ALERT -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- CLICK ROW DETAIL -->
<script>
    document.querySelectorAll(".clickable-row").forEach(row => {
        row.addEventListener("click", function () {
            const id = this.getAttribute("data-id");

            window.location =
                "${pageContext.request.contextPath}/admin/category?act=detail&id=" + id;
        });
    });
</script>

<!-- DELETE FIX -->
<script>
    document.querySelectorAll(".btn-delete").forEach(btn => {
        btn.addEventListener("click", function (event) {

            event.stopPropagation(); // ✔ QUAN TRỌNG

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