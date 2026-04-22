<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/views/css/blog.css">
<div class="container mt-4">

    <h2 class="page-title text-center">📚 Blog List</h2>

    <!-- ADD BUTTON -->
    <div class="text-end mb-3">
        <a href="${pageContext.request.contextPath}/admin/blog?action=create"
           class="btn btn-success">
            + Add Blog
        </a>
    </div>

    <!-- TABLE -->
    <div class="table-responsive">
        <table class="table table-bordered table-hover">

            <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Image</th>
                <th>Created</th>
                <th style="width: 220px;">Action</th>
            </tr>
            </thead>

            <tbody>

            <c:forEach var="b" items="${blogs}" varStatus="i">

                <tr class="clickable-row" data-id="${b.id}">
                    <td>${b.id}</td>
                    <td>${b.title}</td>

                    <td>
                        <c:if test="${not empty b.image}">
                            <img src="${b.image}" width="80"/>
                        </c:if>
                    </td>

                    <td>${b.createdAt}</td>

                    <td>

                        <!-- VIEW -->
                        <a class="btn btn-info btn-sm"
                           href="${pageContext.request.contextPath}/admin/blog?action=detail&id=${b.id}">
                            View
                        </a>

                        <!-- EDIT -->
                        <a class="btn btn-warning btn-sm"
                           href="${pageContext.request.contextPath}/admin/blog?action=edit&id=${b.id}">
                            Edit
                        </a>

                        <!-- DELETE -->
                        <form action="${pageContext.request.contextPath}/admin/blog"
                              method="get"
                              style="display:inline-block;">

                            <input type="hidden" name="action" value="delete"/>
                            <input type="hidden" name="id" value="${b.id}"/>

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

<!-- CLICK ROW → DETAIL -->
<script>
    document.querySelectorAll(".clickable-row").forEach(row => {
        row.addEventListener("click", function () {
            const id = this.getAttribute("data-id");

            window.location =
                "${pageContext.request.contextPath}/admin/blog?action=detail&id=" + id;
        });
    });
</script>

<!-- DELETE CONFIRM -->
<script>
    document.querySelectorAll(".btn-delete").forEach(btn => {
        btn.addEventListener("click", function (event) {

            event.stopPropagation(); // tránh click row

            const form = this.closest("form");

            Swal.fire({
                title: "Delete this blog?",
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