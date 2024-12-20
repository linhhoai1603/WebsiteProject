package dao;

import connection.DBConnection;
import models.Message;
import models.User;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.mapper.reflect.BeanMapper;

import java.util.List;

public class MessageDao {
    private Jdbi jdbi;

    public MessageDao(Jdbi jdbi) {
        this.jdbi = jdbi;
        // Đăng ký BeanMapper cho User và Message
        jdbi.registerRowMapper(BeanMapper.factory(User.class));
        jdbi.registerRowMapper(BeanMapper.factory(Message.class));
    }

    public MessageDao() {

    }

    // Thêm một tin nhắn mới vào cơ sở dữ liệu
    public void insertMessage(Message message) {
        jdbi.useHandle(handle ->
                handle.createUpdate("INSERT INTO message (idUser, title, content) VALUES (:idUser, :title, :content)")
                        .bind("idUser", message.getUser().getId())
                        .bind("title", message.getTitle())
                        .bind("content", message.getContent())
                        .execute()
        );
    }

    // Lấy danh sách tất cả tin nhắn kèm thông tin người dùng
    public List<Message> getAllMessages() {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT m.id, m.title, m.content, u.id AS user_id, u.email, u.fullName, u.phoneNumber, u.idAddress, u.image " +
                                "FROM message m JOIN users u ON m.idUser = u.id")
                        .map((rs, ctx) -> {
                            Message message = new Message();
                            message.setId(rs.getInt("id"));
                            message.setTitle(rs.getString("title"));
                            message.setContent(rs.getString("content"));

                            User user = new User();
                            user.setId(rs.getInt("user_id"));
                            user.setEmail(rs.getString("email"));
                            user.setFullName(rs.getString("fullName"));
                            user.setPhoneNumber(rs.getString("phoneNumber"));
                            user.setIdAddress(rs.getInt("idAddress"));
                            user.setImage(rs.getString("image"));

                            message.setUser(user);
                            return message;
                        })
                        .list()
        );
    }

    // Lấy tin nhắn theo ID người dùng
    public List<Message> getMessagesByUserId(int idUser) {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT m.id, m.title, m.content, u.id AS user_id, u.email, u.fullName, u.phoneNumber, u.idAddress, u.image " +
                                "FROM message m JOIN users u ON m.idUser = u.id WHERE m.idUser = :idUser")
                        .bind("idUser", idUser)
                        .map((rs, ctx) -> {
                            Message message = new Message();
                            message.setId(rs.getInt("id"));
                            message.setTitle(rs.getString("title"));
                            message.setContent(rs.getString("content"));

                            User user = new User();
                            user.setId(rs.getInt("user_id"));
                            user.setEmail(rs.getString("email"));
                            user.setFullName(rs.getString("fullName"));
                            user.setPhoneNumber(rs.getString("phoneNumber"));
                            user.setIdAddress(rs.getInt("idAddress"));
                            user.setImage(rs.getString("image"));

                            message.setUser(user);
                            return message;
                        })
                        .list()
        );
    }
}
