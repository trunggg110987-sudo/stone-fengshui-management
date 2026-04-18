<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 4/11/2026
  Time: 2:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- ================= BANNER ================= --%>
<!-- ================= BANNER ================= -->
<div id="homeCarousel" class="carousel slide" data-bs-ride="carousel">

    <!-- indicators -->
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#homeCarousel" data-bs-slide-to="0" class="active"></button>
        <button type="button" data-bs-target="#homeCarousel" data-bs-slide-to="1"></button>
    </div>

    <!-- slides -->
    <div class="carousel-inner">

        <div class="carousel-item active">
            <img src="${pageContext.request.contextPath}/images/banner1.jpg"
                 class="d-block w-100 banner-img" alt="">
        </div>

        <div class="carousel-item">
            <img src="${pageContext.request.contextPath}/images/banner2.jpg"
                 class="d-block w-100 banner-img" alt="">
        </div>

    </div>

    <!-- controls -->
    <button class="carousel-control-prev" type="button" data-bs-target="#homeCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </button>

    <button class="carousel-control-next" type="button" data-bs-target="#homeCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
    </button>

</div>
<script>
    document.addEventListener("DOMContentLoaded", function () {

        let slides = document.querySelectorAll(".home-slider img");
        let prev = document.querySelector(".home-slider .prev");
        let next = document.querySelector(".home-slider .next");

        let index = 0;

        function showSlide(i) {
            slides.forEach(s => s.classList.remove("active"));
            slides[i].classList.add("active");
        }

        next.addEventListener("click", function () {
            index = (index + 1) % slides.length;
            showSlide(index);
        });

        prev.addEventListener("click", function () {
            index = (index - 1 + slides.length) % slides.length;
            showSlide(index);
        });

        setInterval(function () {
            index = (index + 1) % slides.length;
            showSlide(index);
        }, 3000);

    });
</script>

<%-- ================= PRODUCT LIST ================= --%>
<div class="container mt-4">

    <h3>Tất cả sản phẩm</h3>
    <hr>

    <c:if test="${empty stones}">
        <div class="text-center text-muted">
            Không có dữ liệu
        </div>
    </c:if>

    <div class="row">
        <c:forEach var="stone" items="${stones}">
            <div class="col-md-3 mb-4">

                <div class="card h-100">

                    <img src="${pageContext.request.contextPath}/images/${stone.imageUrl}"
                         class="card-img-top"
                         style="height:200px; object-fit:cover;">

                    <div class="card-body text-center">

                        <h6>${stone.name}</h6>

                        <p class="text-danger">
                                ${stone.price} VNĐ
                        </p>

                    </div>

                </div>

            </div>
        </c:forEach>
    </div>

    <%-- ================= PAGINATION ================= --%>
    <nav class="mt-4">
        <ul class="pagination justify-content-center">

            <%-- PREV --%>
            <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                <a class="page-link"
                   href="${pageContext.request.contextPath}/home?page=${currentPage - 1}">
                    <
                </a>
            </li>

            <c:set var="start" value="${currentPage - 2}" />
            <c:set var="end" value="${currentPage + 2}" />

            <c:if test="${start < 1}">
                <c:set var="start" value="1"/>
            </c:if>

            <c:if test="${end > totalPages}">
                <c:set var="end" value="${totalPages}"/>
            </c:if>

            <%-- FIRST --%>
            <c:if test="${start > 1}">
                <li class="page-item">
                    <a class="page-link" href="${pageContext.request.contextPath}/home?page=1">1</a>
                </li>
                <li class="page-item disabled"><span class="page-link">...</span></li>
            </c:if>

            <%-- LOOP --%>
            <c:forEach begin="${start}" end="${end}" var="i">
                <li class="page-item ${currentPage == i ? 'active' : ''}">
                    <a class="page-link"
                       href="${pageContext.request.contextPath}/home?page=${i}">
                            ${i}
                    </a>
                </li>
            </c:forEach>

            <%-- LAST --%>
            <c:if test="${end < totalPages}">
                <li class="page-item disabled"><span class="page-link">...</span></li>
                <li class="page-item">
                    <a class="page-link"
                       href="${pageContext.request.contextPath}/home?page=${totalPages}">
                            ${totalPages}
                    </a>
                </li>
            </c:if>

            <%-- NEXT --%>
            <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                <a class="page-link"
                   href="${pageContext.request.contextPath}/home?page=${currentPage + 1}">
                    >
                </a>
            </li>

        </ul>
    </nav>

</div>