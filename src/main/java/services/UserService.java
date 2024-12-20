package services;

import dao.UserDao;
import org.mindrot.jbcrypt.BCrypt;

public class UserService {
    private UserDao userDao;

    public UserService(UserDao userDao) {
        this.userDao = userDao;
    }

    public void registerUser(String email, String password, String fullName, String phoneNumber, int idAddress, String image) {
        if (userDao.emailExists(email)) {
            throw new RuntimeException("Email đã được sử dụng.");
        }

        int idUser = userDao.insertUser(email, fullName, phoneNumber, idAddress, image);
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt(12));
        userDao.insertAccountUser(idUser, email, hashedPassword, 1, 0, 0);
    }


}
