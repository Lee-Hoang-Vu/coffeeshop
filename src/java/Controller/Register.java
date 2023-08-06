/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.UserDAO;
import Model.Role;
import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author asus
 */
public class Register extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        try {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String pass = request.getParameter("pass");
            String confirmpass = request.getParameter("confirmpass");
            UserDAO udao = new UserDAO();

            User checkExist = udao.getUserByEmail(email);
            if (pass.equals(confirmpass) == false) {
                request.setAttribute("messregis", "Confirm Password is not correct");
                request.getRequestDispatcher("Register.jsp").forward(request, response);
            } else {
                if (checkExist == null) {
                //    udao.inserUser(name, email, pass);
                    User u = new User();
                    u.setName(name);
                    u.setEmail(email);         
                    u.setPassword(pass);
                    u.setRole(new Role(3));
                    request.getSession().setAttribute("newuser", u);
                    response.sendRedirect("./SendMail");
                } else {
                    request.setAttribute("messregis", "Email already exist in system!");
                    request.getRequestDispatcher("Register.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            request.setAttribute("messregis", "Invalid input.Please Try again!");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
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
