<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="d-flex justify-content-between align-items-center mb-3">
    <h4>Danh sách liên hệ</h4>

    <a href="${pageContext.request.contextPath}/admin/contact?act=create"
       class="btn btn-success">
        <i class="fas fa-plus"></i> Add Contact
    </a>
</div>

<c:if test="${empty contactRequests}">
    <div class="text-muted">Chưa có dữ liệu liên hệ</div>
</c:if>

<c:if test="${not empty contactRequests}">
    <table class="table table-bordered table-hover">
        <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>Họ tên</th>
            <th>Số Điện Thoại</th>
            <th>Email</th>
            <th>Tiêu đề</th>
            <th>Stone</th>
            <th>Trạng thái</th>
            <th>Ngày tạo</th>
            <th width="160">Action</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="item" items="${contactRequests}" varStatus="i">
            <tr>
                <td>${i.count}</td>
                <td>${item.fullName}</td>
                <td>${item.phone}</td>
                <td>${item.email}</td>
                <td>${item.subject}</td>
                <td>${item.stoneId}</td>

                <!-- STATUS -->
                <td>
                    <span class="badge
                        ${item.status == 'NEW' ? 'badge-warning' : ''}
                        ${item.status == 'PROCESSING' ? 'badge-info' : ''}
                        ${item.status == 'DONE' ? 'badge-success' : ''}">
                            ${item.status}
                    </span>
                </td>

                <td>${item.createdAt}</td>

                <!-- ACTION -->
                <td>
                    <!-- UPDATE STATUS -->
                    <form method="post"
                          action="${pageContext.request.contextPath}/admin/contact"
                          style="display:inline">

                        <input type="hidden" name="act" value="update"/>
                        <input type="hidden" name="id" value="${item.id}"/>

                        <select name="status" class="form-control form-control-sm mb-1">
                            <option value="NEW" ${item.status=='NEW'?'selected':''}>NEW</option>
                            <option value="PROCESSING" ${item.status=='PROCESSING'?'selected':''}>PROCESSING</option>
                            <option value="DONE" ${item.status=='DONE'?'selected':''}>DONE</option>
                        </select>

                        <button class="btn btn-sm btn-warning">
                            Update
                        </button>
                    </form>

                    <!-- DELETE -->
                    <form method="post"
                          action="${pageContext.request.contextPath}/admin/contact"
                          style="display:inline"
                          onsubmit="return confirm('Delete this contact?')">

                        <input type="hidden" name="act" value="delete"/>
                        <input type="hidden" name="id" value="${item.id}"/>

                        <button class="btn btn-sm btn-danger">
                            Delete
                        </button>
                    </form>

                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>