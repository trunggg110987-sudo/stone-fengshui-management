<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<div class="container py-5">

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3 class="fw-bold">🛒 Giỏ hàng của bạn</h3>
    </div>

    <c:set var="cart" value="${sessionScope.cart}" />

    <c:if test="${empty cart}">
        <div class="alert alert-info shadow-sm">
            Giỏ hàng đang trống
        </div>
    </c:if>

    <c:if test="${not empty cart}">

        <div class="card shadow-sm border-0">
            <div class="card-body p-0">

                <div class="table-responsive">
                    <table class="table table-hover align-middle mb-0 text-center">

                        <thead class="table-dark">
                        <tr>
                            <th>Ảnh</th>
                            <th>Tên sản phẩm</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Tổng</th>
                            <th>Hành động</th>
                        </tr>
                        </thead>

                        <tbody>

                        <c:set var="total" value="0" />

                        <c:forEach var="item" items="${cart}">
                            <tr>

                                <td>
                                    <c:choose>
                                        <c:when test="${item.image.startsWith('upload_')}">
                                            <img src="${pageContext.request.contextPath}/uploads/${item.image.substring(7)}"
                                                 class="rounded"
                                                 width="70" height="70"
                                                 style="object-fit: cover;" alt="">
                                        </c:when>

                                        <c:otherwise>
                                            <img src="${pageContext.request.contextPath}/images/${item.image}"
                                                 class="rounded"
                                                 width="70" height="70"
                                                 style="object-fit: cover;" alt="">
                                        </c:otherwise>
                                    </c:choose>
                                </td>

                                
                                <td class="fw-semibold">${item.name}</td>

                                <td class="text-primary">
                                    <fmt:formatNumber value="${item.price}" type="number"/> VND
                                </td>

                                <td>
                                    <span class="badge bg-secondary fs-6">
                                            ${item.quantity}
                                    </span>
                                </td>

                                <td class="text-danger fw-bold">
                                    <fmt:formatNumber value="${item.total}" type="number"/> VND
                                </td>

                                <td>
                                    <form action="${pageContext.request.contextPath}/cart" method="post">
                                        <input type="hidden" name="stoneId" value="${item.stoneId}">
                                        <input type="hidden" name="action" value="remove">

                                        <button type="submit" class="btn btn-danger btn-sm">
                                            Xóa
                                        </button>
                                    </form>
                                </td>

                            </tr>

                            <c:set var="total" value="${total + item.total}" />
                        </c:forEach>


                        </tbody>

                    </table>
                </div>

            </div>
        </div>

        <!-- TOTAL -->
        <div class="text-end mt-4">
            <div class="card shadow-sm border-0 d-inline-block px-4 py-3">
                <h5 class="mb-0">
                    Tổng tiền:
                    <span class="text-danger fw-bold">
                        <fmt:formatNumber value="${total}" type="number"/> VND
                    </span>
                </h5>
            </div>
        </div>

    </c:if>

</div>