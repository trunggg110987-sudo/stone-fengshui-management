package com.example.stonefengshuimanagement.controller.admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.nio.file.Files;

@WebServlet("/uploads/*")
public class UpLoadController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fileName = request.getPathInfo().substring(1);

        String basePath = System.getProperty("user.home") + File.separator + "stone-upload";

        File file = new File(basePath, fileName);

        if (!file.exists()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        response.setContentType(getServletContext().getMimeType(file.getName()));

        Files.copy(file.toPath(), response.getOutputStream());
    }
}