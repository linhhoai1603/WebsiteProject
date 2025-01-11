package controllers;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;
import java.io.IOException;

@WebServlet("/admin/search-order")
public class SearchOrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String searchValue = req.getParameter("searchOrder");
        // Tìm đơn hàng theo searchValue
        // request.setAttribute("orders", foundOrders);
        req.getRequestDispatcher("/admin/management-orders.jsp").forward(req, resp);
    }
}
