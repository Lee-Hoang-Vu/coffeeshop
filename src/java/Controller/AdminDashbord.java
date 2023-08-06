/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Order;
import com.google.gson.Gson;

import DAO.OrderDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 *
 * @author HC
 */
public class AdminDashbord extends HttpServlet {

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
        Gson gsonObj = new Gson();
        OrderDAO orderDAO = new OrderDAO();
        ArrayList<Order> orders = orderDAO.getOrder();
        orders.forEach(order -> order.setOrderdetails(orderDAO.getOrderDetail(order.getId())));
        List<Map<String, Object>> list = orders.stream()
                
                .map((Order order) -> {
                    Map<String, Object> map = new HashMap<>();
                    Timestamp timestamp = new Timestamp(order.getDate().getTime());
                    Map<Timestamp, Long> orderCount = orders.stream()
                            .collect(Collectors.groupingBy(o -> new Timestamp(o.getDate().getTime()), Collectors.counting()));
                    int footfall = orders.stream()
                            .filter(o -> o.getDate().equals(order.getDate()))
                            .mapToInt(o -> 1)
                            .sum();
                    
                    double revenue = orders.stream()
                            .filter(o -> o.getDate().equals(order.getDate()))
                            .flatMap(o -> o.getOrderdetails().stream())
                            .mapToDouble(orderDetail -> orderDetail.getOrderPrice())
                            .sum();
                    map.put("date", timestamp.toString());
                    map.put("order", orderCount.get(timestamp));
                    map.put("footfall", footfall);
                    map.put("revenue", revenue);
                    return map;
        })
                .collect(Collectors.toList());
        Map<String, List<Map<String, Object>>> data = new HashMap<>();
        data.put("data", list);
        String dataPoints = gsonObj.toJson(data);
        int order = orderDAO.countOrder();
        int user = orderDAO.countUser();
        int amount = orderDAO.sumAmount();
        request.setAttribute("dataPoints", dataPoints);
        request.setAttribute("order", order);
        request.setAttribute("user", user);
        request.setAttribute("amount", amount);
        request.getRequestDispatcher("AdminDashbord.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}