<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">

    <div class="container-fluid px-2">
        <!-- LOGO -->
        <a class="navbar-brand d-flex align-items-center gap-2 ps-1"
           href="${pageContext.request.contextPath}/home">
            <img src="${pageContext.request.contextPath}/images/logo.png"
                 alt="FengshuiStone"
                 class="logo-img">
            <span class="logo-text">FengshuiStone</span>
        </a>

        <!-- MOBILE TOGGLER -->
        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- MENU -->
        <div class="collapse navbar-collapse" id="navbarNav">

            <ul class="navbar-nav mx-auto">

                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/home">
                        Home
                    </a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle"
                       href="#"
                       role="button"
                       data-bs-toggle="dropdown">
                        Stones | Category
                    </a>

                    <ul class="dropdown-menu">
                        <c:forEach var="c" items="${categories}">
                            <li>
                                <a class="dropdown-item"
                                   href="${pageContext.request.contextPath}/stones?categoryId=${c.id}">
                                        ${c.name}
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#">
                        Blog
                    </a>
                </li>

                <a class="nav-link"
                   href="${pageContext.request.contextPath}/contact">
                    Contact Us
                </a>

            </ul>

            <!-- ICONS -->
            <div class="d-flex align-items-center gap-3">

                <!-- SEARCH -->
                <form class="d-flex me-3" method="get" action="${pageContext.request.contextPath}/stones">
                    <input type="text"
                           name="keyword"
                           value="${param.keyword}"
                           class="form-control form-control-sm"
                           placeholder="Search stones...">

                    <button class="btn btn-sm btn-primary ms-2">
                        Search
                    </button>
                </form>

                <a href="${pageContext.request.contextPath}/favorite/view"
                   class="text-dark position-relative">
                    <i class="fa fa-heart"></i>
                    <c:if test="${not empty sessionScope.favorites}">
                    <span class="badge bg-danger position-absolute top-0 start-100 translate-middle">
                        ${sessionScope.favorites.size()}
                    </span>
                    </c:if>
                </a>

                <a href="${pageContext.request.contextPath}/cart/view"
                   class="text-dark position-relative">
                    <i class="fa fa-shopping-cart"></i>
                    <c:if test="${not empty sessionScope.cart}">
                        <span class="badge bg-danger position-absolute top-0 start-100 translate-middle">
                            ${sessionScope.cart.size()}
                        </span>
                    </c:if>
                </a>


                <c:choose>


                    <c:when test="${empty sessionScope.user}">
                        <a href="#" id="loginBtn"
                           class="text-dark">
                            <i class="fa fa-user"></i>
                        </a>
                    </c:when>


                    <c:otherwise>

                        <div class="dropdown">

                            <a class="text-dark dropdown-toggle"
                               href="#"

                               role="button"
                               data-bs-toggle="dropdown"
                               aria-expanded="false">

                                <i class="fa fa-user"></i>
                            </a>

                            <div class="dropdown-menu dropdown-menu-end p-3">

                                <div class="mb-2">
                                    <strong>${sessionScope.user.username}</strong><br>

                                    <small class="text-muted">
                                        Role: ${sessionScope.user.role}
                                    </small>
                                </div>

                                <div class="dropdown-divider"></div>

                                <!-- ADMIN DASHBOARD -->
                                <c:if test="${sessionScope.user != null && sessionScope.user.role eq 'ADMIN'}">
                                    <a class="dropdown-item"
                                       href="${pageContext.request.contextPath}/admin/dashboard">
                                        Dashboard
                                    </a>
                                </c:if>

                                <!-- LOGOUT -->
                                <a class="dropdown-item text-danger"
                                   href="${pageContext.request.contextPath}/logout">
                                    Logout
                                </a>

                            </div>
                        </div>

                    </c:otherwise>

                </c:choose>

            </div>

        </div>

    </div>

</nav>
<!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
    document.addEventListener("DOMContentLoaded", function() {

        const loginBtn = document.getElementById("loginBtn");

        if(loginBtn){
            loginBtn.addEventListener("click", function(e) {
                e.preventDefault();

                Swal.fire({
                    title: 'Đăng nhập',
                    width: 500,
                    html: `
                    <iframe
                        src="${pageContext.request.contextPath}/admin/login"
                        style="width:100%; height:420px; border:none;">
                    </iframe>
                `,
                    showConfirmButton: false,
                    showCloseButton: true
                });

            });
        }

    });
</script>