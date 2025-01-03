package dao;

import connection.DBConnection;
import models.Address;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;

public class AddressDao {
    Jdbi jdbi;
    Handle handle;
    public AddressDao() {
        jdbi = DBConnection.getConnetion();
    }
    public boolean updateAddress(int id , String province , String city , String street , String commune) {
        String sql = """
                Update addresses SET province = :province ,city = :city ,street = :street ,commune = :commune
                WHERE id = :id
                """;
        return jdbi.withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("id", id)
                        .bind("province",province )
                        .bind("city", city)
                        .bind("street", street)
                        .bind("commune",commune)
                        .execute() > 0
        );
    }

    public static void main(String[] args) {
        AddressDao dao = new AddressDao();
        System.out.println(dao.updateAddress(1,"Đồng Nai","Biên Hòa","Yêết Kiu","Lonng Bình"));
    }

}
