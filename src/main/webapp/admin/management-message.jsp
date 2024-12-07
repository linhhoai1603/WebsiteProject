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
    <title>Quản lý tin nhắn từ người dùng</title>
    <%@include file="../includes/link/headLink.jsp"%>
    <link rel="stylesheet" href="css/management.css">
</head>
<body>
    <%@include file="menu-admin.jsp"%>
    <div class="container-fluid mt-4">
        <h2 class="mb-4 text-center">Quản lý tin nhắn từ người dùng</h2>

        <!-- Tìm kiếm tin nhắn -->
        <div class="row my-3">
            <div class="col-md-8"></div>
            <div class="col-md-4">
                <form method="post" action="search-message-admin" class="d-flex float-end w-100">
                    <div class="row w-100">
                        <div class="col-md-8">
                            <input type="text" placeholder="Nhập tên người dùng tìm kiếm" name="searchMessage" class="form-control me-2">
                        </div>
                        <div class="col-md-4">
                            <button type="submit" class="btn btn-primary w-100">Tìm kiếm</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <!-- Bảng hiển thị tin nhắn -->
       <div class="row">
           <table class="table table-bordered table-hover table-striped custom-table">
               <thead>
               <tr>
                   <th>Mã Tin Nhắn</th>
                   <th>Mã Người Dùng</th>
                   <th>Tên Người Dùng</th>
                   <th>Số Điện Thoại</th>
                   <th>Địa Chỉ Email</th>
                   <th>Tiêu Đề</th>
                   <th>Nội Dung</th>
                   <th>Thời Gian Gửi</th>
               </tr>
               </thead>
               <tbody id="messageTable">
               <tr>
                   <td>1111</td>
                   <td>1101</td>
                   <td>Huỳnh Linh Hoài</td>
                   <td>0377314202</td>
                   <td>hoai1603ot@mail.cm</td>
                   <td>Cần hỗ trợ mua sản phẩm</td>
                   <td>Tôi cần hỗ trợ mua 1 chiếc điện thoại học tập và làm việc</td>
                   <td>2024-12-06 15:30</td>
               </tr>
               <tr>
                   <td>1112</td>
                   <td>1102</td>
                   <td>Trần Văn B</td>
                   <td>0987654321</td>
                   <td>tranvanb@mail.cm</td>
                   <td>Lỗi sản phẩm</td>
                   <td>Sản phẩm tôi mua bị lỗi, vui lòng hỗ trợ</td>
                   <td>2024-12-06 16:00</td>
               </tr>
               </tbody>
           </table>
       </div>
    </div>
    <%@include file="../includes/link/footLink.jsp"%>
</body>
</html>
