<%--
  Created by IntelliJ IDEA.
  User: hoai1
  Date: 12/6/2024
  Time: 11:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quản lý vận chuyển</title>
    <%@include file="../includes/link/headLink.jsp"%>
    <link rel="stylesheet" href="css/management.css">
</head>
<body>
<%@include file="menu-admin.jsp"%>
<div class="container-fluid mt-4">
    <h2 class="text-center mb-4">Quản Lý Vận Chuyển</h2>

    <!-- Tìm kiếm vận chuyển -->
    <div class="row my-3">
        <div class="col-md-8"></div>
        <div class="col-md-4">
            <form method="post" action="search-shipping" class="d-flex float-end w-100">
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

    <!-- Bảng danh sách vận chuyển -->
    <table class="table table-bordered table-striped custom-table">
        <thead>
        <tr>
            <th>Mã Đơn Hàng</th>
            <th>Thông Tin Giao Hàng</th>
            <th>Trọng lượng</th>
            <th>Phí Vận Chuyển</th>
            <th>Ghi Chú</th>
            <th>Trạng Thái Vận Chuyển</th>
            <th>Hành Động</th>
        </tr>
        </thead>
        <tbody>
        <!-- Dữ liệu vận chuyển mẫu -->
        <tr>
            <td>ORD001</td>
            <td>
                <p><strong>Địa chỉ:</strong> 123 Nguyễn Văn Cừ, Hà Nội</p>
                <p><strong>Người nhận:</strong> Nguyễn Văn A</p>
                <p><strong>SĐT:</strong> 0123456789</p>
            </td>
            <td>2Kg</td>
            <td>50.000 VNĐ</td>
            <td>Yêu cầu giao hàng gấp</td>
            <td>Đang giao</td>
            <td><a class="btn btn-info" href="management-detail-shipping.jsp">Xem chi tiết</a></td>
        </tr>
        <tr>
            <td>ORD002</td>
            <td>
                <p><strong>Địa chỉ:</strong> 45 Lý Thái Tổ, Đà Nẵng</p>
                <p><strong>Người nhận:</strong> Trần Văn B</p>
                <p><strong>SĐT:</strong> 0987654321</p>
            </td>
            <td>0.5Kg</td>
            <td>30.000 VNĐ</td>
            <td>Địa chỉ không rõ ràng, cần xác minh</td>
            <td>Hoàn thành</td>
            <td><a class="btn btn-info" href="management-detail-shipping.jsp">Xem chi tiết</a></td>
        </tr>
        <!-- Các vận chuyển khác -->
        </tbody>
    </table>
</div>
<%@include file="../includes/link/footLink.jsp"%>
</body>
</html>
