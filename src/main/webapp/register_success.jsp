<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Đăng Ký Thành Công</title>
  <!-- Đã loại bỏ meta refresh -->
  <link rel="stylesheet"
        href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <style>
    body {
      background-color: #f5f5f5;
      font-family: 'Helvetica Neue', Arial, sans-serif;
      margin: 0;
      padding: 0;
    }
    .container {
      margin-top: 80px;
      max-width: 600px;
      background: #fff;
      border-radius: 8px;
      padding: 30px;
      box-shadow: 0 2px 5px rgba(0,0,0,.1);
    }
    .success-title {
      color: #28a745; /* Màu xanh lá */
    }
    .transition-text {
      margin-top: 20px;
      color: #555;
    }
    .btn-custom {
      margin-top: 20px;
    }
  </style>
</head>
<body>

<!-- Container chính -->
<div class="container text-center">
  <h1 class="success-title">Chúc mừng bạn đã đăng ký thành công!</h1>

  <!-- Nếu Servlet setAttribute("username", ...) thì hiển thị -->
  <c:if test="${not empty username}">
    <h5>Xin chào, <span style="color: #007bff;">${username}</span>!</h5>
  </c:if>

  <p class="transition-text">
    Bạn có thể chọn <b>Đăng nhập</b> hoặc quay lại <b>Trang chủ</b>:
  </p>

  <!-- Nút “Đăng nhập” -->
  <a href="login.jsp" class="btn btn-primary btn-custom">Đăng nhập</a>

  <!-- Nút “Trang chủ” -->
  <a href="index.jsp" class="btn btn-secondary btn-custom">Trang chủ</a>
</div>

<script
        src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41Jsm3e5f9Uscpi0MH0T2p+6Wz9IM+7mUOQuv9Blh7j8+"
        crossorigin="anonymous"></script>
<script
        src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmV+GYh8ZqB8FInQ0C75MGYhYCTfKZnFFRVNR2rTeS3H2g6J4YM2B6ZfS6JL26"
        crossorigin="anonymous"></script>

</body>
</html>
