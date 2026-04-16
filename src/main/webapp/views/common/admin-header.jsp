<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 4/11/2026
  Time: 2:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Fengshui Stone</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/views/css/header-footer.css">
    <!-- Icons -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>

<body>
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">

    <div class="container">

        <a class="navbar-brand fw-bold text-success"
           href="${pageContext.request.contextPath}/home">
            🪨 FengshuiStone
        </a>
        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

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

            <div class="d-flex align-items-center gap-3">

                <a href="#" class="text-dark">
                    <i class="fa fa-search"></i>
                </a>

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