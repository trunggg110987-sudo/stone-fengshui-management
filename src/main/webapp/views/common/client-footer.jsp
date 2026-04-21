<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 4/11/2026
  Time: 2:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<footer class="footer mt-5">
    <div class="container py-4">

        <div class="row">

            <!-- ABOUT -->
            <div class="col-md-4">
                <h5 class="footer-title">Fengshui Stone</h5>
                <p class="footer-text">
                    Hệ thống quản lý và bán đá phong thủy chất lượng cao.
                    Mang lại may mắn và tài lộc.
                </p>
            </div>

            <!-- LINKS -->
            <div class="col-md-4">
                <h5 class="footer-title">Quick Links</h5>
                <ul class="footer-links">
                    <li>
                        <a href="${pageContext.request.contextPath}/home">Home</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/stone">
                            Stones | Category
                        </a>
                    </li>
                    <li><a href="#">Blog</a></li>
                    <li><a href="#">About</a></li>
                </ul>
            </div>

            <!-- CONTACT -->
            <div class="col-md-4">
                <h5 class="footer-title">Contact</h5>
                <p class="footer-text">
                    Email: <br>
                    Phone:
                </p>
            </div>

        </div>

        <hr class="footer-line">

        <div class="text-center footer-bottom">
            © 2026 Fengshui Stone. All rights reserved.
        </div>

    </div>
</footer>
