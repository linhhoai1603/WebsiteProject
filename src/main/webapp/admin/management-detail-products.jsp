<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chi Tiết Sản Phẩm</title>
    <%@include file="../includes/link/headLink.jsp"%>
    <link rel="stylesheet" href="css/management.css">
</head>
<body>
<%@include file="menu-admin.jsp"%>
<div class="container-fluid mt-4">
    <h2 class="center-text mb-4 text-center">Chi Tiết Sản Phẩm</h2>

    <!-- Form để chỉnh sửa thông tin sản phẩm -->
    <form action="update-product" method="post">
        <input type="hidden" name="id_product" value="P001">
        <!-- Các thông tin sản phẩm hiện tại -->
        <h4>Thông tin sản phẩm</h4>
        <div class="form-group">
            <label for="name"><strong>Tên sản phẩm</strong></label>
            <input type="text" class="form-control" id="name" name="name" value="Sản phẩm A" required>
        </div>

        <div class="form-group">
            <label for="quantity"><strong>Số lượng</strong></label>
            <input type="text" class="form-control" id="quantity" name="quantity" value="2000000" required>
        </div>

        <div class="form-group">
            <label for="category"><strong>Danh mục</strong></label>
            <input type="text" class="form-control" id="category" name="category" value="Điện Tử" readonly>
        </div>

        <div class="form-group">
            <label for="description"><strong>Mô tả</strong></label>
            <input type="text" class="form-control" id="description" name="description" value="Sản phẩm chất lượng cao, tiện ích vượt trội" required>
        </div>

        <!--Thông tin kỹ thuật-->
        <h4>Kỹ thuật</h4>
        <div class="form-group">
            <label for="manufacture_date"><strong>Ngày sản xuất</strong></label>
            <input type="date" class="form-control" id="manufacture_date" name="manufacture_date" value="2024-01-01" required>
        </div>

        <div class="form-group">
            <label for="technical_specifications"><strong>Thông số kỹ thuật</strong></label>
            <textarea class="form-control" id="technical_specifications" name="technical_specifications" required>Sản phẩm có khả năng chống nước, chống va đập, hỗ trợ nhiều chức năng tiện ích...</textarea>
        </div>

        <div class="container mt-5">
            <h2 class="text-center mb-4" style="color: #2c8b73">Thông Tin Các Kiểu Vải</h2>

            <!-- Thêm kiểu vải Button -->
            <button class="btn btn-primary float-end my-3" data-bs-toggle="modal" data-bs-target="#addFabricModal">Thêm Kiểu Vải</button>

            <!-- Modal thêm kiểu vải -->
            <div class="modal fade" id="addFabricModal" tabindex="-1" aria-labelledby="addFabricModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addFabricModalLabel">Thêm Kiểu Vải</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <!-- Form thêm kiểu vải -->
                            <form action="add-fabric-type" method="post" enctype="multipart/form-data">
                                <!-- Tên Kiểu Vải -->
                                <div class="mb-3">
                                    <label for="fabricName" class="form-label">Tên Kiểu Vải</label>
                                    <input type="text" class="form-control" id="fabricName" name="fabricName" placeholder="Nhập tên kiểu vải" required>
                                </div>

                                <!-- Hình Ảnh -->
                                <div class="mb-3">
                                    <label for="fabricImage" class="form-label">Hình Ảnh</label>
                                    <input type="text" class="form-control" id="fabricImage" name="fabricImage"  placeholder="Nhập nguồn ảnh" required>
                                </div>

                                <!-- Giá -->
                                <div class="mb-3">
                                    <label for="fabricPrice" class="form-label">Giá</label>
                                    <input type="number" class="form-control" id="fabricPrice" name="fabricPrice" placeholder="Nhập giá (VNĐ)" min="0" required>
                                </div>

                                <!-- Phần Trăm Giảm Giá -->
                                <div class="mb-3">
                                    <label for="fabricDiscount" class="form-label">Phần Trăm Giảm Giá</label>
                                    <input type="number" class="form-control" id="fabricDiscount" name="fabricDiscount" placeholder="Nhập phần trăm giảm giá (%)" min="0" max="100" required>
                                </div>

                                <!-- Nút Thêm -->
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">Thêm Kiểu Vải</button>
                                    <button type="reset" class="btn btn-secondary">Làm Lại</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <table class="table custom-table my-3">
                <thead>
                <tr>
                    <th>Tên Kiểu Vải</th>
                    <th>Hình Ảnh</th>
                    <th>Số lượng</th>
                    <th>Giá</th>
                    <th>Phần Trăm Giảm Giá</th>
                    <th>Giá Cuối Cùng</th>
                    <th>Hành động</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><input type="text" name="nameStyle" value="Cotton" class="form-control"></td>
                    <td><img src="https://synex.vn/wp-content/uploads/2023/02/MS-LY_230215_VAI-COTTON-2-DA-SYNEX-1.jpg" alt="Cotton" width="50"></td>
                    <td><input type="number" value="20" name="quantity" class="form-control"></td>
                    <td><input type="number" value="200000" name="price" class="form-control"></td>
                    <td><input type="number" value="10" name="discountPercent" class="form-control"></td>
                    <td>180,000 VNĐ</td>
                    <td>
                        <a href="admin-update-style" class="btn btn-warning">Lưu thay đổi</a>
                        <a href="admin-delete-style" class="btn btn-danger">Xóa</a>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="row">
            <button type="submit" class="btn btn-primary my-3">Lưu Thay Đổi</button>
            <a class="btn btn-warning" href="management-products.jsp">Quay lại</a>
        </div>
    </form>

</div>

<%@include file="../includes/link/footLink.jsp"%>
</body>
</html>
