<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container mt-4">

    <h3>❤️ Danh sách yêu thích</h3>

    <c:set var="favorites" value="${sessionScope.favorites}" />

    <c:if test="${empty favorites}">
        <div class="alert alert-warning">
            Chưa có sản phẩm yêu thích
        </div>
    </c:if>

    <c:if test="${not empty favorites}">

        <div class="row">

            <c:forEach var="item" items="${favorites}">

                <div class="col-md-3 mb-4">

                    <div class="card h-100">

                        <!-- IMAGE -->
                        <img src="${pageContext.request.contextPath}/images/${item.image}"
                             class="card-img-top"
                             style="height:200px; object-fit:cover;">

                        <div class="card-body text-center">

                            <!-- NAME -->
                            <h6>${item.name}</h6>

                            <!-- PRICE -->
                            <p class="text-danger">
                                <fmt:formatNumber value="${item.price}"
                                                  type="number"
                                                  groupingUsed="true"/> VND
                            </p>

                        </div>

                    </div>

                </div>

            </c:forEach>

        </div>

    </c:if>

</div>