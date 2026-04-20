<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container mt-4">

    <h3>Giỏ hàng của bạn</h3>

    <c:set var="cart" value="${sessionScope.cart}" />

    <c:if test="${empty cart}">
        <div class="alert alert-info">
            Giỏ hàng đang trống
        </div>
    </c:if>

    <c:if test="${not empty cart}">

        <table class="table table-bordered text-center">

            <tr>
                <th>Ảnh</th>
                <th>Tên</th>
                <th>Giá</th>
                <th>Số lượng</th>
                <th>Tổng</th>
            </tr>

            <c:set var="total" value="0" />

            <c:forEach var="item" items="${cart}">
                <tr>
                    <td>
                        <img src="${pageContext.request.contextPath}/images/${item.image}"
                             width="60">
                    </td>

                    <td>${item.name}</td>
                    <td>
                        <fmt:formatNumber value="${item.price}" type="number"/>
                    </td>
                    <td>${item.quantity}</td>
                    <td>
                        <fmt:formatNumber value="${item.total}" type="number"/>
                    </td>
                </tr>

                <c:set var="total" value="${total + item.total}" />
            </c:forEach>

        </table>

        <h4 class="text-end text-danger">
            Tổng tiền: <fmt:formatNumber value="${total}" type="number"/> VND
        </h4>

    </c:if>

</div>