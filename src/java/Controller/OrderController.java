/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.OrderDAO;
import Model.ProductDTO;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 *
 * @author kienb
 */
public class OrderController extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<ProductDTO> map = (List<ProductDTO>) session.getAttribute("map");
        if (map.isEmpty() || map.size() == 0) {
            String mess = "Không có sản phẩm nào trong giỏ hàng!!";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        } else {
            double total = 0;
            User user = (User) session.getAttribute("account");
            for (ProductDTO i : map) {
                double price = i.getProduct().getPrice() + (i.getProductSize() == null ? 0 : i.getProductSize().getPrice());
                total += price * i.getQuantity();
            }
            int discount = 0;
            if (user != null) {
                discount = (int) (user.getPoint());
            }
            int mode = 1;
            request.setAttribute("mode", mode);
            request.setAttribute("discount", discount);
            request.setAttribute("total", total);
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        }
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
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String note = request.getParameter("note");
        HttpSession session = request.getSession();
        List<ProductDTO> map = (List<ProductDTO>) session.getAttribute("map");
  //      session.removeAttribute("map");
        Cookie[] cookies = request.getCookies();
        for (Cookie i : cookies) {
            if (i.getName().equals("map")) {
                i.setMaxAge(0);
                response.addCookie(i);
                break;
            }
        }
        double total = 0;
        User user = (User) session.getAttribute("account");
        for (ProductDTO i : map) {
            double price = i.getProduct().getPrice() + (i.getProductSize() == null ? 0 : i.getProductSize().getPrice());
            total += price * i.getQuantity();
        }
        OrderDAO od = new OrderDAO();
        int discount = 0;
        if (user != null) {
            discount = (int) (user.getPoint());
        }
        if (total >= 500 && user != null) {
            int point = 0;
            point = (int) total * 1 / 100;
            od.updateUser(point, user.getId());
        } else if (total < 500 && user != null) {
            od.updateUser(0, user.getId());
        }

        od.insertOrder(name, phone, address, note, discount, new Date(), user, map);
        int mode = 2;
        request.setAttribute("name", name);
        request.setAttribute("phone", phone);
        request.setAttribute("address", address);
        request.setAttribute("discount", discount);
        request.setAttribute("note", note);
        request.setAttribute("mode", mode);
        request.setAttribute("total", total);
        request.setAttribute("mapOrder", map);
        request.setAttribute("mess", "Your order will be confirmed as soon as possible");
        //     response.sendRedirect("Home");
        request.getRequestDispatcher("Checkout").forward(request, response);
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
