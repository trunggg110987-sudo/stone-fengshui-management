package com.example.stonefengshuimanagement.controller.admin;

import com.example.stonefengshuimanagement.dao.CategoryDAO;
import com.example.stonefengshuimanagement.model.entity.Category;
import com.example.stonefengshuimanagement.model.entity.Stone;
import com.example.stonefengshuimanagement.service.StoneService;
import exception.DatabaseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.http.Part;
import java.nio.file.Paths;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 5 * 1024 * 1024,
        maxRequestSize = 5 * 1024 * 1024
)

@WebServlet("/admin/stones")
public class StoneController extends HttpServlet {

    private final StoneService stoneService = new StoneService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null) action = "list";

        switch (action) {
            case "create":
                CategoryDAO categoryDAO = new CategoryDAO();

                List<Category> categories = null;
                try {
                    categories = categoryDAO.findAll();
                } catch (DatabaseException e) {
                    throw new RuntimeException(e);
                }

                request.setAttribute("categories", categories);
                request.setAttribute("contentPage", "/views/admin/stone/create.jsp");
                request.getRequestDispatcher("/views/admin/dashboard.jsp").forward(request, response);
                break;

            case "edit":
                int id = Integer.parseInt(request.getParameter("id"));
                Stone stone = null;
                try {
                    stone = stoneService.findById(id);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }

                request.setAttribute("stone", stone);
                request.setAttribute("contentPage", "/views/admin/stone/edit.jsp");

                request.getRequestDispatcher("/views/admin/dashboard.jsp")
                        .forward(request, response);
                break;

            case "delete":
                int deleteId = Integer.parseInt(request.getParameter("id"));
                try {
                    // 1. LẤY stone TRƯỚC KHI XÓA
                    stone = stoneService.findById(deleteId);

                    if (stone != null) {
                        String imageUrl = stone.getImageUrl();

                        // 2. XÓA FILE NẾU LÀ ẢNH UPLOAD
                        if (imageUrl != null && imageUrl.startsWith("upload_")) {

                            String fileName = imageUrl.substring(7);

                            String uploadPath = System.getProperty("user.home")
                                    + File.separator + "stone-upload";

                            File file = new File(uploadPath, fileName);

                            System.out.println("Deleting file: " + file.getAbsolutePath()); // DEBUG

                            if (file.exists()) {
                                boolean deleted = file.delete();
                                System.out.println("Deleted: " + deleted);
                            } else {
                                System.out.println("File not found!");
                            }
                        }
                    }

                    // 3. XÓA TRONG DATABASE
                    stoneService.deleteStone(deleteId);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }

                response.sendRedirect(request.getContextPath() + "/admin/stones");
                break;

            default:
            String keyword = request.getParameter("keyword");

            List<Stone> list;

            if (keyword != null && !keyword.trim().isEmpty()) {
                try {
                    list = stoneService.searchByName(keyword);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                request.setAttribute("keyword", keyword); // giữ lại input
            } else {
                try {
                    list = stoneService.findAll();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }

            request.setAttribute("stones", list);
            request.setAttribute("total", list.size());
            request.setAttribute("contentPage", "/views/admin/stone/list.jsp");

            request.getRequestDispatcher("/views/admin/dashboard.jsp")
                    .forward(request, response);
            break;

        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        int id = request.getParameter("id") == null || request.getParameter("id").isEmpty()
                ? 0 : Integer.parseInt(request.getParameter("id"));

        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        String name = request.getParameter("name");
        String code = request.getParameter("code");
        String priceStr = request.getParameter("price");

        // nếu có dấu . mà là format tiền → xóa hết
        if (priceStr.contains(".")) {
            priceStr = priceStr.replace(".", "");
        }

        // nếu có dấu , → xóa
        priceStr = priceStr.replace(",", "");

        double price = Double.parseDouble(priceStr);

        Part filePart = request.getPart("imageFile");

        String fileName = null;

        if (filePart != null && filePart.getSize() > 0) {

            fileName = Paths.get(filePart.getSubmittedFileName())
                    .getFileName()
                    .toString();

            // tránh trùng tên
            fileName = System.currentTimeMillis() + "_" + fileName;

            // lưu ngoài project (C:\Users\<username>\stone-upload để không mất khi deploy)
            String uploadPath = System.getProperty("user.home") + File.separator + "stone-upload";

            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdirs();

            filePart.write(uploadPath + File.separator + fileName);
        }

        String description = request.getParameter("description");
        int status = Integer.parseInt(request.getParameter("status"));

        String imageUrl;

        String oldImage = request.getParameter("oldImage");

        if (filePart != null && filePart.getSize() > 0) {

            //  XÓA ẢNH CŨ TRƯỚC
            deleteOldImage(oldImage);

            imageUrl = "upload_" + fileName;

        } else {
            imageUrl = oldImage;
        }

        Stone stone = new Stone(id, categoryId, name, code, price, imageUrl, description, status);

        if (id == 0) {
            stoneService.addStone(stone);
        } else {
            try {
                stoneService.updateStone(stone);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        response.sendRedirect(request.getContextPath() + "/admin/stones");
    }

    private void deleteOldImage(String imageUrl) {
        if (imageUrl != null && imageUrl.startsWith("upload_")) {

            String fileName = imageUrl.substring(7);

            String uploadPath = System.getProperty("user.home")
                    + File.separator + "stone-upload";

            File file = new File(uploadPath, fileName);

            if (file.exists()) {
                file.delete();
            }
        }
    }

}
