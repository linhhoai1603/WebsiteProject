<%--
  Created by IntelliJ IDEA.
  User: hoai1
  Date: 12/6/2024
  Time: 3:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quản lý đơn hàng</title>
    <%@include file="../includes/link/headLink.jsp"%>
    <link rel="stylesheet" href="css/management.css">
</head>
<body>
<%@include file="menu-admin.jsp"%>
<div class="container-fluid mt-4">
    <h2 class="text-center mb-4">Quản Lý Đơn Hàng</h2>

    <!-- Tìm kiếm đơn hàng -->
    <div class="row my-3">
        <div class="col-md-8"></div>
        <div class="col-md-4">
            <form method="post" action="search-order" class="d-flex float-end w-100">
                <div class="row w-100">
                    <div class="col-md-8">
                        <input type="text" placeholder="Tìm theo mã đơn hàng" name="searchOrder" class="form-control me-2">
                    </div>
                    <div class="col-md-4">
                        <button type="submit" class="btn btn-primary w-100">Tìm kiếm</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!-- Bảng danh sách đơn hàng -->
    <table class="table table-bordered table-striped custom-table">
        <thead>
        <tr>
            <th>Mã Đơn Hàng</th>
            <th>Thời Gian Đặt</th>
            <th>Mã Người Dùng</th>
            <th>Mã Giảm Giá</th>
            <th>Phương Thức Thanh Toán</th>
            <th>Trạng Thái Thanh Toán</th>
            <th>Trạng Thái Đơn Hàng</th>
            <th>Tổng Giá Trị</th>
            <th>Giá Sau Giảm</th>
            <th>Hành Động</th>
        </tr>
        </thead>
        <tbody>
        <!-- Đơn hàng 1 -->
        <tr>
            <td>ORD001</td>
            <td>2024-12-06 10:30</td>
            <td>1101</td>
            <td>VOUCHER123</td>
            <td>Thẻ tín dụng</td>
            <td>Đã thanh toán</td>
            <td>Đang xử lý</td>
            <td>500.000 VNĐ</td>
            <td>450.000 VNĐ</td>
            <td><button class="btn btn-info" onclick="showOrderDetails('ORD001')">Xem chi tiết</button></td>
        </tr>
        <!-- Đơn hàng 2 -->
        <tr>
            <td>ORD002</td>
            <td>2024-12-06 11:00</td>
            <td>1102</td>
            <td>NULL</td>
            <td>Tiền mặt</td>
            <td>Chưa thanh toán</td>
            <td>Đang giao hàng</td>
            <td>1.200.000 VNĐ</td>
            <td>1.200.000 VNĐ</td>
            <td><button class="btn btn-info">Xem chi tiết</button></td>
        </tr>
        <!-- Các đơn hàng khác -->
        </tbody>
    </table>
</div>
<%@include file="../includes/link/footLink.jsp"%>
</body>
</html>
