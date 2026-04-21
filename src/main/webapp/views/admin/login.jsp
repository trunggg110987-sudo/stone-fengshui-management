
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>

    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome-free/css/all.min.css">

    <!-- AdminLTE -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/dist/css/adminlte.min.css">
</head>

<body class="hold-transition login-page">

<div class="login-box">

    <div class="login-logo">
        <i class="fas fa-sign-in-alt"></i> <b>Đăng nhập</b>
    </div>

    <div class="card">
        <div class="card-body login-card-body">

            <p class="login-box-msg">Please sign in</p>

            <form method="post" action="${pageContext.request.contextPath}/admin/login">

                <div class="input-group mb-3">
                    <input type="text"
                           name="username"
                           class="form-control"
                           placeholder="Username"
                           required>
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-user"></span>
                        </div>
                    </div>
                </div>

                <div class="input-group mb-3">
                    <input type="password"
                           name="password"
                           class="form-control"
                           placeholder="Password"
                           required>
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-lock"></span>
                        </div>
                    </div>
                </div>

                <c:if test="${not empty error}">
                    <div class="alert alert-danger">
                            ${error}
                    </div>
                </c:if>

                <button class="btn btn-primary btn-block">
                    Sign in
                </button>

            </form>

        </div>
    </div>

</div>

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/assets/plugins/jquery/jquery.min.js"></script>

<!-- Bootstrap -->
<script src="${pageContext.request.contextPath}/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- AdminLTE -->
<script src="${pageContext.request.contextPath}/assets/dist/js/adminlte.min.js"></script>

</body>
</html>