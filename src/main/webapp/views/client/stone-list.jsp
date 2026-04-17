<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Danh sách đá</title>
</head>
<body>

<h2>Danh sách đá</h2>

<!-- Search -->
<form method="get" action="stones">
    <input type="hidden" name="action" value="search"/>
    <input type="text" name="keyword" value="${keyword}" placeholder="Tìm theo tên đá"/>
    <button type="submit">Search</button>
</form>

<br/>

<!-- Filter -->
<form method="get" action="stones">
    <input type="hidden" name="action" value="filter"/>
    <input type="text" name="minPrice" value="${minPrice}" placeholder="Giá từ"/>
    <input type="text" name="maxPrice" value="${maxPrice}" placeholder="Giá đến"/>
    <button type="submit">Filter</button>
</form>

<br/>

<!-- List -->
<c:choose>
    <c:when test="${empty stones}">
        <p>Không có dữ liệu</p>
    </c:when>
    <c:otherwise>
        <c:forEach var="s" items="${stones}">
            <p>
                <a href="stone-detail?id=${s.id}">
                        ${s.name}
                </a>
                - ${s.price}
            </p>
        </c:forEach>
    </c:otherwise>
</c:choose>

</body>
</html>