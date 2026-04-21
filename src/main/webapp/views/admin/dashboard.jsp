<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>

    <!-- AdminLTE CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/dist/css/adminlte.min.css">

    <!-- FontAwesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome-free/css/all.min.css">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/bootstrap/css/bootstrap.min.css">
</head>

<body class="hold-transition sidebar-mini">

<div class="wrapper">

    <!-- NAVBAR -->
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">

        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#">
                    <i class="fas fa-bars"></i>
                </a>
            </li>

            <li class="nav-item d-none d-sm-inline-block">
                <span class="nav-link font-weight-bold">Dashboard</span>
            </li>
        </ul>

        <ul class="navbar-nav ml-auto">
            <c:if test="${not empty sessionScope.user}">
                <li class="nav-item">
                    <span class="nav-link">
                        Xin chào, <b>${sessionScope.user.fullName}</b>
                        &nbsp; | &nbsp;
                        Role:
                        <span class="badge badge-info">
                                ${sessionScope.user.role}
                        </span>
                    </span>
                </li>
            </c:if>
        </ul>

    </nav>

    <!-- SIDEBAR -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">

        <a href="${pageContext.request.contextPath}/admin/dashboard" class="brand-link">
            <span class="brand-text font-weight-light">Stone Admin</span>
        </a>

        <div class="sidebar d-flex flex-column" style="height: 100%;">

            <nav class="mt-2">

                <ul class="nav nav-pills nav-sidebar flex-column">

                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/home" class="nav-link">
                            <i class="nav-icon fas fa-home"></i>
                            <p>Home</p>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/admin/contact" class="nav-link">
                            <i class="nav-icon fas fa-envelope"></i>
                            <p>Liên hệ</p>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/admin/category" class="nav-link">
                            <i class="nav-icon fas fa-list"></i>
                            <p>Danh mục</p>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/admin/stones" class="nav-link">
                            <i class="nav-icon fas fa-gem"></i>
                            <p>Đá phong thủy</p>
                        </a>
                    </li>

                </ul>
            </nav>

            <!-- LOGOUT -->
            <div class="mt-auto p-3">
                <form method="post" action="${pageContext.request.contextPath}/logout">
                    <button type="submit" class="btn btn-danger btn-block">
                        <i class="fas fa-sign-out-alt"></i> Đăng xuất
                    </button>
                </form>
            </div>


        </div>

    </aside>

    <!-- CONTENT -->
    <div class="content-wrapper p-3">

        <section class="content">

            <!-- TITLE -->
            <div class="mb-3">
                <h4 class="font-weight-bold">Dashboard Thống kê </h4>
                <hr>
            </div>

            <!-- ================= STATISTICS ================= -->
            <div class="row">

                <!-- CATEGORIES -->
                <div class="col-md-4">
                    <div class="small-box bg-info">
                        <div class="inner">
                            <h3>${totalCategories}</h3>
                            <p>Categories</p>
                        </div>
                        <div class="icon">
                            <i class="fas fa-list"></i>
                        </div>
                    </div>
                </div>

                <!-- STONES -->
                <div class="col-md-4">
                    <div class="small-box bg-success">
                        <div class="inner">
                            <h3>${totalStones}</h3>
                            <p>Stones</p>
                        </div>
                        <div class="icon">
                            <i class="fas fa-gem"></i>
                        </div>
                    </div>
                </div>

                <!-- CONTACTS -->
                <div class="col-md-4">
                    <div class="small-box bg-warning">
                        <div class="inner">
                            <h3>${totalContacts}</h3>
                            <p>Contacts</p>
                        </div>
                        <div class="icon">
                            <i class="fas fa-envelope"></i>
                        </div>
                    </div>
                </div>

            </div>

        </section>

    </div>

</div>

<!-- JS -->
<script src="${pageContext.request.contextPath}/assets/plugins/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/dist/js/adminlte.min.js"></script>

</body>
</html>