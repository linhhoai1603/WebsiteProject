<%@ page import="models.Product" %><%--
  Created by IntelliJ IDEA.
  User: hoai1
  Date: 12/4/2024
  Time: 2:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="includes/link/headLink.jsp"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Vải may mặc</title>
</head>
<body>
<%@include file="includes/header.jsp"%>
<%@include file="includes/navbar.jsp"%>
<link rel="stylesheet" href="css/garment-product.css">

<div class="container mt-1">

  <div class="row " id="product-container" style="margin-bottom: 50px ;margin-top: 50px">
    <div class="col-6">
      <img src="images/maymac1.png" style="width: 100%; height: 100%; object-fit: cover;" alt="mayMac" class="img-fluid">
    </div>

    <div class="col-6">
      <div class="title-product text-center mb-4">
        <h2>May mặc tại thời trang</h2>
      </div>

      <div class="row">
        <c:if test="${empty requestScope.garment}">
          <h1>Không có sản phẩm</h1>
        </c:if>
        <c:forEach begin="0" end="5" items="${requestScope.garment}" var="p">
          <div class="col-4 products-section" onclick="showDetailProduct()">
            <div class="card product-card">
              <div class="position-relative">
                <img src="${p.image}" class="card-img-top" alt="Sản phẩm" style="object-fit: cover; height: 200px;">
                <div class="product-buttons position-absolute start-50 translate-middle">
                  <button class="btn"data-bs-toggle="modal" data-bs-target="#orderDetailsModal"><i class="fas fa-shopping-cart"></i></button>
                  <button class="btn">Mua</button>
                </div>
              </div>
              <div class="card-body text-center">
                <h5 class="card-title">${p.name}</h5>
                <p class="card-text">
                <div class="price-container">
                  <span style="font-weight: bold; color: #339C87; font-size: 16px;">Giá</span>
                  <span  class="text-decoration-line-through small" style="color: #555; font-size: 0.9em;">
                    <fmt:formatNumber value="${p.price.price}" type="number" />
                  </span >
                  <strong class="small" style="color: #339C87;">
                    <fmt:formatNumber value="${p.price.lastPrice}" type="number" />₫
                  </strong>
                </div>
                <div class="text-danger small">
                  <strong>Giảm ${p.price.discountPercent}%</strong>
                </div>
                </p>
              </div>
            </div>
          </div>
        </c:forEach>

      </div>
  </div>
</div>
  <div class="row " id="product-container" style="margin-bottom: 50px ;margin-top: 50px">


    <div class="col-6">
      <div class="title-product text-center mb-4">
        <h2>May mặc cơ bản </h2>
      </div>

      <div class="row">
        <c:if test="${empty requestScope.garment}">
          <h1>Không có sản phẩm</h1>
        </c:if>
        <c:forEach begin="6" end="11" items="${requestScope.garment}" var="p">
          <div class="col-4 products-section" onclick="showDetailProduct()">
            <div class="card product-card">
              <div class="position-relative">
                <img src="${p.image}" class="card-img-top" alt="Sản phẩm" style="object-fit: cover; height: 200px;">
                <div class="product-buttons position-absolute start-50 translate-middle">
                  <button class="btn"data-bs-toggle="modal" data-bs-target="#orderDetailsModal"><i class="fas fa-shopping-cart"></i></button>
                  <button class="btn">Mua</button>
                </div>
              </div>
              <div class="card-body text-center">
                <h5 class="card-title">${p.name}</h5>
                <p class="card-text">
                <div class="price-container">
                <span style="font-weight: bold; color: #339C87; font-size: 16px;">Giá</span>
                  <span  class="text-decoration-line-through small" style="color: #555; font-size: 0.9em;">
                    <fmt:formatNumber value="${p.price.price}" type="number" />
                  </span >
                  <strong class="small" style="color: #339C87;">
                    <fmt:formatNumber value="${p.price.lastPrice}" type="number" />₫
                  </strong>
                </div>
                <div class="text-danger small">
                  <strong>Giảm ${p.price.discountPercent}%</strong>
                </div>
                </p>
              </div>
            </div>
          </div>
        </c:forEach>

      </div>
    </div>
    <div class="col-6">
      <img src="images/maymac2.png" style="width: 100%; height: 100%; object-fit: cover;" alt="mayMac" class="img-fluid">
    </div>
  </div>

  <div class="modal fade" id="orderDetailsModal" tabindex="-1" aria-labelledby="orderDetailsModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="orderDetailsModalLabel">Chi tiết sản phẩm</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <div class="row">
            <!-- Image Carousel Section -->
            <div class="col-md-6">
              <div id="productCarousel" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <img src="images/vaiGamHoaVanXanh.jpg" class="d-block w-100" alt="Product Image 1">
                  </div>
                  <div class="carousel-item">
                    <img src="images/vaiGamHongThienPhuc.jpg" class="d-block w-100" alt="Product Image 2">
                  </div>
                  <div class="carousel-item">
                    <img src="images/vaiGamLucThienPhuc.jpg" class="d-block w-100" alt="Product Image 3">
                  </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#productCarousel" data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#productCarousel" data-bs-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Next</span>
                </button>
              </div>
            </div>

            <!-- Product Details Section -->
            <div class="col-md-6">
              <h3 class="text" style="color: #008080">
                Áo sơ mi nam dài tay Café-DriS khử mùi
              </h3>
              <p class="h4 text-decoration-line-through text-warning">600,000đ</p>
              <p class="h2 text-danger fw-bold">
                390,000₫
              </p>

              <!-- Màu sắc -->
              <div class="mb-3">
                <p class="fw-bold">Màu sắc</p>
                <div class="d-flex gap-2">
                  <img src="images/vaiDoChamHoaXanh.jpg" alt="Color 1" class="color-option border rounded" data-color="vaiDoChamHoaXanh" style="width: 40px; height: 40px">
                  <img src="images/vaiGamHoaVanLaVang.jpg" alt="Color 2" class="color-option border rounded" data-color="vaiGamHoaVanLaVang" style="width: 40px; height: 40px">
                  <img src="images/vaiGamHoaVanTim.webp" alt="Color 3" class="color-option border rounded" data-color="vaiGamHoaVanTim" style="width: 40px; height: 40px">
                  <img src="images/vaiGamHoaVanTrang.webp" alt="Color 4" class="color-option border rounded" data-color="vaiGamHoaVanTrang" style="width: 40px; height: 40px">
                </div>
              </div>

              <!-- Size Options -->
              <div class="mb-3">
                <p class="fw-bold">Size</p>
                <div class="btn-group" role="group">
                  <button type="button" class="btn btn-outline-secondary size-option" data-size="2XL">2XL</button>
                  <button type="button" class="btn btn-outline-secondary size-option" data-size="L">L</button>
                  <button type="button" class="btn btn-outline-secondary size-option" data-size="M">M</button>
                  <button type="button" class="btn btn-outline-secondary size-option" data-size="S">S</button>
                  <button type="button" class="btn btn-outline-secondary size-option" data-size="XL">XL</button>
                </div>
              </div>

              <!-- Form to Submit Data -->
              <form action="/checkout" method="POST">
                <input type="hidden" name="selected_color" id="selected_color" value="">
                <input type="hidden" name="selected_size" id="selected_size" value="">
                <div class="row">
                  <div class="col-3">
                    <div class="input-group">
                      <button class="btn btn-outline-secondary" type="button">-</button>
                      <input type="text" class="form-control text-center" value="1" style="max-width: 50px">
                      <button class="btn btn-outline-secondary" type="button">+</button>
                    </div>
                  </div>
                  <button type="submit" class="col-3 btn btn-custom w-10 mb-2" style="background-color: #339c87">
                    THÊM VÀO GIỎ
                  </button>
                </div>
                <button type="submit" class="btn btn-custom w-100" style="background-color: #339c87">
                  MUA NGAY
                </button>
              </form>

              <div class="alert alert-light mt-3" role="alert">
                <i class="bi bi-truck"></i>
                Giao hàng: Miễn phí giao hàng toàn quốc với đơn hàng > 400k hoặc mua 3 sản phẩm bất kỳ.
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

<div class="pagination-container">
  <div class="pagination">
    <%
      int nuPage = Integer.parseInt(request.getAttribute("nuPage").toString());
      int loca = Integer.parseInt(request.getAttribute("loca").toString());
    %>
    <%
      if (loca>1){
    %>
    <a class="page-btn" id="prev-btn" href="may-mac?loca=<%=loca-1%>">&lt</a>
    <%
      }
      for (int i = 1; i <= nuPage; i++) {
        if(i == loca) {
    %>
    <a href="may-mac?loca=<%=i%>" class="page-btn active" id="page-<%= i %>" style="background-color: #339C87;"><%= i %></a>
    <%
    } else {
    %>
    <a class="page-btn" id="page-<%= i %>" href="may-mac?loca=<%= i %>"><%= i %></a>
    <%
        }
      }
      if (loca< nuPage){
    %>
    <a class="page-btn" id="next-btn" href="may-mac?loca=<%=loca+1%>" >&gt</a>
    <%
      }
    %>
  </div>
</div>


<%@include file="includes/footer.jsp"%>
<%@include file="includes/link/footLink.jsp"%>
</body>
</html>