<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Danh sách đá </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">

    <!-- TITLE -->
    <h2 class="text-center mb-4">✨ Danh sách đá phong thủy ✨</h2>

    <!-- SEARCH -->
    <form method="get" action="stones" class="mb-4 text-center">
        <input type="text" name="keyword"
               value="${param.keyword}"
               class="form-control w-50 d-inline"
               placeholder="🔍 Tìm theo tên đá"/>
        <button class="btn btn-primary ms-2">Search</button>
    </form>

    <!-- LIST -->
    <div class="row">

        <c:forEach var="s" items="${stones}">
            <div class="col-md-4 mb-4">

                <div class="card shadow-sm h-100">

                    <!-- IMAGE -->
                    <img src="${pageContext.request.contextPath}/${s.imageUrl}"
                         class="card-img-top p-2"
                         style="height: 200px; object-fit: contain; background-color: #f8f9fa;">

                    <div class="card-body d-flex flex-column">

                        <!-- NAME -->
                        <h5 class="card-title">${s.name}</h5>

                        <!-- PRICE -->
                        <p class="text-danger fw-bold mb-2">
                                ${s.price} VND
                        </p>

                        <!-- STATUS -->
                        <span class="badge ${s.status == 1 ? 'bg-success' : 'bg-danger'} mb-3">
                                ${s.status == 1 ? "Còn bán" : "Hết hàng"}
                        </span>

                        <!-- BUTTON -->
                        <a href="${pageContext.request.contextPath}/stone-detail?id=${s.id}"
                           class="btn btn-outline-primary mt-auto">
                            Xem chi tiết
                        </a>
                    </div>

                </div>

            </div>
        </c:forEach>

    </div>

</div>
</body>
</html>
