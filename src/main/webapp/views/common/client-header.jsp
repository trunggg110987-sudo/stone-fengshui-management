<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 4/11/2026
  Time: 2:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                    <ul class="dropdown-menu">
                        <c:forEach var="c" items="${categories}">
                            <li>
                                <a class="dropdown-item"
                                   href="${pageContext.request.contextPath}/stone?categoryId=${c.id}">
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

                <li class="nav-item">
                    <a class="nav-link" href="#">
                        About
                    </a>
                </li>

            </ul>

            <!-- ICONS -->
            <div class="d-flex align-items-center gap-3">

<%--                <a href="#" class="text-dark">--%>
<%--                    <i class="fa fa-search"></i>--%>
<%--                </a>--%>
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

                <a href="#" class="text-dark">
                    <i class="fa fa-heart"></i>
                </a>

                <a href="#" class="text-dark">
                    <i class="fa fa-shopping-cart"></i>
                </a>

                <a href="${pageContext.request.contextPath}/login" class="text-dark">
                    <i class="fa fa-user"></i>
                </a>

            </div>

        </div>

    </div>

</nav>
