package com.example.stonefengshuimanagement.filter;

import com.example.stonefengshuimanagement.model.entity.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;
import java.io.IOException;

@WebFilter("/admin/*")
public class AdminAuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        String uri = req.getRequestURI();
        String contextPath = req.getContextPath();

        // add by anh
        // BỎ QUA STATIC FILE
        if (uri.startsWith(contextPath + "/assets/")
                || uri.startsWith(contextPath + "/css/")
                || uri.startsWith(contextPath + "/js/")
                || uri.startsWith(contextPath + "/images/")) {
            chain.doFilter(request, response);
            return;
        }

        //  BỎ QUA LOGIN PAGE
        if (uri.equals(contextPath + "/admin/login")) {
            chain.doFilter(request, response);
            return;
        }

        HttpSession session = req.getSession(false);
        User user = session == null ? null : (User) session.getAttribute("user");

        // Chưa login
        if (user == null) {
            resp.sendRedirect(contextPath + "/admin/login");
            return;
        }

        // Không phải ADMIN
        if (!"ADMIN".equalsIgnoreCase(user.getRole())) {
            resp.sendRedirect(contextPath + "/home");
            return;
        }

        // ✅ OK
        chain.doFilter(request, response);
    }
}