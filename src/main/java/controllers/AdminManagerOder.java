package controllers;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Order;
import services.OrderService;

import java.io.IOException;
import java.util.List;

@WebServlet(value = "/admin/manager-order")
public class AdminManagerOder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int loca = request.getParameter("loca") == null ? 1 : Integer.parseInt(request.getParameter("loca"));
        OrderService os = new OrderService();
        int nuPage = os.getNuPage(15);
        List<Order> orders = os.getOrdersByPage(loca,15);
        request.setAttribute("orders", orders);
        request.setAttribute("nuPage", nuPage);

        request.getRequestDispatcher("management-orders.jsp").forward(request, response);
    }

}