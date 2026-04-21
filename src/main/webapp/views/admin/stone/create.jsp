<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h4 class="font-weight-bold mb-3">Create Stone</h4>

<form method="post" action="${pageContext.request.contextPath}/admin/stones"
      enctype="multipart/form-data">
    <script></script>

    <div class="form-group">
        <label>Category ID</label>
        <select name="categoryId" class="form-control" required>
            <c:forEach var="category" items="${categories}">
                <option value="${category.id}">
                        ${category.id} (${category.name})
                </option>
            </c:forEach>
        </select>
    </div>

    <div class="form-group">
        <label>Name</label>
        <input type="text" name="name" class="form-control" required>
    </div>

    <div class="form-group">
        <label>Code</label>
        <input type="text" name="code" class="form-control">
    </div>

    <div class="form-group">
        <label>Price</label>
        <input type="text" id="priceInput" name="price" class="form-control" required>
    </div>

    <div class="form-group">
        <label>Image</label>
        <input type="file" name="imageFile" class="form-control" onchange="previewImage(event)">

        <!-- Preview -->
        <img id="preview"
             src="#"
             alt="Preview"
             style="display:none; margin-top:10px; width:150px; height:150px; object-fit:cover; border:1px solid #ccc;">
    </div>

    <div class="form-group">
        <label>Description</label>
        <textarea name="description" class="form-control"></textarea>
    </div>

    <div class="form-group">
        <label>Status</label>
        <select name="status" class="form-control">
            <option value="1">Active</option>
            <option value="0">Inactive</option>
        </select>
    </div>

    <button class="btn btn-success">Save</button>
    <a href="${pageContext.request.contextPath}/admin/stones"
       class="btn btn-secondary">Cancel</a>

</form>
<script src="${pageContext.request.contextPath}/assets/dist/js/previewImage.js"></script>
<script src="${pageContext.request.contextPath}/assets/dist/js/price-format.js"></script>