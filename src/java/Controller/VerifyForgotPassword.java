/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author asus
 */
@WebServlet(name = "VerifyForgotPassword", urlPatterns = {"/VerifyForgotPassword"})
public class VerifyForgotPassword extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String verifyCode = request.getParameter("verifyCode");
        if(verifyCode == null || verifyCode.isEmpty()){
            response.sendRedirect("Login.jsp");
        }else{
        HttpSession verifyPremium = request.getSession();
        String Code = String.valueOf(verifyPremium.getAttribute("verifyCode"));
        request.setAttribute("tk", "Thank you!");
        if (verifyCode.equals(Code)) {
//            request.setAttribute("alertTitle", "Thank you!");
            request.getRequestDispatcher("ResetPassword.jsp").forward(request, response);
        } else {
            request.setAttribute("alertTitle", "The verify code is wrong, please enter again!");
            request.getRequestDispatcher("VerifyForgotPassword.jsp").forward(request, response);
        }
        }
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
