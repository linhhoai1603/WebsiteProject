<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            <form method="post" action="order" class="d-flex float-end w-100">
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
        <c:forEach var="order" items="${orders}">
            <tr>
                <td>ORD${order.id}</td>
                <td>${order.timeOrdered}</td>
                <td>${order.user.id}</td>
                <td>${order.voucher != null ? order.voucher.code : "NULL"}</td>
                <td>${order.paymentMethod}</td>
                <td>${order.paymentStatus}</td>
                <td>${order.status}</td>
                <td>${order.totalPrice} VNĐ</td>
                <td>${order.lastPrice} VNĐ</td>
                <td><a class="btn btn-info" href="order-detail?id=${order.id}">Xem chi tiết</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<%@include file="../includes/link/footLink.jsp"%>
</body>
</html>