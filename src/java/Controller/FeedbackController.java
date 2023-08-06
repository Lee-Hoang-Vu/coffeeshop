/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.FeedbackDAO;
import DAO.ProductDAO;
import Model.Feedback;
import Model.Product;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author DELL
 */
public class FeedbackController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        FeedbackDAO feedback = new FeedbackDAO();
//        ProductDAO pdao = new ProductDAO();
//        // lấy list feedback từ database
//        int product_id = Integer.parseInt(request.getParameter("pid"));
//        List<Feedback> feedbackList = feedback.getFeedbackById(product_id);
//        request.setAttribute("feedback", feedbackList);
//        request.setAttribute("p", pdao.getProductById(product_id));
//        request.getRequestDispatcher("ProductDetails.jsp").forward(request, response);
//      String mode = request.getParameter("mode"); 
//      String id = request.getParameter("pid");
//      int index  = Integer.parseInt(mode);
//      request.setAttribute("index", index);
//      request.setAttribute("pid", id);
//      request.getRequestDispatcher("ProductDetails").forward(request, response);
        this.doPost(request, response);
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
        HttpSession session = request.getSession();
        if (session.getAttribute("account") != null) {
            FeedbackDAO feedback = new FeedbackDAO();
            int productid = Integer.parseInt(request.getParameter("pid"));
            String content = request.getParameter("content");
            int userid = Integer.parseInt(request.getParameter("userid"));
            Feedback feedback1 = new Feedback(new User(userid), content, new Product(productid));
            feedback.addFeedback(feedback1);
            response.sendRedirect("ProductDetails?pid=" + productid+"&mode=1");
        } else {
            response.sendRedirect("Login.jsp");
        }
        
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
