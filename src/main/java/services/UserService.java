package services;

import dao.UserDao;
import models.AccountUser;
import models.User;
import services.application.HashUtil;

import java.util.List;
// Đảm bảo bạn import HashUtil từ package services


public class UserService {
    private UserDao userDao;

    public UserService(UserDao userDao) {
        this.userDao = userDao;
    }
    public UserService() {
        this.userDao = new UserDao();
    }

    public void registerUser(String username, String password,
                             String fullName, String phoneNumber,
                             int idAddress, String image) {
        // Kiểm tra username
        if (username == null || username.isEmpty()) {
            throw new RuntimeException("Username không được để trống.");
        }

        // Kiểm tra username đã tồn tại chưa (chỉ ở account_users)
        if (userDao.usernameExists(username)) {
            throw new RuntimeException("Username đã được sử dụng.");
        }

        String fakeEmail = "";

        int newUserId = userDao.insertUser(fakeEmail, fullName, phoneNumber, idAddress, image); // add user

        userDao.insertAccountUser(newUserId, username, password, 1, 0, 0); // add accont_user
    }


    public boolean checkHaveEmail(String username, String email) {
        return userDao.checkHaveEmail(username, email);
    }
    public List<AccountUser> getAllUser() {
        return userDao.getAllUser();
    }
    public boolean lockUser(int id) {
        return userDao.lockUser(id);
    }
    public boolean unlockUser(int id) {
        return userDao.unlockUser(id);
    }
    public List<AccountUser> searchUser(String name) {
        return userDao.findUserByName(name);
    }

    public void registerAdmin(String username, String password,
                              String fullName, String phoneNumber,
                              int idAddress, String image) {
        // Kiểm tra username
        if (username == null || username.isEmpty()) {
            throw new RuntimeException("Username không được để trống.");
        }

        // Kiểm tra username đã tồn tại chưa
        if (userDao.usernameExists(username)) {
            throw new RuntimeException("Username đã được sử dụng.");
        }

        String fakeEmail = "admin@example.com";

        // Thêm User mới vào bảng users
        int newUserId = userDao.insertUser(fakeEmail, fullName, phoneNumber, idAddress, image);

        // Thêm tài khoản Admin (role = 2) vào bảng account_users
        userDao.insertAccountUser(newUserId,username, HashUtil.encodePasswordBase64(password), 2, 0, 0);
    }

    public static void main(String[] args) {
        UserService userService = new UserService();
        try {
            userService.registerAdmin(
                    "admin",                 // Tên đăng nhập
                    "123456",                // Mật khẩu
                    "Admin User",            // Tên đầy đủ
                    "0123456789",            // Số điện thoại
                    1,                       // ID địa chỉ (cần tồn tại trong DB)
                    "default-avatar.png"     // Avatar mặc định
            );
            System.out.println("Tạo tài khoản Admin thành công!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}

