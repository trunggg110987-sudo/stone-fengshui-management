<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Chi tiết đá</h2>

<p>ID: ${stone.id}</p>
<p>Tên: ${stone.name}</p>
<p>Giá: ${stone.price}</p>
<p>Trạng thái:
    <c:choose>
        <c:when test="${stone.status == 1}">
            Còn bán
        </c:when>
        <c:otherwise>
            Tạm thời hết hàng
        </c:otherwise>
    </c:choose>
</p>
<p>Thông tin: ${stone.description}</p>
</body>
</html>
