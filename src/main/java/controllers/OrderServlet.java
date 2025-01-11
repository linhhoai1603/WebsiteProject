package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.*;
import services.AddressService;
import services.DeliveryService;
import services.OrderDetailService;
import services.OrderService;

import java.io.IOException;

@WebServlet(name = "OrderServlet", value = "/order")
public class OrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String methodPay = request.getParameter("payment");
        if ("cash".equals(methodPay)) {
            Ordered ordered = createOrder(request, response);
            removeCart(request);
            request.setAttribute("ordered", ordered);
            request.setAttribute("message", "Đặt hàng thành công!");
            request.getRequestDispatcher("payment-success.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Phương thức thanh toán không hợp lệ.");
            request.getRequestDispatcher("payment-failed.jsp").forward(request, response);
        }
    }

    private void removeCart(HttpServletRequest request) {
        request.getSession().setAttribute("cart", new Cart());
    }

    private Ordered createOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        User user = (User) request.getSession().getAttribute("user");

        if (cart == null || cart.getItems().isEmpty()) {
            throw new IllegalStateException("Giỏ hàng trống.");
        }

        if (user == null) {
            throw new IllegalStateException("Người dùng chưa đăng nhập.");
        }

        OrderService orderService = new OrderService();
        OrderDetailService orderDetailService = new OrderDetailService();
        DeliveryService deliveryService = new DeliveryService();
        AddressService addressService = new AddressService();

        // Tạo đơn hàng
        Order order = new Order(
                user,
                cart.getVoucher(),
                "Đang giao hàng",
                cart.getTotalPrice(),
                cart.getLastPrice()
        );
        int idOrder = orderService.insertOrder(order);

        // Tạo chi tiết đơn hàng
        for (CartItem item : cart.getItems().values()) {
            OrderDetail orderDetail = new OrderDetail(idOrder, item.getStyle(), item.getQuantity());
            orderDetailService.insertOrderDetail(orderDetail);
        }

        // Xử lý giao hàng
        Delivery delivery = handleDelivery(request, cart, user, idOrder, addressService);
        deliveryService.insertDelivery(delivery);

        // Trả về đối tượng Ordered
        return new Ordered(
                cart, idOrder, order.getTimeOrdered(),
                user.getFullName(), delivery.getNote(),
                addressService.getAddressById(delivery.getIdAddress()).getAddressDetail(), delivery.getStatus()
        );
    }

    private Delivery handleDelivery(HttpServletRequest request, Cart cart, User user, int idOrder, AddressService addressService) {
        String otherAddress = request.getParameter("otherAddress");
        String note = request.getParameter("note");
        Delivery delivery;

        if (otherAddress == null) {
            if (user.getAddress() == null) {
                throw new IllegalStateException("Người dùng không có địa chỉ mặc định.");
            }
            delivery = new Delivery(
                    idOrder, user.getAddress().getId(), user.getFullName(), user.getNumberPhone(),
                    cart.getTotalArea(), cart.getShippingFee(), note, "Đang giao hàng"
            );
        } else {
            Address address = new Address(
                    addressService.getLastId() + 1,
                    request.getParameter("o-street"),
                    request.getParameter("o-commune"),
                    request.getParameter("o-city"),
                    request.getParameter("o-province")
            );
            addressService.insertAddress(address);

            delivery = new Delivery(
                    idOrder, address.getId(),
                    request.getParameter("o-fullName"),
                    request.getParameter("o-phone"),
                    cart.getTotalArea(), cart.getShippingFee(), note, "Đang giao hàng"
            );
        }
        return delivery;
    }
}
