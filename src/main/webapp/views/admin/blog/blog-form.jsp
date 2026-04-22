<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container mt-4">

    <div class="card shadow">

        <!-- HEADER -->
        <div class="card-header bg-primary text-white">
            <h4 class="mb-0">
                <c:choose>
                    <c:when test="${not empty blog}">
                        ✏️ Edit Blog
                    </c:when>
                    <c:otherwise>
                        ➕ Create Blog
                    </c:otherwise>
                </c:choose>
            </h4>
        </div>

        <!-- BODY -->
        <div class="card-body">

            <form method="post"
                  enctype="multipart/form-data"
                  action="${pageContext.request.contextPath}/admin/blog">

                <input type="hidden" name="id" value="${blog.id}" />

                <!-- TITLE -->
                <div class="mb-3">
                    <label class="form-label">Title</label>
                    <input type="text"
                           class="form-control"
                           name="title"
                           value="${blog.title}"
                           required />
                </div>

                <!-- CONTENT -->
                <div class="mb-3">
                    <label class="form-label">Content</label>
                    <textarea class="form-control"
                              name="content"
                              rows="6"
                              required>${blog.content}</textarea>
                </div>

                <hr>

                <!-- ===================== -->
                <!-- IMAGE CHOOSER -->
                <!-- ===================== -->
                <h5>Choose Image</h5>

                <div class="border p-3 mb-3 d-flex flex-wrap gap-3">

                    <c:forEach var="img" items="${imageList}">
                        <label style="text-align:center;">

                            <input type="radio"
                                   name="imageOption"
                                   value="${img}"
                                   <c:if test="${blog.image == img}">checked</c:if> />

                            <br>

                            <img src="${pageContext.request.contextPath}/images/${img}"
                                 width="80"
                                 style="border:1px solid #ccc; padding:2px;" />

                        </label>
                    </c:forEach>

                </div>

                <!-- ===================== -->
                <!-- UPLOAD IMAGE -->
                <!-- ===================== -->
                <div class="mb-3">
                    <label class="form-label">Or Upload New Image</label>
                    <input type="file"
                           class="form-control"
                           name="uploadImage" />
                </div>

                <!-- CURRENT IMAGE PREVIEW -->
                <c:if test="${not empty blog.image}">
                    <div class="mb-3">
                        <label>Current Image:</label><br>
                        <img src="${pageContext.request.contextPath}/images/${blog.image}"
                             width="120"
                             style="border:1px solid #ddd; padding:3px;" />
                    </div>
                </c:if>

                <!-- BUTTONS -->
                <div class="d-flex gap-2">

                    <button type="submit" class="btn btn-success">
                        💾 Save
                    </button>

                    <a href="${pageContext.request.contextPath}/admin/blog"
                       class="btn btn-secondary">
                        Cancel
                    </a>

                </div>

            </form>

        </div>
    </div>

</div>