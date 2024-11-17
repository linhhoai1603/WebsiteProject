<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container my-4">
    <h2 class="text-center mb-4">Product List</h2>
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <!-- Start of Product Cards -->
        <%
            // Tạo dữ liệu mẫu cho sản phẩm
            class Product {
                String id;
                String name;
                double price;
                String imageUrl;

                Product(String id, String name, double price, String imageUrl) {
                    this.id = id;
                    this.name = name;
                    this.price = price;
                    this.imageUrl = imageUrl;
                }
            }

            // Tạo danh sách sản phẩm mẫu
            java.util.List<Product> products = new java.util.ArrayList<>();
            for (int i = 1; i <= 15; i++) {
                products.add(new Product("P" + i, "Product " + i, 99.99 + i, "path-to-image" + i + ".jpg"));
            }

            // Hiển thị sản phẩm
            for (Product product : products) {
        %>
        <div class="col">
            <div class="card h-100">
                <img src="<%= product.imageUrl %>" class="card-img-top" alt="Product Image">
                <div class="card-body text-center">
                    <h5 class="card-title"><%= product.name %></h5>
                    <p class="card-text">Product ID: #<%= product.id %></p>
                    <p class="card-text text-danger fw-bold">Price: $<%= product.price %></p>
                </div>
                <div class="card-footer d-flex justify-content-around">
                    <a href="#" class="btn btn-outline-primary">View Details</a>
                    <a href="#" class="btn btn-primary">Buy</a>
                </div>
            </div>
        </div>
        <% } %>
        <!-- End of Product Cards -->
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
