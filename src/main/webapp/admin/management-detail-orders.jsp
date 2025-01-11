<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Chi tiết đơn hàng</title>
    <%@include file="../includes/link/headLink.jsp"%>
    <link rel="stylesheet" href="css/management.css">
</head>
<body>
<%@include file="menu-admin.jsp"%>
<div class="container-fluid mt-4">
    <h2 class="text-center mb-4">Chi tiết đơn hàng</h2>

    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <c:if test="${not empty order}">
        <div class="order-details">
            <h4>Thông tin đơn hàng</h4>
            <p><strong>Mã Đơn Hàng:</strong> ORD${order.id}</p>
            <p><strong>Thời Gian Đặt:</strong> ${order.timeOrdered}</p>
            <p><strong>Mã Người Dùng:</strong> ${order.user.id}</p>
            <p><strong>Mã Giảm Giá:</strong> ${order.voucher != null ? order.voucher.code : "NULL"}</p>
            <p><strong>Phương Thức Thanh Toán:</strong> ${order.paymentMethod}</p>
            <p><strong>Trạng Thái Thanh Toán:</strong> ${order.paymentStatus}</p>
            <p><strong>Trạng Thái Đơn Hàng:</strong> ${order.status}</p>
            <p><strong>Tổng Giá Trị:</strong> ${order.totalPrice} VNĐ</p>
            <p><strong>Giá Sau Giảm:</strong> ${order.lastPrice} VNĐ</p>
        </div>

        <h4>Chi tiết sản phẩm</h4>
        <table class="table table-bordered table-striped custom-table">
            <thead>
            <tr>
                <th>Mã Sản Phẩm</th>
                <th>Tên Sản Phẩm</th>
                <th>Số Lượng</th>
                <th>Giá</th>
                <th>Trọng Lượng</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="detail" items="${order.listOfDetailOrder}">
                <tr>
                    <td>${detail.style.id}</td>
                    <td>${detail.style.product.name}</td>
                    <td>${detail.quantity}</td>
                    <td>${detail.totalPrice} VNĐ</td>
                    <td>${detail.weight} kg</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <!-- Optionally, add actions like updating order status -->
    </c:if>
</div>
<%@include file="../includes/link/footLink.jsp"%>
</body>
</html>