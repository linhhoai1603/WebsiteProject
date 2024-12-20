package services;

import dao.MessageDao;
import models.Message;
import models.User;

public class MessageService {
    private MessageDao messageDao;

    public MessageService(MessageDao messageDao) {
        this.messageDao = messageDao;
    }

    public void sendMessage(User user, String title, String content) {
        // Kiểm tra tính hợp lệ của dữ liệu (có thể thêm các điều kiện khác nếu cần)
        if (user == null) {
            throw new IllegalArgumentException("Người dùng không hợp lệ.");
        }
        if (title == null || title.trim().isEmpty()) {
            throw new IllegalArgumentException("Tiêu đề không được để trống.");
        }
        if (content == null || content.trim().isEmpty()) {
            throw new IllegalArgumentException("Nội dung không được để trống.");
        }

        // Tạo đối tượng Message
        Message message = new Message();
        message.setUser(user);
        message.setTitle(title);
        message.setContent(content);

        // Lưu tin nhắn vào cơ sở dữ liệu
        messageDao.insertMessage(message);

        // (Tuỳ chọn) Gửi email thông báo cho admin
        // sendEmailNotification(message);
    }

    // Phương thức gửi email thông báo (tuỳ chọn)
    /*
    private void sendEmailNotification(Message message) {
        // Implement email sending logic here
    }
    */
}


