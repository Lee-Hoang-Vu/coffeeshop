/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.UserDAO;
import Model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Random;

/**
 *
 * @author Hoàng Vũ
 */
public class ForgotPassword extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public static String getRandomNumberString() {
        // It will generate 6 digit random Number.
        // from 0 to 999999
        Random rnd = new Random();
        int number = rnd.nextInt(999999);

        // this will convert any number sequence into 6 character.
        return String.format("%06d", number);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO dao = new UserDAO();
        String recipient = request.getParameter("email");
        User checkMail = dao.getUserByEmail(recipient);
        if (recipient == null || recipient.isEmpty()) {
            response.sendRedirect("Login.jsp");
        } else {
            if (checkMail == null) {
                request.setAttribute("mess", "Email not correct!!");
                request.getRequestDispatcher("ForgotPassword.jsp").forward(request, response);
            } else {
                request.getSession().setAttribute("newuser", checkMail);
                response.sendRedirect("./SendMailForgotPassword");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    public static String messageProcess(String newPassword) {
        String resetUrl = "http://localhost:8080/login";
        String message = "Hello,\n"
                + "We really thank you for taking time to help us reset your password.\n"
                + "Your new password is: " + newPassword;

        return message;
    }
}
