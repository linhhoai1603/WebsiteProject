    package connection;

    import com.mysql.cj.jdbc.MysqlDataSource;
    import models.Product;
    import models.User;
    import org.jdbi.v3.core.Jdbi;

    import java.util.List;

    public class DBConnection {
       public static Jdbi jdbi;


        public static Jdbi getJdbi() {
            if (jdbi == null) {
                getConnetion();
            }
            return jdbi;
        }

        // cung cấp kết nối Jdbi
        public static Jdbi getConnetion() {
            MysqlDataSource dataSource = new MysqlDataSource();
            dataSource.setURL("jdbc:mysql://"+ DBProperties.HOST+":"+DBProperties.PORT+"/"+DBProperties.NAME+"?"+DBProperties.OPTIONS);
            dataSource.setUser(DBProperties.USER);
            dataSource.setPassword(DBProperties.PASS);
            try {
                dataSource.setAutoReconnect(true);
                dataSource.setUseCompression(true);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return jdbi = Jdbi.create(dataSource); // tạo đối tượng Jdbi từ MysqlDataSource
        }

        public static void main(String[] args) {
            int aidi = 1;
            List<Product> products = getJdbi().withHandle(handle ->
                    handle.createQuery("SELECT * FROM products where id = ?").bind(0, aidi)
                            .mapToBean(Product.class)
                            .list()
            );
            System.out.println(products);
        }
    }
