package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.OrderService;
import models.Order;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderManagementController", value = "/admin/orders")
public class OrderManagementController extends HttpServlet {
    private OrderService orderService;

    @Override
    public void init() throws ServletException {
        orderService = new OrderService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy danh sách đơn hàng từ DB
        List<Order> orders = orderService.getAllOrders();

        // Kiểm tra xem có thực sự lấy được danh sách đơn hàng không
        System.out.println("orders.size() = " + (orders != null ? ((java.util.List<?>) orders).size() : 0));

        // Set attribute cho JSP
        request.setAttribute("orders", orders);

        // Forward đến trang JSP quản lý đơn hàng
        request.getRequestDispatcher("/admin/management-orders.jsp").forward(request, response);
    }
}
