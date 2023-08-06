/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.ProductDTO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author kienb
 */
public class updateCartController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String index = request.getParameter("idx");
            String quantity = request.getParameter("quantity");
            HttpSession session = request.getSession();
            Cookie[] cookies = request.getCookies();
            List<ProductDTO> map = (List<ProductDTO>) session.getAttribute("map");
            for (Cookie i : cookies) {
                if (i.getName().equals("map")) {
                    i.setMaxAge(0);
                    response.addCookie(i);
                    break;
                }
            }
            map.get(Integer.parseInt(index)).setQuantity(Integer.parseInt(quantity));
            session.setAttribute("map", map);
        StringBuilder value = new StringBuilder();
        for (int idx = 0; idx < map.size() - 1; idx++) {
            value.append(map.get(idx).getProduct().getId());
            value.append("/");
            value.append(map.get(idx).getProductSize() != null ? map.get(idx).getProductSize().getId() : "none");
            value.append("/");
            value.append(map.get(idx).getQuantity());
            value.append("/");
        }
        value.append(map.get(map.size() - 1).getProduct().getId());
        value.append("/");
        value.append(map.get(map.size() - 1).getProductSize() != null ? map.get(map.size() - 1).getProductSize().getId() : "none");
        value.append("/");
        value.append(map.get(map.size() - 1).getQuantity());
        Cookie c = new Cookie("map", value.toString());
        c.setMaxAge(7 * 60 * 60);
        response.addCookie(c);
        response.sendRedirect("cart");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
        processRequest(request, response);
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
