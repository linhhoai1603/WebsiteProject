package controllers;

import java.io.*;
import java.util.List;

import dao.ProductDao;
import dao.StyleDao;
import dao.VoucherDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import models.Product;
import services.ProductService;
import services.StyleService;
import services.VoucherService;

@WebServlet(name = "HomeServlet", value = "/home")
public class HomeServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ProductService ps = new ProductService();
        HttpSession session = request.getSession();
        // danh sách sản phẩm nội thất bán chạy
        session.setAttribute("fabricHotSelling", ps.getProductsByCategorySort(2, 1, 4, 4));
        List<Product> productsHotSelling = ps.getProductsByCategorySort(1, 1, 8, 4);
        // lấy danh sách styles của sản phẩm
        StyleService sd = new StyleService();
        for (Product product : productsHotSelling) {
            product.setStyles(sd.getAllStylesByIDProduct(product.getId()));
        }
        // danh sách sản phẩm may mặc bán chạy nhất
        session.setAttribute("productHotSelling", productsHotSelling);
        List<Product> productsMostDiscount =  ps.getProductsByCategorySort(1, 1, 4, 5);
        for(Product product : productsMostDiscount){
            product.setStyles(sd.getAllStylesByIDProduct(product.getId()));
        }
        // danh sách sản phẩm may mặc mới nhất
        session.setAttribute("mostProductsNew", ps.getProductsByCategorySort(1, 1, 8, 1));
        // danh sách sản phẩm giảm giá nhiều nhất
        session.setAttribute("productsMostDiscount", productsMostDiscount);
        // sản phẩm mới nhất
        session.setAttribute("mostProductNew", ps.getProductsByCategorySort(1, 1, 1, 1).getFirst());
        // danh sách voucher
        VoucherService vd = new VoucherService();
        session.setAttribute("vouchers", vd.getVoucherByValid(1));
        // chuyển tới trang chủ
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }
}