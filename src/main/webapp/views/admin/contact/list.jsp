<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Quản lý liên hệ</title>
</head>
<body>

<jsp:include page="/views/common/admin-header.jsp" />
<jsp:include page="/views/common/admin-sidebar.jsp" />

<h2>Danh sách liên hệ</h2>

<c:choose>
    <c:when test="${empty contactRequests}">
        <p>Chưa có dữ liệu liên hệ.</p>
    </c:when>
    <c:otherwise>
        <table border="1" cellpadding="8" cellspacing="0">
            <thead>
            <tr>
                <th>ID</th>
                <th>Họ tên</th>
                <th>Số điện thoại</th>
                <th>Email</th>
                <th>Tiêu đề</th>
                <th>Nội dung</th>
                <th>Stone ID</th>
                <th>Trạng thái</th>
                <th>Ngày tạo</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${contactRequests}">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.fullName}</td>
                    <td>${item.phone}</td>
                    <td>${item.email}</td>
                    <td>${item.subject}</td>
                    <td>${item.message}</td>
                    <td>${item.stoneId}</td>
                    <td>${item.status}</td>
                    <td>${item.createdAt}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:otherwise>
</c:choose>

<jsp:include page="/views/common/admin-footer.jsp" />

</body>
</html>