<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--<html>--%>
<%--<head>--%>
<%--    <title>Danh sách đá phong thủy</title>--%>

<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">--%>
<%--</head>--%>

<%--<body>--%>

<div class="container mt-5">
    <!-- TITLE -->
    <%--    <h2 class="text-center mb-4">✨ Danh sách đá phong thủy ✨</h2>--%>
<%--                &lt;%&ndash;Search&ndash;%&gt;--%>
<%--                <div class="p-3 bg-light rounded shadow-sm mb-3">--%>
<%--                    <form method="get" action="stones" class="mb-4 text-center">--%>
<%--                        <input type="text"--%>
<%--                               name="keyword"--%>
<%--                               value="${param.keyword}"--%>
<%--                               class="form-control w-50 d-inline"--%>
<%--                               placeholder="🔍 Tìm theo tên đá"/>--%>

<%--                        <button class="btn btn-primary ms-2">--%>
<%--                            Search--%>
<%--                        </button>--%>
<%--                    </form>--%>
<%--                </div>--%>
                <!-- EMPTY CHECK -->
                <c:if test="${empty stones}">
                    <div class="text-center text-muted">
                        Không có dữ liệu
                    </div>
                </c:if>

                <!-- LIST -->
                <div class="row">

                    <c:forEach var="s" items="${stones}">
                        <div class="col-md-4 mb-4">

                            <div class="card shadow-sm h-100">
                                <!-- IMAGE -->
                                <%--<img src="${pageContext.request.contextPath}/${s.imageUrl}"--%>
<%--                                // added by anh--%>
                                <img src="${pageContext.request.contextPath}/images/${s.imageUrl}"
                                     class="card-img-top p-2"
                                     style="height: 200px; object-fit: contain; background-color: #f8f9fa;"
                                     alt="">
                                <div class="card-body d-flex flex-column">

                                    <!-- NAME -->
                                    <h5 class="card-title">${s.name}</h5>

                                    <!-- PRICE -->
                                    <p class="text-danger fw-bold mb-2">
                                        <fmt:formatNumber value="${s.price}" type="number" groupingUsed="true"/> VND
                                    </p>

                                    <!-- STATUS -->
                                    <span class="badge ${s.status == 1 ? 'bg-success' : 'bg-danger'} mb-3">
                                            ${s.status == 1 ? "Còn bán" : "Hết hàng"}
                                    </span>

                                    <!-- DETAIL BUTTON -->
                                    <a href="${pageContext.request.contextPath}/stone-detail?id=${s.id}"
                                       class="btn btn-outline-primary mt-auto">
                                        Xem chi tiết
                                    </a>

                                </div>

                            </div>

                        </div>
                    </c:forEach>
        </div>

        <%--    // phân trang // added by anh--%>
        <nav class="mt-4">
            <ul class="pagination justify-content-center">

                <!-- PREVIOUS -->
                <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                    <a class="page-link"
                       href="stones?page=${currentPage - 1}">
                        <
                    </a>
                </li>

                <!-- PAGE RANGE -->
                <c:set var="start" value="${currentPage - 2}"/>
                <c:set var="end" value="${currentPage + 2}"/>

                <c:if test="${start < 1}">
                    <c:set var="start" value="1"/>
                </c:if>

                <c:if test="${end > totalPages}">
                    <c:set var="end" value="${totalPages}"/>
                </c:if>

                <!-- FIRST PAGE + ... -->
                <c:if test="${start > 1}">
                    <li class="page-item">
                        <a class="page-link" href="stones?page=1">1</a>
                    </li>
                    <li class="page-item disabled">
                        <span class="page-link">...</span>
                    </li>
                </c:if>

                <!-- LOOP PAGE -->
                <c:forEach begin="${start}" end="${end}" var="i">
                    <li class="page-item ${currentPage == i ? 'active' : ''}">
                        <a class="page-link" href="stones?page=${i}">
                                ${i}
                        </a>
                    </li>
                </c:forEach>

                <!-- ... + LAST PAGE -->
                <c:if test="${end < totalPages}">
                    <li class="page-item disabled">
                        <span class="page-link">...</span>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="stones?page=${totalPages}">
                                ${totalPages}
                        </a>
                    </li>
                </c:if>

                <!-- NEXT -->
                <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                    <a class="page-link"
                       href="stones?page=${currentPage + 1}">
                        >
                    </a>
                </li>

            </ul>
        </nav>

    </div>
    <%--</body>--%>
<%--</html>--%>