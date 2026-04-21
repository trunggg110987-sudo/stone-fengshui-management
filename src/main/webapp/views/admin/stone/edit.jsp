<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<h4 class="font-weight-bold mb-3">Edit Stone</h4>

<form method="post" action="${pageContext.request.contextPath}/admin/stones"
      enctype="multipart/form-data">

    <input type="hidden" name="id" value="${stone.id}">

    <div class="form-group">
        <label>Category ID</label>
        <input type="number" name="categoryId" class="form-control"
               value="${stone.categoryId}" required>
    </div>

    <div class="form-group">
        <label>Name</label>
        <input type="text" name="name" class="form-control"
               value="${stone.name}" required>
    </div>

    <div class="form-group">
        <label>Code</label>
        <input type="text" name="code" class="form-control"
               value="${stone.code}">
    </div>

    <div class="form-group">
        <label>Price</label>
        <input type="text" id="priceInput" name="price" class="form-control"
               value="<fmt:formatNumber value='${stone.price}' type='number' groupingUsed='true'/>"
               required>
    </div>

    <div class="form-group">
        <label>Current Image</label><br>

        <c:choose>
            <c:when test="${stone.imageUrl.startsWith('upload_')}">
                <img src="${pageContext.request.contextPath}/uploads/${stone.imageUrl.substring(7)}"
                     width="120" alt="">
            </c:when>
            <c:otherwise>
                <img src="${pageContext.request.contextPath}/images/${stone.imageUrl}"
                     width="120" alt="">
            </c:otherwise>
        </c:choose>
    </div>

    <div class="form-group">
        <label>Upload New Image</label>

        <input type="file" name="imageFile" class="form-control"
               onchange="previewImage(event)">

        <input type="hidden" name="oldImage" value="${stone.imageUrl}">

        <p style="margin-top:10px;">Preview:</p>

        <img id="preview"
             width="120"
             style="display:none;">
    </div>

    <div class="form-group">
        <label>Description</label>
        <textarea name="description" class="form-control">${stone.description}</textarea>
    </div>

    <div class="form-group">
        <label>Status</label>
        <select name="status" class="form-control">
            <option value="1" ${stone.status == 1 ? 'selected' : ''}>Active</option>
            <option value="0" ${stone.status == 0 ? 'selected' : ''}>Inactive</option>
        </select>
    </div>

    <button class="btn btn-success">Update</button>
    <a href="${pageContext.request.contextPath}/admin/stones"
       class="btn btn-secondary">Cancel</a>

</form>

<script src="${pageContext.request.contextPath}/assets/dist/js/price-format.js"></script>
<script src="${pageContext.request.contextPath}/assets/dist/js/previewImage.js"></script>