<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="includes/link/headLink.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="css/register.css">
  <title>Đăng ký</title>
</head>
<body>
<a href="index.jsp">&lt;-- Quay lại trang chủ</a>
<!-- Nội Dung Chính: Form Đăng Ký -->
<div class="container">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <div class="form-section">
        <h2 class="text-center">ĐĂNG KÝ TÀI KHOẢN</h2>

        <!-- Hiển thị thông báo lỗi nếu có -->
        <c:if test="${not empty error}">
          <div class="alert alert-danger">
            <c:out value="${error}" />
          </div>
        </c:if>

        <!-- Form Đăng Ký -->
        <form id="registrationForm" action="RegisterServlet" method="post" novalidate>
          <!-- Email -->
          <div class="mb-3">
            <label for="email" class="form-label">Email *</label>
            <input
                    class="form-control"
                    id="email"
                    name="email"
                    placeholder="Nhập địa chỉ Email của bạn"
                    required
                    type="email"
                    aria-describedby="emailHelp"
            />
          </div>

          <!-- Mật khẩu -->
          <div class="mb-3">
            <label for="password" class="form-label">Mật khẩu *</label>
            <input
                    class="form-control"
                    id="password"
                    name="password"
                    placeholder="Nhập mật khẩu"
                    required
                    type="password"
                    aria-describedby="passwordHelp"
            />
          </div>

          <!-- Xác nhận Mật khẩu -->
          <div class="mb-3">
            <label for="confirmPassword" class="form-label">Xác nhận Mật khẩu *</label>
            <input
                    class="form-control"
                    id="confirmPassword"
                    name="confirmPassword"
                    placeholder="Nhập lại mật khẩu"
                    required
                    type="password"
                    aria-describedby="confirmPasswordHelp"
            />
          </div>

          <!-- Nút Đăng Ký -->
          <div class="text-center">
            <button class="btn btn-primary w-100" type="submit">ĐĂNG KÝ</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<%@ include file="includes/link/footLink.jsp" %>
</body>
</html>
