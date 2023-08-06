/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAO.OrderDAO;
import Model.Order;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.ArrayList;
/**
 *
 * @author asus
 */
public class ManageOrder extends HttpServlet {
   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        OrderDAO dao = new OrderDAO(); 
        ArrayList<Order> orderList = dao.getOrder(); 
        request.setAttribute("olist", orderList);
        request.getRequestDispatcher("ManageOrder.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
      String firstDate = request.getParameter("firstDate"); 
      String secondDate = request.getParameter("secondDate"); 
      OrderDAO dao = new OrderDAO();
      Date fdate = Date.valueOf(firstDate); 
      Date sdate = Date.valueOf(secondDate); 
      ArrayList<Order> orderList = dao.getOrderByDate(fdate,sdate); 
      request.setAttribute("olist", orderList);
      request.getRequestDispatcher("ManageOrder.jsp").forward(request, response);    
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
