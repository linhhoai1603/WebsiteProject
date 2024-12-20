package controllers;

import dao.MessageDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.User;
import org.jdbi.v3.core.Jdbi;
import services.MessageService;
import connection.DBConnection;

import java.io.IOException;

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MessageService messageService;

    @Override
    public void init() throws ServletException {
        super.init();
        Jdbi jdbi = DBConnection.getJdbi();
        MessageDao messageDao = new MessageDao(jdbi);
        messageService = new MessageService(messageDao);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Thiết lập mã hóa ký tự
        request.setCharacterEncoding("UTF-8");

        // Lấy thông tin từ form
        String title = request.getParameter("subject");
        String content = request.getParameter("message");
        String contactTime = request.getParameter("contactTime"); // Honeypot field

        // Kiểm tra honeypot field để chống spam
        if (contactTime != null && !contactTime.isEmpty()) {
            // Nếu trường honeypot được điền, coi đây là spam và bỏ qua xử lý
            response.sendRedirect("contact.jsp");
            return;
        }

        // Kiểm tra các trường bắt buộc
        if (title == null || title.trim().isEmpty() ||
                content == null || content.trim().isEmpty()) {
            request.setAttribute("error", "Vui lòng điền đầy đủ các trường bắt buộc.");
            request.getRequestDispatcher("contact.jsp").forward(request, response);
            return;
        }

        // Lấy thông tin người dùng hiện tại từ session (giả sử bạn đã lưu User vào session khi đăng nhập)
        User currentUser = (User) request.getSession().getAttribute("currentUser");
        if (currentUser == null) {
            // Người dùng chưa đăng nhập, chuyển hướng đến trang đăng nhập hoặc hiển thị lỗi
            request.setAttribute("error", "Vui lòng đăng nhập để gửi tin nhắn.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        try {
            // Gọi service để xử lý gửi tin nhắn
            messageService.sendMessage(currentUser, title, content);

            // Nếu thành công, chuyển hướng và hiển thị thông báo thành công
            request.setAttribute("success", "Cảm ơn bạn đã liên hệ với chúng tôi!");
            request.getRequestDispatcher("contact.jsp").forward(request, response);
        } catch (IllegalArgumentException e) {
            // Nếu có lỗi về dữ liệu đầu vào, hiển thị thông báo lỗi
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("contact.jsp").forward(request, response);
        } catch (Exception e) {
            // Nếu có lỗi khác, hiển thị thông báo lỗi
            e.printStackTrace();
            request.setAttribute("error", "Đã xảy ra lỗi khi gửi yêu cầu. Vui lòng thử lại sau.");
            request.getRequestDispatcher("contact.jsp").forward(request, response);
        }
    }
}
