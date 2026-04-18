<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Admin Dashboard</title>
</head>
<body>

<h2>Dashboard</h2>

<c:if test="${not empty sessionScope.user}">
    <p>Xin chào, <b>${sessionScope.user.fullName}</b>!</p>
    <p>Role: ${sessionScope.user.role}</p>
</c:if>

<hr/>

<h3>Chức năng quản trị</h3>

<ul>
    <li><a href="${pageContext.request.contextPath}/admin/contact">Quản lý liên hệ</a></li>
    <li><a href="${pageContext.request.contextPath}/admin/category">Quản lý danh mục</a></li>
    <li><a href="${pageContext.request.contextPath}/admin/stone">Quản lý đá</a></li>
</ul>

<hr/>

<form method="post" action="${pageContext.request.contextPath}/admin/logout">
    <button type="submit">Đăng xuất</button>
</form>

</body>
</html>