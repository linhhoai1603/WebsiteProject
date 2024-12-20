package controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import models.User;
import services.ContactService;

import java.io.IOException;

@WebServlet(name = "ContactServlet", value = "/ContactServlet")
public class ContactServlet extends HttpServlet {

    private ContactService contactService;

    @Override
    public void init() throws ServletException {
        super.init();
        contactService = new ContactService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("contact.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String messageContent = request.getParameter("message");
        String contactTime = request.getParameter("contactTime"); // Honeypot field

        // Kiểm tra honeypot để chống spam
        if (contactTime != null && !contactTime.isEmpty()) {
            request.setAttribute("honeypotError", "Form không hợp lệ.");
            request.getRequestDispatcher("contact.jsp").forward(request, response);
            return;
        }

        if (name.isEmpty() || email.isEmpty() || messageContent.isEmpty()) {
            request.setAttribute("error", "Vui lòng điền đầy đủ các trường.");
            request.getRequestDispatcher("contact.jsp").forward(request, response);
        } else {
            try {
                // Giả sử bạn có hệ thống đăng nhập và có đối tượng User hiện tại
                // Nếu không, bạn có thể tạo một User tạm thời hoặc xử lý theo cách khác
                User user = getCurrentUser(request); // Implement phương thức này phù hợp với ứng dụng của bạn

                contactService.sendMessage(user, name + " - " + email, messageContent);

                request.setAttribute("success", "Tin nhắn đã được gửi thành công.");
                request.getRequestDispatcher("contact.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("formError", "Đã xảy ra lỗi khi gửi yêu cầu: " + e.getMessage());
                request.getRequestDispatcher("contact.jsp").forward(request, response);
            }
        }
    }

    public void User() {

    }

    private User getCurrentUser(HttpServletRequest request) {
        // Implement phương thức này để lấy thông tin người dùng hiện tại
        // Ví dụ: lấy từ session
        HttpSession session = request.getSession(false);
        if (session != null) {
            return (User) session.getAttribute("user");
        }
        // Nếu không có người dùng đăng nhập, bạn có thể tạo một User tạm thời hoặc xử lý khác
        User anonymous = new User();
        anonymous.setId(0); // ID cho người dùng ẩn danh
        anonymous.setName("Anonymous");
        return anonymous;
    }
}
