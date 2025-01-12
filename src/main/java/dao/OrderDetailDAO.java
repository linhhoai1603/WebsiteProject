package dao;

import connection.DBConnection;
import models.Order;
import models.OrderDetail;
import models.Product;
import models.Style;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class OrderDetailDAO {
    Jdbi jdbi;
    public OrderDetailDAO(){ this.jdbi = DBConnection.getConnetion();
    }
    public boolean insertOrderDetail(OrderDetail detail){
        String query = "insert into order_details values (?,?,?,?,?,?)";
        return jdbi.withHandle(handle -> {
            return handle.createUpdate(query)
                    .bind(0, detail.getId())
                    .bind(1, detail.getIdOrder())
                    .bind(2, detail.getStyle().getId())
                    .bind(3, detail.getQuantity())
                    .bind(4, detail.getTotalPrice())
                    .bind(5, detail.getWeight())
                    .execute() > 0;
        });
    }

    public List<OrderDetail> getOrderDetailByOrder(int idOrder) {
        String query = """
        SELECT od.id AS idOrderDetail,
               od.idOrder,
               od.idStyle,
               od.quantity,
               od.totalPrice,
               od.weight,
               s.name AS styleName,
               p.name AS productName,
               p.id AS productId,
               p.area
        FROM order_details od
        JOIN styles s ON od.idStyle = s.id
        JOIN products p ON s.idProduct = p.id
        WHERE od.idOrder = :idOrder;
    """;
        return jdbi.withHandle(handle -> {
            return handle.createQuery(query)
                    .bind("idOrder", idOrder)
                    .map((rs, ctx) -> {
                        OrderDetail orderDetail = new OrderDetail();
                        orderDetail.setId(rs.getInt("idOrderDetail"));
                        orderDetail.setIdOrder(rs.getInt("idOrder"));
                        orderDetail.setQuantity(rs.getInt("quantity"));
                        orderDetail.setTotalPrice(rs.getDouble("totalPrice"));
                        orderDetail.setWeight(rs.getDouble("weight"));

                        // Assuming you have a Style object in the OrderDetail class
                        Style style = new Style();
                        style.setId(rs.getInt("idStyle"));
                        style.setName(rs.getString("styleName"));
                        orderDetail.setStyle(style);

                        // Assuming you have a Product object as well in the OrderDetail class
                        Product product = new Product();
                        product.setName(rs.getString("productName"));
                        product.setId(rs.getInt("productId"));
                        style.setProduct(product);

                        return orderDetail;
                    })
                    .list();
        });
    }

    public static void main(String[] args) {
        OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
        List<OrderDetail> orderDetails = orderDetailDAO.getOrderDetailByOrder(1);
        System.out.println(orderDetails);
    }
}
