<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Danh sách đá </title>
</head>
<body>
<h2>Danh sách đá</h2>
<form method="get" action="stones">
    <input type="text" name="keyword" value="${param.keyword}" placeholder="Tìm theo tên đá"/>
    <button type="submit">Search</button>
</form>
<c:forEach var="s" items="${stones}">
    <div>
        <p>ID: ${s.id}</p>
        <p>Tên: ${s.name}</p>
        <p>Giá: ${s.price}</p>

        <a href="${pageContext.request.contextPath}/stone-detail?id=${s.id}">Xem chi tiết</a>
    </div>
</c:forEach>
</body>
</html>
