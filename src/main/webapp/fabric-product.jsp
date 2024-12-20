<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/link/headLink.jsp" %>
<html>
<head>
  <title>Vải nội thất</title>
  <link rel="stylesheet" href="css/fabric-blog.css">
</head>
<body>
<%@ include file="includes/header.jsp" %>
<%@ include file="includes/navbar.jsp" %>
<c:if test="${requestScope.fabric == null}">
  <script>
    window.location.href = "product-fabric";
  </script>
</c:if>

<div class="container my-5">
  <!-- Thanh sắp xếp -->
  <div class="header-right d-flex align-items-center justify-content-end">
    <div class="dropdown">
      <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
        Sắp xếp theo
      </button>
      <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
        <li><a class="dropdown-item" href="product-fabric?option=1&page=1">Mới nhất</a></li>
        <li><a class="dropdown-item" href="product-fabric?option=2&page=1">Giá: Cao -> Thấp</a></li>
        <li><a class="dropdown-item" href="product-fabric?option=3&page=1">Giá: Thấp -> Cao</a></li>
        <li><a class="dropdown-item" href="product-fabric?option=4&page=1">Bán chạy nhất</a></li>
        <li><a class="dropdown-item" href="product-fabric?option=5&page=1">Giảm giá: Cao -> Thấp</a></li>
      </ul>
    </div>
  </div>

  <div class="d-flex product-container">
    <!-- Sản phẩm 1 -->
    <c:forEach var="product" items="${requestScope.fabric}">
      <div class="card product-item position-relative">
        <!-- Thẻ span hiển thị phần trăm giảm giá -->
        <span class="badge bg-danger position-absolute top-0 end-0 m-2 px-3 py-2 fs-5 product-discount">
            -${product.price.discountPercent}
        </span>

        <img src="${product.image}" class="card-img-top h-50" alt="Hình ảnh sản phẩm" style="object-fit: cover;">
        <div class="card-body text-center">
          <h5 class="card-title">${product.name}</h5>
          <h4 class="card-text text-success">Chỉ còn: <span class="product-old-price">${product.price.lastPrice}</span></h4>
          <p class="text-danger text-decoration-line-through text-center">Giá gốc: <span class="product-price">${product.price.price}</span></p>
          <p class="cart-text ">Mô tả: ${product.description}</p>
          <div class="row" style="justify-content: center">
            <a href="detail-product?id=${product.id}" class="col-md-7 btn btn-warning mx-1">Thêm vào giỏ hàng</a>
            <a href="detail-product?id=${product.id}" class="col-md-4 btn btn-primary mx-1">Xem ngay</a>
          </div>
        </div>
      </div>
    </c:forEach>
  </div>

  <!-- Phân trang -->
  <nav aria-label="Page navigation">
    <ul class="pagination justify-content-center mt-3">
      <!-- Nút Previous -->
      <c:if test="${requestScope.currentPage > 1}">
        <li class="page-item">
          <a class="page-link" href="product-fabric?active=previous&page=${requestScope.currentPage-1}&option=${requestScope.option}"> << </a>
        </li>
      </c:if>

      <!-- Các trang -->
      <c:forEach var="i" begin="1" end="${requestScope.pageNumber}">
        <li class="page-item ${i == requestScope.currentPage ? 'active' : ''}">
          <a class="page-link" href="product-fabric?page=${i}&option=${requestScope.option}">${i}</a>
        </li>
      </c:forEach>

      <!-- Nút Next -->
      <c:if test="${requestScope.currentPage < requestScope.pageNumber}">
        <li class="page-item">
          <a class="page-link" href="product-fabric?active=next&page=${requestScope.currentPage+1}&option=${requestScope.option}"> >> </a>
        </li>
      </c:if>
    </ul>
  </nav>

</div>

<%@ include file="includes/footer.jsp" %>
<%@ include file="includes/link/footLink.jsp" %>
<script >

  document.addEventListener("DOMContentLoaded", function () {
    // Hàm định dạng số tiền thành tiền Việt
    function formatCurrency(amount) {
      return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(amount);
    }

    // Hàm định dạng phần trăm giảm giá
    function formatDiscount(discount) {
      return Math.round(discount) + '%';
    }

    // Định dạng giá gốc
    document.querySelectorAll(".product-old-price").forEach(el => {
      const originalPrice = el.textContent.trim().replace("VND", "").replace(/,/g, "");
      if (originalPrice) {
        el.textContent = formatCurrency(parseFloat(originalPrice));
      }
    });

    // Định dạng giá sau khi giảm
    document.querySelectorAll(".product-price").forEach(el => {
      const lastPrice = el.textContent.trim().replace("VND", "").replace(/,/g, "");
      if (lastPrice) {
        el.textContent = formatCurrency(parseFloat(lastPrice));
      }
    });

    // Định dạng phần trăm giảm giá
    document.querySelectorAll(".product-discount").forEach(el => {
      const discountPercent = el.textContent.trim().replace("%", "");
      if (discountPercent) {
        el.textContent = formatDiscount(parseFloat(discountPercent));
      }
    });
  });
</script>
</body>
</html>
