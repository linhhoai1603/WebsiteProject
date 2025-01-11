package dao;

import connection.DBConnection;
import models.Order;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class OrderDAO {
    private Jdbi jdbi;

    public OrderDAO() {
        jdbi = DBConnection.getConnetion();
    }

    public int insertOrder(Order order) {
        String query = """
            INSERT INTO orders (timeOrder, idUser, idVoucher, statusOrder, totalPrice, lastPrice)
            VALUES (?, ?, ?, ?, ?, ?)
        """;
        return jdbi.withHandle(handle ->
                handle.createUpdate(query)
                        .bind(0, order.getTimeOrdered())
                        .bind(1, order.getUser().getId())
                        .bind(2, order.getVoucher() != null ? order.getVoucher().getIdVoucher() : null)
                        .bind(3, order.getStatus())
                        .bind(4, order.getTotalPrice())
                        .bind(5, order.getLastPrice())
                        .executeAndReturnGeneratedKeys("id")
                        .mapTo(Integer.class)
                        .findOnly()
        );
    }

    public List<Order> getAllOrders() {
        String query = "SELECT * FROM orders ORDER BY timeOrder DESC";
        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .mapToBean(Order.class)
                        .list()
        );
    }

    public List<Order> getOrdersByUserId(int userId) {
        String query = "SELECT * FROM orders WHERE idUser = :userId ORDER BY timeOrder DESC";
        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind("userId", userId)
                        .mapToBean(Order.class)
                        .list()
        );
    }

    public boolean updateOrderStatus(int orderId, String status) {
        String query = "UPDATE orders SET statusOrder = :status WHERE id = :orderId";
        int rowsAffected = jdbi.withHandle(handle ->
                handle.createUpdate(query)
                        .bind("status", status)
                        .bind("orderId", orderId)
                        .execute()
        );
        return rowsAffected > 0;
    }
}
