<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- BLOG LIST -->
<div class="container mt-4">

    <h2 class="text-center mb-4">📚 Blog</h2>

    <div class="row">

        <c:forEach var="b" items="${blogs}">

            <!-- BLOG CARD -->
            <div class="col-md-4 mb-4">

                <!-- CLICKABLE CARD -->
                <a href="${pageContext.request.contextPath}/blog/detail?id=${b.id}"
                   style="text-decoration:none; color:inherit;">

                    <div class="card h-100 shadow-sm blog-card">

                        <!-- IMAGE -->
                        <c:if test="${not empty b.image}">
                            <img src="${pageContext.request.contextPath}/images/${b.image}"
                                 class="card-img-top"
                                 style="height:200px; object-fit:cover;">
                        </c:if>

                        <!-- CONTENT -->
                        <div class="card-body">

                            <h5 class="card-title">${b.title}</h5>

                            <p class="card-text text-muted">
                                <c:choose>
                                    <c:when test="${b.content.length() > 120}">
                                        ${b.content.substring(0,120)}...
                                    </c:when>
                                    <c:otherwise>
                                        ${b.content}
                                    </c:otherwise>
                                </c:choose>
                            </p>

                        </div>

                        <!-- FOOTER -->
                        <div class="card-footer text-muted small">
                                ${b.createdAt}
                        </div>

                    </div>

                </a>

            </div>

        </c:forEach>

    </div>

</div>