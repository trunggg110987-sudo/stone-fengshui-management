<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 4/11/2026
  Time: 2:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="contact-banner">
    <img src="${pageContext.request.contextPath}/images/contact-banner.jpg"
         alt="Contact Banner"
         class="img-fluid w-100"
         style="max-height: 300px; object-fit: cover; border-radius: 10px;">
</div>
<div class="container py-5">

    <h3 class="text-center mb-2">BẠN ĐIỀN THÔNG TIN THEO FORM NHÉ!</h3>
    <p class="text-center text-muted mb-4">Please fill out the form</p>

    <form action="${pageContext.request.contextPath}/contact" method="post">

        <div class="row g-3">

            <!-- LEFT SIDE -->
            <div class="col-md-6">

                <input name="fullName"
                       class="form-control"
                       placeholder="Tên của bạn"
                       required>

                <input name="email"
                       type="email"
                       class="form-control mt-3"
                       placeholder="Địa chỉ email của bạn"
                       required>

                <input name="phone"
                       class="form-control mt-3"
                       placeholder="Số điện thoại"
                       required>

            </div>

            <!-- RIGHT SIDE -->
            <div class="col-md-6">

                <textarea name="message"
                          class="form-control"
                          style="height: 100%; min-height: 180px;"
                          placeholder="Nội dung"
                          required></textarea>

            </div>

        </div>

        <!-- SUBJECT -->
        <input name="subject"
               class="form-control mt-3"
               placeholder="Tiêu đề liên hệ"
               required>

        <!-- STONE (optional) -->
        <div class="mt-3">
            <label class="form-label">Chọn sản phẩm</label>

            <!-- KHÔNG CHỌN -->
            <div class="form-check border p-2 rounded mb-2">
                <input class="form-check-input" type="radio" name="chooseStone" value="none" checked
                       onclick="toggleStoneList(false)">
                <label class="form-check-label">Không chọn sản phẩm</label>
            </div>

            <!-- CHỌN SẢN PHẨM -->
            <div class="form-check border p-2 rounded mb-2">
                <input class="form-check-input" type="radio" name="chooseStone" value="yes"
                       onclick="toggleStoneList(true)">
                <label class="form-check-label">Chọn sản phẩm</label>
            </div>

            <!-- LIST STONE -->
            <div id="stoneList" style="display:none; margin-top:10px;">
                <c:forEach var="stone" items="${stones}">
                    <label class="form-check border p-2 rounded mb-2 d-flex align-items-center">

                        <input type="radio" name="stoneId" value="${stone.id}" class="form-check-input me-2">

                        <c:choose>
                            <c:when test="${stone.imageUrl.startsWith('upload_')}">
                                <img src="${pageContext.request.contextPath}/uploads/${stone.imageUrl.substring(7)}"
                                     style="width:60px;height:60px;object-fit:cover;border-radius:8px;margin-right:10px;">
                            </c:when>

                            <c:otherwise>
                                <img src="${pageContext.request.contextPath}/images/${stone.imageUrl}"
                                     style="width:60px;height:60px;object-fit:cover;border-radius:8px;margin-right:10px;">
                            </c:otherwise>
                        </c:choose>

                        <div>
                            <b>${stone.name}</b><br>
                            <small>ID: ${stone.id}</small>
                        </div>

                    </label>
                </c:forEach>
            </div>
        </div>

        <!-- BUTTON -->
        <button type="submit"
                class="btn btn-primary w-100 mt-4">
            Gửi thông báo
        </button>

    </form>

</div>
<script>
    function toggleStoneList(show) {
        document.getElementById("stoneList").style.display = show ? "block" : "none";
    }
</script>