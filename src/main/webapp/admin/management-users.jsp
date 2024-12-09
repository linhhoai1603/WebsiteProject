<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quản Lý Người Dùng</title>
    <%@include file="../includes/link/headLink.jsp"%>
    <link rel="stylesheet" href="css/management-users.css">
</head>
<body>
<%@include file="menu-admin.jsp"%>
<div class="container-fluid mt-4">
    <h2 class="center-text mb-4">Danh Sách Người Dùng</h2>

   <div class="row">
       <!-- Form Tìm kiếm Người dùng -->
       <div class="col-md-7"></div>
       <div class="col-md-5 my-3">
                   <form action="admin-search-users" method="get" class="d-flex">
                      <input name="name" id="searchUser" type="text" class="form-control me-1" placeholder="Nhập tên người dùng">
                       <button type="submit" class="btn btn-success">
                           Tìm kiếm<i class="fa-solid fa-search"></i>
                       </button>
                   </form>
       </div>
   </div>
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
            <td>
                <a href="admin-detail-user" class="btn btn-warning my-1">Xem chi tiết</a>
                <a href="admin-delete-user" class="btn my-1" onclick="return confirm('Bạn có chắc chắn muốn xóa người dùng này?')" style="background-color: #f62424" >Xóa</a>
            </td>
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
            <td>
                    <a href="admin-detail-user" class="btn btn-warning my-1" style="background-color: #f3721e">Xem chi tiết</a>
                    <a href="admin-delete-user" class="btn my-1" style="background-color: #f62424">Xóa</a>
            </td>
        </tr>
        <!-- Các người dùng khác -->
        </tbody>
    </table>

    <div class="text-center">
        <a class="btn btn-primary" href="dashboard.jsp">Quay lại</a>
    </div>
</div>

<%@include file="../includes/link/footLink.jsp"%>
</body>
</html>
