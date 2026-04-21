<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<h4 class="font-weight-bold mb-3">Edit Stone</h4>

<form method="post" action="${pageContext.request.contextPath}/admin/stones">

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
               value="${stone.price}" required>
    </div>

    <div class="form-group">
        <label>Image URL</label>
        <input type="text" name="imageUrl" class="form-control"
               value="${stone.imageUrl}">
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