package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.OrderService;

import java.io.IOException;

@WebServlet(name = "UpdateOrderStatusController", value = "/admin/update-order-status")
public class UpdateOrderStatusController extends HttpServlet {
    private OrderService orderService;

    @Override
    public void init() throws ServletException {
        orderService = new OrderService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin từ form
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        String newStatus = request.getParameter("status");

        // Cập nhật trạng thái đơn hàng
        boolean isUpdated = orderService.updateOrderStatus(orderId, newStatus);

        if (isUpdated) {
            // Chuyển về danh sách đơn hàng với thông báo thành công
            response.sendRedirect(request.getContextPath() + "/admin/orders?success=updated");
        } else {
            // Thông báo lỗi nếu cập nhật thất bại
            response.sendRedirect(request.getContextPath() + "/admin/orders?error=update_failed");
        }
    }
}
