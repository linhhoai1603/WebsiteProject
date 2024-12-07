<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quản Lý Người Dùng</title>
    <%@include file="../includes/link/headLink.jsp"%>
    <link rel="stylesheet" href="css/management.css">
    <style>
        .center-text {
            text-align: center;  /* Canh giữa nội dung */
        }

        .container-fluid {
            font-family: 'Arial', sans-serif;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        h2 {
            font-size: 2rem;
            font-weight: bold;
            color: #007bff;
            margin-bottom: 20px;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .table th, .table td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }

        .table th {
            background-color: #007bff;
            color: white;
        }

        .table td {
            background-color: #f9f9f9;
        }

        .btn {
            padding: 10px 20px;
            font-size: 1rem;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            text-decoration: none;
        }

        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<%@include file="menu-admin.jsp"%>
<div class="container-fluid mt-4">
    <h2 class="center-text mb-4">Danh Sách Người Dùng</h2>

    <!-- Bảng thông tin người dùng -->
    <table class="table">
        <thead>
        <tr>
            <th>Mã Người Dùng</th>
            <th>Họ Tên</th>
            <th>Email</th>
            <th>SĐT</th>
            <th>Địa Chỉ</th>
            <th>Số Lượng Đơn Hàng</th>
            <th>Số Tiền Đã Mua (VNĐ)</th>
            <th>Hành Động</th>
        </tr>
        </thead>
        <tbody>
        <!-- Ví dụ người dùng 1 -->
        <tr>
            <td>U001</td>
            <td>Nguyễn Văn A</td>
            <td>nguyenvana@example.com</td>
            <td>0123456789</td>
            <td>Hà Nội, Hoàn Kiếm, Phố Trần Hưng Đạo</td>
            <td>5</td>
            <td>3,500,000 VNĐ</td>
            <td><a class="btn" href="user-details.jsp?id=U001">Xem chi tiết</a></td>
        </tr>
        <!-- Ví dụ người dùng 2 -->
        <tr>
            <td>U002</td>
            <td>Trần Thị B</td>
            <td>tranthib@example.com</td>
            <td>0987654321</td>
            <td>Hồ Chí Minh, Quận 1, Phố Nguyễn Huệ</td>
            <td>3</td>
            <td>2,200,000 VNĐ</td>
            <td><a class="btn" href="user-details.jsp?id=U002">Xem chi tiết</a></td>
        </tr>
        <!-- Các người dùng khác -->
        </tbody>
    </table>

    <div class="text-center">
        <a class="btn" href="admin-dashboard.jsp">Quay lại</a>
    </div>
</div>

<%@include file="../includes/link/footLink.jsp"%>
</body>
</html>
