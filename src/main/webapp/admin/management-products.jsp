<%--
  Created by IntelliJ IDEA.
  User: hoai1
  Date: 12/6/2024
  Time: 3:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quản Lý Sản Phẩm</title>
    <%@include file="../includes/link/headLink.jsp"%>
    <link rel="stylesheet" href="css/management.css">
</head>
<body>
<%@include file="menu-admin.jsp"%>
<div class="container-fluid mt-4">
    <h2 class="center-text mb-4 text-center" style="color: #2c8b73">Danh Sách Sản Phẩm</h2>

    <!-- Bảng thông tin sản phẩm -->
    <table class="table custom-table">
        <thead>
        <tr>
            <th>Mã Sản Phẩm</th>
            <th>Tên Sản Phẩm</th>
            <th>Kiích thước</th>
            <th>Số Lượng Còn Lại</th>
            <th>Ngày Thêm</th>
            <th>Danh Mục</th>
            <th>Hành Động</th>
        </tr>
        </thead>
        <tbody>
        <!-- Ví dụ sản phẩm 1 -->
        <tr>
            <td>P001</td>
            <td>Sản phẩm A</td>
            <td>400x400</td>
            <td>50</td>
            <td>2024-11-01</td>
            <td>Vải mặc</td>
            <td>
                <a class="btn btn-warning" href="management-detail-products.jsp">Xem chi tiết</a>
                <a class="btn btn-secondary" href="product-details">Ngừng bán</a>
            </td>
        </tr>
        <!-- Ví dụ sản phẩm 2 -->
        <tr>
            <td>P002</td>
            <td>Sản phẩm B</td>
            <td>400x400</td>
            <td>30</td>
            <td>2024-10-15</td>
            <td>Phụ kiện</td>
            <td>
                <a class="btn btn-warning" href="management-detail-products.jsp">Xem chi tiết</a>
                <a class="btn btn-success" href="product-details">Tiếp tục bán</a>
            </td>
        </tr>
        <!-- Các sản phẩm khác -->
        </tbody>
    </table>

    <div class="text-center">
        <a class="btn btn-primary" href="dashboard.jsp">Quay lại</a>
    </div>
</div>

<%@include file="../includes/link/footLink.jsp"%>
</body>
</html>

