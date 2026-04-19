<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h4 class="font-weight-bold mb-3">Stone List</h4>

<div class="card">
    <div class="container mt-4">

        <h2 class="page-title text-center">Stone List</h2>

        <!-- Search -->
        <div class="card p-3 mb-3">
            <form method="get" action="${pageContext.request.contextPath}/admin/stones">
                <div class="row">

                    <!-- KEYWORD -->
                    <div class="col-md-4">
                        <input type="text"
                               name="keyword"
                               value="${param.keyword}"
                               class="form-control"
                                   placeholder="Search by stone name">
                    </div>


                    <!-- BUTTON -->
                    <div class="col-md-3">
                        <button class="btn btn-primary">
                            Search
                        </button>

                        <a href="${pageContext.request.contextPath}/admin/stones"
                           class="btn btn-secondary">
                            Reset
                        </a>
                    </div>

                    <!-- TOTAL -->
                    <div class="col-md-2 text-end">
                        <strong>Total: ${total}</strong>
                    </div>

                </div>
            </form>
        </div>
        <div class="d-flex justify-content-end mb-3">
            <a href="${pageContext.request.contextPath}/admin/stones?action=create"
               class="btn btn-success">
                + Add Stone
            </a>
        </div>
    </div>




    <div class="card-body p-0">
        <table class="table table-bordered table-hover">

            <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Code</th>
                <th>Price</th>
                <th>Image</th>
                <th>Status</th>
                <th width="180">Action</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="s" items="${stones}">
                <tr>
                    <td>${s.id}</td>
                    <td>${s.name}</td>
                    <td>${s.code}</td>
                    <td> <fmt:formatNumber value="${s.price}" type="number" groupingUsed="true"/> ₫ </td>

                    <td>
                        <img src="${pageContext.request.contextPath}/images/${s.imageUrl}"
                             width="60" height="60" style="object-fit: cover;">
                    </td>

                    <td>
                        <span class="badge ${s.status == 1 ? 'badge-success' : 'badge-secondary'}">
                                ${s.status == 1 ? 'Active' : 'Inactive'}
                        </span>
                    </td>

                    <td>
                        <a href="${pageContext.request.contextPath}/admin/stones?action=edit&id=${s.id}"
                           class="btn btn-warning btn-sm">Edit</a>

                        <a href="${pageContext.request.contextPath}/admin/stones?action=delete&id=${s.id}"
                           class="btn btn-danger btn-sm"
                           onclick="return confirm('Delete this stone?')">
                            Delete
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>

        </table>
    </div>

</div>