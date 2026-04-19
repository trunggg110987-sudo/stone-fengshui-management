<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Chi tiết đá</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

<div class="container mt-5">

    <!-- BACK BUTTON -->
    <c:choose>

    <%--thêm nút quay về trang home sau khi xem detail ở trang home add by anh --%>
        <c:when test="${param.source == 'home'}">
             <a href="${pageContext.request.contextPath}/home?page=${param.page}#product-list"
               class="btn btn-secondary">
                ← Quay lại
            </a>
        </c:when>

        <c:otherwise>
            <a href="${pageContext.request.contextPath}/stones"
               class="btn btn-secondary">
                ← Quay lại
            </a>
        </c:otherwise>

    </c:choose>

    <c:choose>

        <c:when test="${stone != null}">

            <div class="row">

                <!-- IMAGE -->
                <div class="col-md-5">
                    <div class="card shadow-sm">
                        <img src="${pageContext.request.contextPath}/images/${stone.imageUrl}"
                             class="card-img-top"
                             style="height: 350px; object-fit: contain; background-color: #f8f9fa;"
                             alt="">
                    </div>
                </div>

                <!-- INFO -->
                <div class="col-md-7">

                    <h2 class="mb-3">${stone.name}</h2>

                    <!-- PRICE -->
                    <h4 class="text-danger fw-bold mb-3">
                        <fmt:formatNumber value="${stone.price}" type="number" groupingUsed="true"/> VND
                    </h4>

                    <!-- STATUS -->
                    <p>
                        <span class="badge ${stone.status == 1 ? 'bg-success' : 'bg-danger'}">
                                ${stone.status == 1 ? "Còn bán" : "Tạm thời hết hàng"}
                        </span>
                    </p>

                    <!-- ID -->
                    <p><strong>Mã sản phẩm:</strong> #${stone.id}</p>

                    <!-- DESCRIPTION -->
                    <div class="mt-4">
                        <h5>Mô tả sản phẩm</h5>
                        <p class="text-muted">
                                ${stone.description}
                        </p>
                    </div>

                    <!-- ACTION -->
                    <div class="mt-4">
                        <button class="btn btn-primary me-2">
                            🛒 Mua ngay
                        </button>

                        <button class="btn btn-outline-secondary">
                            ❤️ Yêu thích
                        </button>
                    </div>

                </div>

            </div>

        </c:when>

        <c:otherwise>
            <div class="alert alert-danger text-center">
                Không tìm thấy dữ liệu đá
            </div>
        </c:otherwise>

    </c:choose>

</div>

</body>
</html>