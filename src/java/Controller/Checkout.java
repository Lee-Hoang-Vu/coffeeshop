/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.ProductDAO;
import DAO.ProductSizeDao;
import Model.Product;
import Model.ProductDTO;
import Model.ProductSize;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author asus
 */
public class Checkout extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = (String) request.getAttribute("name");
        String phone = (String) request.getAttribute("phone");
        String address = (String) request.getAttribute("address");
        int discount = (int) request.getAttribute("discount");
        String note = (String) request.getAttribute("note");
        double total = (double) request.getAttribute("total");
        List<ProductDTO> map = (List<ProductDTO>) request.getAttribute("mapOrder");
        String mess = (String) request.getAttribute("mess");
        ProductDAO pdao = new ProductDAO();
        ProductSizeDao pdsizeDAO = new ProductSizeDao();
        ArrayList<Product> plist = pdao.getProduct("", "", 1, "1");
        ArrayList<Product> plist2 = pdao.getProduct("2", "", 1, "1");
        ArrayList<Product> plist1 = pdao.getTopSelling();

//        Cookie[] cookies = request.getCookies();
//        if (cookies != null) {d
//            for (Cookie i : cookies) {
//                if (i.getName().equals("map")) {
//                    String value = i.getValue();
//                    String[] list = value.split("/");
//                    for (int idx = 0; idx < list.length; idx += 3) {
//                        Product p = pdao.getProductById(Integer.parseInt(list[idx]));
//                        ProductSize pdsize = null;
//                        if (!list[idx + 1].equals("none")) {
//                            pdsize = pdsizeDAO.getProductSizeById(Integer.parseInt(list[idx + 1]));
//                        }
//                    }
//                }
//            }
//        }
        int mode = 2;
        HttpSession session = request.getSession();
        session.setAttribute("map", map);
        request.setAttribute("name", name);
        request.setAttribute("phone", phone);
        request.setAttribute("address", address);
        request.setAttribute("discount", discount);
        request.setAttribute("note", note);
        request.setAttribute("mode", mode);
        request.setAttribute("total", total);
        request.setAttribute("mapOrder", map);
        request.setAttribute("mess", "Your order will be confirmed as soon as possible");
        request.getRequestDispatcher("checkout.jsp").forward(request, response);

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
