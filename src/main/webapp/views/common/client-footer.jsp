<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 4/11/2026
  Time: 2:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<footer class="footer mt-5 bg-dark text-light">
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

            <!-- QUICK LINKS -->
            <div class="col-md-4">
                <h5 class="footer-title">Quick Links</h5>
                <ul class="footer-links list-unstyled">

                    <li>
                        <a href="${pageContext.request.contextPath}/home"
                           class="text-light text-decoration-none">
                            Home
                        </a>
                    </li>

                    <li>
                        <a href="${pageContext.request.contextPath}/stones"
                           class="text-light text-decoration-none">
                            Products
                        </a>
                    </li>

                    <li>
                        <a href="#"
                           class="text-light text-decoration-none">
                            Blog
                        </a>
                    </li>

                    <li>
                        <a href="${pageContext.request.contextPath}/contact"
                           class="text-light text-decoration-none">
                            Contact Us
                        </a>
                    </li>

                </ul>
            </div>

            <!-- CONTACT -->
            <div class="col-md-4">
                <h5 class="footer-title">Contact</h5>

                <p class="footer-text mb-1">
                    Email: fengshui@gmail.com
                </p>

                <p class="footer-text mb-1">
                    Phone: 0987654321
                </p>

                <p class="footer-text">
                    Address: Hanoi, Vietnam
                </p>
            </div>

        </div>

        <hr class="footer-line text-secondary">

        <div class="text-center footer-bottom">
            © 2026 Fengshui Stone. All rights reserved.
        </div>

    </div>
</footer>

