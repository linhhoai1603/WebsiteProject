<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/link/headLink.jsp" %>
<html>
<head>
  <title>Liên hệ</title>
  <link rel="stylesheet" href="css/contact.css">
</head>
<body>
<%@ include file="includes/header.jsp" %>
<%@ include file="includes/navbar.jsp" %>

<section class="contact-section">
  <div class="container">
    <!-- Section Title -->
    <div class="section-title">
      <h2>Thông tin liên hệ</h2>
      <div class="underline"></div>
    </div>

    <div class="row">
      <!-- Contact Information -->
      <div class="col-lg-6 mb-4 d-flex">
        <div class="contact-info w-100">
          <h3><i class="fas fa-info-circle"></i> Thông tin liên hệ</h3>
          <p>
            <i class="fas fa-phone-alt"></i> Hotline:
            <strong>0964 511 511 (VP HCM)</strong> -
            <strong>0979 462 762 (VP Hà Nội)</strong>
          </p>
          <p>
            <i class="fas fa-map-marker-alt"></i> Văn Phòng HCM: Khu Phố 6,
            Phường Linh Trung, Thành Phố Thủ Đức
          </p>
          <p>
            <i class="fas fa-map-marker-alt"></i> Văn Phòng Hà Nội: Cầu Thắt
            Đoài, Mỹ Tháng, Mỹ Lộc, Nam Định
          </p>
          <p>
            <i class="fas fa-industry"></i> Xưởng dệt: 18/7 Đường 429, Ấp 1,
            Xã Phước Vĩnh An, Củ Chi, Tp.HCM
          </p>
          <p>
            <i class="fas fa-envelope"></i> Email:
            <a href="mailto:vaihongngan@gmail.com" class="text-decoration-none text-light">vovanvai@gmail.com</a>
          </p>
          <!-- Interactive Map -->
          <div class="map-container">
            <iframe
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.915026371668!2d106.800525!3d10.872012!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752782e5826fdf%3A0x5cb7fba58e98c34e!2zVHLGsOG7nW5nIMSQ4bqhaSBOZ3V54buFbiBMw6Jt!5e0!3m2!1svi!2s!4v1695000000000!5m2!1svi!2s"
                    width="100%"
                    height="300"
                    style="border: 0"
                    allowfullscreen=""
                    loading="lazy"
                    referrerpolicy="no-referrer-when-downgrade"
            ></iframe>
          </div>
        </div>
      </div>
      <!-- Contact Form -->
      <div class="col-lg-6 d-flex">
        <div class="contact-form w-100">
          <h3><i class="fas fa-envelope"></i> Gửi tin nhắn cho chúng tôi</h3>

          <!-- Thông báo thành công và lỗi -->
          <c:if test="${not empty success}">
            <div class="alert alert-success">
                ${success}
            </div>
          </c:if>
          <c:if test="${not empty error}">
            <div class="alert alert-danger">
                ${error}
            </div>
          </c:if>

          <form id="contactForm" action="ContactServlet" method="post" novalidate>
            <div class="form-floating mb-4">
              <input
                      type="text"
                      class="form-control"
                      id="subject"
                      name="subject"
                      placeholder="Nhập tiêu đề"
                      required
              />
              <label for="subject">Tiêu đề <span class="text-danger">*</span></label>
              <div class="invalid-feedback">Vui lòng nhập tiêu đề.</div>
            </div>
            <div class="form-floating mb-4">
                  <textarea
                          class="form-control"
                          id="message"
                          name="message"
                          placeholder="Nhập nội dung"
                          style="height: 150px"
                          required
                  ></textarea>
              <label for="message">Nội dung <span class="text-danger">*</span></label>
              <div class="invalid-feedback">Vui lòng nhập nội dung.</div>
            </div>
            <!-- Honeypot Field -->
            <div
                    class="mb-4 honeypot-field"
                    aria-hidden="true"
                    tabindex="-1"
            >
              <label for="contactTime">Nếu bạn là người thật, hãy bỏ trống trường này:</label>
              <input
                      type="text"
                      id="contactTime"
                      name="contactTime"
                      class="form-control"
                      autocomplete="off"
              />
            </div>
            <button type="submit" class="btn btn-warning w-100">Gửi yêu cầu</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</section>

<%@ include file="includes/footer.jsp" %>
<%@ include file="includes/link/footLink.jsp" %>

<script>
  // JavaScript để kiểm tra form
  (function () {
    'use strict'

    // Lấy form để kiểm tra
    var forms = document.querySelectorAll('#contactForm')

    // Vòng lặp qua từng form và ngăn không cho gửi nếu form không hợp lệ
    Array.prototype.slice.call(forms)
            .forEach(function (form) {
              form.addEventListener('submit', function (event) {
                if (!form.checkValidity()) {
                  event.preventDefault()
                  event.stopPropagation()
                }

                form.classList.add('was-validated')
              }, false)
            })
  })()
</script>

</body>
</html>
