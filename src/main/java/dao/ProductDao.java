package dao;

import connection.DBConnection;
import models.Category;
import models.Price;
import models.Product;
import models.TechnicalInfo;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class ProductDao {
    private Jdbi jdbi;
    public ProductDao() {
        jdbi = DBConnection.getConnetion();
    }
    public int getNumberPageProductByCategory(int idCategory, int pageSize) {
        String query = "select count(*) from products where idCategory = ? ";
        int size =  jdbi.withHandle(handle -> {
            return handle.createQuery(query)
                    .bind(0, idCategory)
                    .mapTo(Integer.class).first();
        });
        return (size % pageSize == 0) ? size / pageSize : size / pageSize + 1;
    }
    public List<Product> getProductsByCategoryBySort(int idCategory, int pageNumber, int pageSize, int options) {
        String sortBy = "";
        String sortOrder = "";
        String groupBy = "";
        String join = "";
        String sum = "";

        switch (options) {
            case 1:
                sortBy = " p.addedDate ";
                sortOrder = " DESC ";
                break;
            case 2:
                sortBy = " pr.lastPrice ";
                sortOrder = " DESC ";
                break;
            case 3:
                sortBy = " pr.lastPrice ";
                sortOrder = " ASC ";
                break;
            case 4:
                sortBy = " totalProduct ";
                sortOrder = " DESC ";
                join = """
                LEFT JOIN styles s ON s.idProduct = p.id
                LEFT JOIN order_details od ON od.idStyle = s.id
                """;
                groupBy = """
                GROUP BY p.id, p.name, p.quantity, p.addedDate, p.description, 
                         p.area, p.selling, p.img, c.id, c.name, 
                         t.id, t.specifications, t.manufactureDate, 
                         pr.id, pr.price, pr.discountPercent, pr.lastPrice
                """;
                sum = ", SUM(od.quantity) AS totalProduct "; // tổng số lượng đã bán
                break;
            case 5 :
                sortBy = " pr.discountPercent ";
                sortOrder = " DESC ";
                break;
            default:
                sortBy = " p.id ";
                sortOrder = " ASC "; // mặc định sắp xếp theo id
                break;
        }

        String query = """
        SELECT 
            p.id AS idProduct,
            p.name AS nameProduct,
            p.quantity,
            p.addedDate,
            p.description,
            p.area,
            p.selling,
            p.img,
            c.id AS idCategory,
            c.name AS categoryName,
            t.id AS idTechnicalInfo,
            t.specifications,
            t.manufactureDate,
            pr.id AS idPrice,
            pr.price,
            pr.discountPercent,
            pr.lastPrice
            """ + sum + """
        FROM products p
        JOIN categories c ON p.idCategory = c.id
        JOIN technical_information t ON p.id = t.id
        JOIN prices pr ON p.idPrice = pr.id
        """ + join + """
        WHERE p.idCategory = ? and p.quantity > 0 and p.selling > 0
        """ + groupBy + """
        ORDER BY """ + sortBy + " " + sortOrder + """
        LIMIT ? OFFSET ?;
    """;

        return jdbi.withHandle(handle -> handle.createQuery(query)
                .bind(0, idCategory)
                .bind(1, pageSize)
                .bind(2, (pageNumber - 1) * pageSize)
                .map((rs, ctx) -> {
                    // Product
                    Product product = new Product();
                    product.setId(rs.getInt("idProduct"));
                    product.setName(rs.getString("nameProduct"));
                    product.setQuantity(rs.getInt("quantity"));
                    product.setDateAdded(rs.getDate("addedDate").toLocalDate());
                    product.setDescription(rs.getString("description"));
                    product.setArea(rs.getDouble("area"));
                    product.setSelling(rs.getInt("selling"));
                    product.setImage(rs.getString("img"));

                    // Category
                    Category category = new Category();
                    category.setId(rs.getInt("idCategory"));
                    category.setName(rs.getString("categoryName"));
                    product.setCategory(category);

                    // Technical Information
                    TechnicalInfo technicalInfo = new TechnicalInfo();
                    technicalInfo.setId(rs.getInt("idTechnicalInfo"));
                    technicalInfo.setSpecification(rs.getString("specifications"));
                    technicalInfo.setManufactureDate(rs.getDate("manufactureDate"));
                    product.setTechnicalInfo(technicalInfo);

                    // Price
                    Price price = new Price();
                    price.setId(rs.getInt("idPrice"));
                    price.setPrice(rs.getDouble("price"));
                    price.setDiscountPercent(rs.getDouble("discountPercent"));
                    price.setLastPrice(rs.getDouble("lastPrice"));
                    product.setPrice(price);

                    return product;
        }).list());
    }

    public static void main(String[] args) {
        ProductDao dao = new ProductDao();
        System.out.println(dao.getProductsByCategoryBySort(2, 1, 4, 4));
    }
}
