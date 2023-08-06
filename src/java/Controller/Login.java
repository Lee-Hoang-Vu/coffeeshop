/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.MD5;
import DAO.UserDAO;
import Model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author HC
 */
public class Login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        UserDAO udao = new UserDAO();
        MD5 md5 = new MD5();
        ArrayList<User> userList = udao.getAllUser();
        String mess = "Email or password wrong!";
        User userI = userList.stream()
                .filter(user -> user.getEmail().equals(email) && user.getPassword().equals(md5.getMd5(pass)))
                .findFirst().orElse(null);
        if (userI != null) {
                switch (userI.getRole().getId()) {
                    case 1:
                        session.setAttribute("account", userI);
                        response.sendRedirect("AdminDashbord");
                        break;
                    case 2:
                        session.setAttribute("account", userI);
                        response.sendRedirect("SellerDashboard");
                        break;
                    case 3:
                        session.setAttribute("account", userI);
                        response.sendRedirect("Home");
                        break;
                }           
        } else {
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("Login.jsp").forward(request, response);
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
}
