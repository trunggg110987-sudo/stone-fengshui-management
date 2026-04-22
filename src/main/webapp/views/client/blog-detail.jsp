<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container mt-4">

    <!-- BACK BUTTON -->
    <a href="${pageContext.request.contextPath}/blog"
       class="btn btn-secondary mb-3">
        ← Back to Blog
    </a>

    <c:if test="${not empty blog}">

        <div class="card shadow-sm">

            <!-- IMAGE -->
            <c:if test="${not empty blog.image}">
                <img src="${pageContext.request.contextPath}/images/${blog.image}"
                     class="card-img-top"
                     style="max-width:600px; width:100%; height:auto; display:block; margin:auto;">
            </c:if>

            <div class="card-body">

                <!-- TITLE -->
                <h2 class="card-title">${blog.title}</h2>

                <!-- DATE -->
                <p class="text-muted">
                        ${blog.createdAt}
                </p>

                <hr>

                <!-- CONTENT -->
                <div class="mt-3">
                    <p style="white-space: pre-line;">
                            ${blog.content}
                    </p>
                </div>

            </div>

        </div>

    </c:if>

</div>