<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Chi tiết đá</title>
</head>
<body>

<h2>Chi tiết đá</h2>

<c:choose>
    <c:when test="${stone != null}">
        <p><b>ID:</b> ${stone.id}</p>
        <p><b>Tên:</b> ${stone.name}</p>
        <p><b>Giá:</b> ${stone.price}</p>

        <c:if test="${not empty stone.imageUrl}">
            <p>
                <img src="${stone.imageUrl}" alt="${stone.name}" width="200"/>
            </p>
        </c:if>
    </c:when>

    <c:otherwise>
        <p>Không tìm thấy dữ liệu</p>
    </c:otherwise>
</c:choose>

<br/>
<a href="stones">← Quay lại danh sách</a>

</body>
</html>