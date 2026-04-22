<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container mt-4">

    <div class="card shadow">

        <!-- HEADER -->
        <div class="card-header bg-dark text-white">
            <h4 class="mb-0">${blog.title}</h4>
        </div>

        <div class="card-body">

            <!-- CREATED DATE -->
            <p class="text-muted">
                <b>Created:</b> ${blog.createdAt}
            </p>

            <!-- IMAGE -->
            <c:if test="${not empty blog.image}">
                <div class="mb-3 text-center">
                    <img src="${pageContext.request.contextPath}/images/${blog.image}"
                         class="img-fluid rounded"
                         style="max-width: 400px;" />
                </div>
            </c:if>

            <hr>

            <!-- CONTENT -->
            <div class="blog-content">
                <p style="white-space: pre-line;">
                    ${blog.content}
                </p>
            </div>

        </div>

        <!-- FOOTER -->
        <div class="card-footer text-end">

            <a class="btn btn-secondary"
               href="${pageContext.request.contextPath}/admin/blog">
                ⬅ Back
            </a>

            <a class="btn btn-warning"
               href="${pageContext.request.contextPath}/admin/blog?action=edit&id=${blog.id}">
                ✏️ Edit
            </a>

        </div>

    </div>

</div>