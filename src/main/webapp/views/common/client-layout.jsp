<%--
  Created by IntelliJ IDEA.
  User: Welcome to Windows10
  Date: 04/18/2026
  Time: 2:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <!-- TITLE -->
    <title>${pageTitle != null ? pageTitle : "Fengshui Stone"}</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- ================= BOOTSTRAP ================= -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- ================= FONT AWESOME ================= -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <!-- ================= BASE CSS ================= -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/views/css/base.css">

    <!-- ================= HEADER + FOOTER CSS ================= -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/views/css/header-footer.css">

    <!-- ================= PAGE CSS (OPTIONAL) ================= -->
    <c:if test="${not empty pageCss}">
        <link rel="stylesheet"
              href="${pageContext.request.contextPath}${pageCss}">
    </c:if>

</head>

<body>

<!-- ================= HEADER ================= -->
<jsp:include page="/views/common/client-header.jsp"/>


<!-- ================= MAIN CONTENT ================= -->
<div class="container-fluid p-0 overflow-hidden">

    <jsp:include page="${contentPage}"/>

</div>


<!-- ================= FOOTER ================= -->
<jsp:include page="/views/common/client-footer.jsp"/>


<!-- ================= BOOTSTRAP JS ================= -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>