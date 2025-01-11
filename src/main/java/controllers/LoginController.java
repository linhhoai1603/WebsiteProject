package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.AccountUser;
import services.AuthenServies;
import services.UserService;
import services.application.HashUtil;

import java.io.IOException;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Chuyển hướng đến trang đăng nhập
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Kiểm tra username và password không được để trống
        if (username == null || password == null || username.trim().isEmpty() || password.trim().isEmpty()) {
            request.setAttribute("error", "Tên đăng nhập và mật khẩu không được để trống.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // Kiểm tra đăng nhập
        AuthenServies authen = new AuthenServies();
        AccountUser acc = authen.checkLogin(username, HashUtil.encodePasswordBase64(password));

        if (acc != null) {
            // Kiểm tra tài khoản có bị khóa không
            if (acc.getLocked() == 1) {
                request.setAttribute("username", username);
                request.setAttribute("error", "Tài khoản đã bị khóa. Vui lòng liên hệ quản trị viên.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            // Xác định quyền hạn và điều hướng
            int role = acc.getRole();
            HttpSession session = request.getSession();
            session.setAttribute("user", acc.getUser());
            session.setAttribute("account", acc);

            if (role == 2) {
                // Điều hướng đến trang Admin
                response.sendRedirect(request.getContextPath() + "/admin/dashboard");
            } else if (role == 1) {
                // Điều hướng đến trang người dùng
                response.sendRedirect(request.getContextPath() + "/home");
            } else {
                // Trường hợp role không hợp lệ
                request.setAttribute("error", "Vai trò của tài khoản không hợp lệ. Liên hệ quản trị viên.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else {
            // Sai tên đăng nhập hoặc mật khẩu
            request.setAttribute("username", username);
            request.setAttribute("error", "Tài khoản hoặc mật khẩu không chính xác.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
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
