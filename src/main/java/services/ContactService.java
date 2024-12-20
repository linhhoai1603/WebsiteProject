package services;

import dao.MessageDao;
import models.Message;
import models.User;

public class ContactService {
    private final MessageDao messageDao;

    public ContactService() {
        this.messageDao = new MessageDao();
    }

    public void sendMessage(User user, String title, String content) {
        // Có thể thêm các bước xử lý bổ sung ở đây nếu cần
        Message message = new Message(content, title, user, 0); // ID sẽ được tự động tạo
        messageDao.insertMessage(message);
    }
}
