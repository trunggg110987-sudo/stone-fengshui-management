<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<div class="container py-5">

    <h3 class="fw-bold mb-4">❤️ Danh sách yêu thích</h3>

    <c:set var="favorites" value="${sessionScope.favorites}" />

    <c:if test="${empty favorites}">
        <div class="alert alert-warning shadow-sm">
            Chưa có sản phẩm yêu thích
        </div>
    </c:if>

    <c:if test="${not empty favorites}">

        <div class="row g-4">

            <c:forEach var="item" items="${favorites}">

                <div class="col-12 col-sm-6 col-md-4 col-lg-3">

                    <div class="card h-100 shadow-sm border-0 hover-shadow">

                        <img src="${pageContext.request.contextPath}/images/${item.image}"
                             class="card-img-top"
                             style="height:220px; object-fit:cover;">

                        <div class="card-body text-center">

                            <h6 class="fw-bold">${item.name}</h6>

                            <p class="text-danger fw-semibold mb-2">
                                <fmt:formatNumber value="${item.price}"
                                                  type="number"
                                                  groupingUsed="true"/> VND
                            </p>

                            <form action="${pageContext.request.contextPath}/favorite" method="post">
                                <input type="hidden" name="stoneId" value="${item.stoneId}">
                                <input type="hidden" name="action" value="remove">
                                <button type="submit"> 💔 Bỏ yêu thích </button>
                            </form>

                        </div>

                    </div>

                </div>

            </c:forEach>

        </div>

    </c:if>

</div>