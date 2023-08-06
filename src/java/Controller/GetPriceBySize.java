/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.ProductDAO;
import Model.ProductSize;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author asus
 */
public class GetPriceBySize extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String sizeId = request.getParameter("sizeId");
        String productId = request.getParameter("productId");
        // Gọi phương thức truy vấn cơ sở dữ liệu để lấy giá của size tương ứng
        double sizePrice = getPriceBySize(sizeId, productId);

        // Gửi giá của size về phía client dưới dạng phản hồi AJAX
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        out.write(String.valueOf(sizePrice));
        out.close();
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private double getPriceBySize(String sizeId, String productId) {
        ProductDAO dao = new ProductDAO();
        ProductSize psize = dao.getProductSizeByID(Integer.parseInt(sizeId)); 
        double price = psize.getPrice();      
        return price; 
    }
}
