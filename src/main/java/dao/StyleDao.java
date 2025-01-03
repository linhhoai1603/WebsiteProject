package dao;

import connection.DBConnection;
import models.Category;
import models.Price;
import models.Product;
import models.Style;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class StyleDao {
    private Jdbi jdbi;
    public StyleDao() {
        jdbi = DBConnection.getConnetion();
    }
    public Style findById(int id) {

        String sql = "SELECT * FROM styles WHERE id = :id";
        return jdbi.withHandle(h ->
                h.createQuery(sql).mapToBean(Style.class).findOne().orElse(null));
    }
    public Style findById(String name) {

        String sql = "SELECT * FROM styles WHERE name = :name";
        return jdbi.withHandle(h ->
                h.createQuery(sql).mapToBean(Style.class).findOne().orElse(null));
    }
    public List<Style> findAll() {

        String sql = "SELECT * FROM styles";
        return jdbi.withHandle(handle ->
                handle.createQuery(sql).mapToBean(Style.class).list());
    }
    public List<Style> getAllStylesByIDProduct(int idProduct) {
        String query = "select * from styles where idProduct = ?";
        return jdbi.withHandle(handle -> {
            return handle.createQuery(query)
                    .bind(0, idProduct)
                    .mapToBean(Style.class)
                    .list();
        });
    }
    public Style getStyleByID(int idStyle){
        String query = "SELECT s.id, s.name, s.image, p.id AS idProduct, p.name AS nameProduct, pr.lastPrice, p.idPrice, c.id AS idCategory " +
                "FROM styles s " +
                "JOIN products p ON s.idProduct = p.id " +
                "JOIN prices pr ON p.idPrice = pr.id " +
                "JOIN categories c ON p.idCategory = c.id " +
                "WHERE s.id = :idStyle";
        return jdbi.withHandle(handle -> {
           return handle.createQuery(query)
                   .bind("idStyle", idStyle)
                   .map((rs, ctx) ->{
                       Style style = new Style();
                       style.setId(rs.getInt("id"));
                       style.setName(rs.getString("name"));
                       style.setImage(rs.getString("image"));
                       Product product = new Product();
                       product.setId(rs.getInt("idProduct"));
                       product.setName(rs.getString("nameProduct"));
                       Price price = new Price();
                       price.setId(rs.getInt("idPrice"));
                       price.setLastPrice(rs.getDouble("lastPrice"));
                       Category category = new Category();
                       category.setId(rs.getInt("idCategory"));
                       product.setCategory(category);
                       product.setPrice(price);
                       style.setProduct(product);
                       return style;
                   }).list().getFirst();
        });
    }
}
