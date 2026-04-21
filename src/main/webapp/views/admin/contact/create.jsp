<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<h4 class="mb-3">Thêm liên hệ</h4>

<form method="post" action="${pageContext.request.contextPath}/admin/contact">

    <input type="hidden" name="act" value="create"/>

    <div class="form-group">
        <label>Họ tên</label>
        <input type="text" name="fullName" class="form-control" required>
    </div>

    <div class="form-group">
        <label>Số Điện Thoại</label>
        <input type="text" name="phone" class="form-control">
    </div>

    <div class="form-group">
        <label>Email</label>
        <input type="email" name="email" class="form-control">
    </div>

    <div class="form-group">
        <label>Tiêu đề</label>
        <input type="text" name="subject" class="form-control">
    </div>

    <div class="form-group">
        <label>Nội dung</label>
        <textarea name="message" class="form-control"></textarea>
    </div>

    <div class="form-group">
        <label>Stone ID</label>
        <input type="number" name="stoneId" class="form-control">
    </div>

    <button class="btn btn-success">Save</button>
    <a href="${pageContext.request.contextPath}/admin/contact"
       class="btn btn-secondary">Cancel</a>

</form>