/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.OrderDAO;
import Model.Order;
import Model.OrderDetail;
import com.google.gson.Gson;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author asus
 */
public class GetOrderDetail extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("orderId");
        int id = Integer.parseInt(orderId);
        OrderDAO dao = new OrderDAO();
        Order order = dao.getOrderById(id);
        ArrayList<OrderDetail> orderDetails = dao.getOrderDetail(id);

        // Tính tổng số tiền
        double totalAmount = 0.0;
        for (OrderDetail orderDetail : orderDetails) {
            double amount = orderDetail.getAmount() - (orderDetail.getAmount() * orderDetail.getDiscount() / 100);
            totalAmount += amount;
        }

        // Tạo chuỗi HTML tương ứng với thông tin đơn hàng
        StringBuilder htmlBuilder = new StringBuilder();
        htmlBuilder.append("<p><strong>Order ID:</strong>").append(order.getId()).append("</p>");
        htmlBuilder.append("<p><strong>Order Name:</strong> ").append(order.getOrderName()).append("</p>");
        htmlBuilder.append("<p><strong>Status:</strong> ").append(order.getStatus().getName()).append("</p>");
        htmlBuilder.append("<p><strong>Order Date:</strong> ").append(order.formatDate()).append("</p>");
        htmlBuilder.append("<p><strong>Discount:</strong> ").append(order.getDiscount()).append("%</p>");
        String orderInfoHtml = htmlBuilder.toString();

        // Tạo chuỗi HTML tương ứng với chi tiết sản phẩm
        StringBuilder productHtmlBuilder = new StringBuilder();
        for (OrderDetail orderDetail : orderDetails) {
            productHtmlBuilder.append("<tr>");
            productHtmlBuilder.append("<td>").append(orderDetail.getProduct().getName()).append("</td>");
            productHtmlBuilder.append("<td style=\"text-align: center;\">").append(String.format("%.3f", orderDetail.getOrderPrice())).append("</td>");
            productHtmlBuilder.append("<td style=\"text-align: center;\">").append(orderDetail.getQuanlity()).append("</td>");
            productHtmlBuilder.append("<td>").append(String.format("%.3f", orderDetail.getAmount())).append("</td>");
            productHtmlBuilder.append("</tr>");
        }
        String productDetailsHtml = productHtmlBuilder.toString();

        // Tạo chuỗi HTML hoàn chỉnh kết hợp thông tin đơn hàng và chi tiết sản phẩm
        StringBuilder completeHtmlBuilder = new StringBuilder();
        completeHtmlBuilder.append("<div class=\"bill-section\">")
                .append("<h5 class=\"bill-section-title\">Order Information</h5>")
                .append("<div class=\"bill-info\">")
                .append(orderInfoHtml)
                .append("</div>")
                .append("</div>")
                .append("<div class=\"bill-section\">")
                .append("<h5 class=\"bill-section-title\">Product details</h5>")
                .append("<table class=\"bill-table\" border=\"1px\">")
                .append("<thead>")
                .append("<tr>")
                .append("<th>product name</th>")
                .append("<th>price</th>")
                .append("<th>quantity</th>")
                .append("<th>Amount</th>")
                .append("</tr>")
                .append("</thead>")
                .append("<tbody id=\"product-details\">")
                .append(productDetailsHtml)
                .append("</tbody>")
                .append("</table>")
                .append("</div>")
                .append("<div class=\"bill-section\">")
                .append("<div class=\"bill-info\">")
                .append("<p><strong>Total Amount:</strong> <span id=\"total-amount\">").append(String.format("%.3f", totalAmount)).append("</span></p>")
                .append("</div>")
                .append("</div>");

        String completeHtml = completeHtmlBuilder.toString();

        // Gửi chuỗi HTML về cho JavaScript
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(completeHtml);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.doGet(request, response);
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

}
