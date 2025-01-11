package services;

import dao.OrderDAO;
import models.Order;

import java.util.List;

public class OrderService {
    private final OrderDAO dao;
    private OrderDAO orderDAO;

    public OrderService() {
        dao = new OrderDAO();
    }

    public int insertOrder(Order order) {
        return dao.insertOrder(order);
    }

    public List<Order> getAllOrders() {
        return dao.getAllOrders();
    }

    public List<Order> getOrdersByUserId(int userId) {
        return dao.getOrdersByUserId(userId);
    }

    public String convertStatus(int status) {
        return switch (status) {
            case 0 -> "Đang giao hàng";
            case 1 -> "Đã thanh toán";
            case 2 -> "Đã giao hàng";
            default -> "Unknown";
        };
    }
    public boolean updateOrderStatus(int orderId, String status) {
        return orderDAO.updateOrderStatus(orderId, status);
    }
}
