package dao;

import connection.DBConnection;
import models.Message;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;

public class MessageDao {
    private final Jdbi jdbi;

    public MessageDao() {
        this.jdbi = DBConnection.getJdbi();
    }

    // Tạo một tin nhắn mới
    public void insertMessage(Message message) {
        jdbi.useHandle(handle -> {
            handle.createUpdate("INSERT INTO message (idUser, title, content) VALUES (:userId, :title, :content)")
                    .bind("userId", message.getUser().getId())
                    .bind("title", message.getTitle())
                    .bind("content", message.getContent())
                    .execute();
        });
    }

    // Có thể thêm các phương thức khác như getMessageById, getAllMessages, v.v...
}
