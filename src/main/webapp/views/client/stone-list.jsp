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
    <p>
        <a href="stone-detail?id=${s.id}">${s.name}</a> - ${s.price}
    </p>
</c:forEach>
</body>
</html>
