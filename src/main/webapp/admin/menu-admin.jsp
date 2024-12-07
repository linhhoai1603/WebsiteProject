<%--
  Created by IntelliJ IDEA.
  User: hoai1
  Date: 12/6/2024
  Time: 3:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="css/menu-admin.css">
<label class="h-auto">
  <input type="checkbox">
  <div class="toggle">
    <span class="top_line common"></span>
    <span class="middle_line common"></span>
    <span class="bottom_line common"></span>
  </div>
  <div class="slide">
    <h1>Menu</h1>
    <ul>
      <li><a href="dashboard.jsp"><i class="fa-solid fa-chart-line"></i>Dashboard</a></li>
      <li><a href="management-users.jsp"><i class="fa-solid fa-users"></i>Người dùng</a></li>
      <li><a href="management-products.jsp"><i class="fa-solid fa-clone"></i>Sản phẩm</a></li>
      <li><a href="management-orders.jsp"><i class="fa-solid fa-cart-shopping"></i>Đơn hàng</a></li>
      <li><a href="management-deliveries.jsp"><i class="fa-solid fa-truck-fast"></i>Vận chuyển</a></li>
      <li><a href="management-vouchers.jsp"><i class="fa-solid fa-ticket"></i>Mã giảm giá</a></li>
      <li><a href="management-message.jsp"><i class="fa-regular fa-message"></i>Tin nhắn</a></li>
    </ul>
  </div>
</label>
