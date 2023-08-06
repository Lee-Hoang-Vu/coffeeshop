/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

/**
 *
 * @author Sio
 */
import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.*;
import java.util.Properties;
import java.util.Random;
import javax.mail.*;
import javax.mail.internet.*;



public class SendMail extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           this.doGet(request, response);
    }

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get recipient email address and message from form data
        User u = (User) request.getSession().getAttribute("newuser");
        String recipient = u.getEmail();
        String verifyCode = getRandomNumberString();
        String message = messageProcess(verifyCode);

        HttpSession verifyPremium = request.getSession();
        verifyPremium.setAttribute("verifyCode", verifyCode);
        verifyPremium.setMaxInactiveInterval(60);

        // Set up mail server and authentication
        String host = "smtp.gmail.com";
//        String user = "thegalaxy2308@gmail.com";
//        String password = "ollvprlecgkrgzbf";
        String user = "toptech8868@gmail.com";
        String password = "sjxyriefmnrchwzs";

        // Create properties object for the mail session
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");

        // Create mail session and authenticate with credentials
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });

        try {
            // Create message and set recipient, subject, and message body
            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(user));
            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
            msg.setSubject("Verify your email");
            msg.setText(message);

            // Send message
            Transport.send(msg);

            // Redirect to success page
            request.getRequestDispatcher("Verify.jsp").forward(request, response);
            //response.getWriter().print("success");
        } catch (MessagingException e) {
            // Redirect to error page
            response.getWriter().print("error..get");
        }
    }

    /**
     *
     * @return
     */
    public static String getRandomNumberString() {
        // It will generate 6 digit random Number.
        // from 0 to 999999
        Random rnd = new Random();
        int number = rnd.nextInt(999999);

        // this will convert any number sequence into 6 character.
        return String.format("%06d", number);
    }

    /**
     *
     * @param verifyCode
     * @return
     */
    public static String messageProcess(String verifyCode) {
        String message = "Hello,\n"
                + "We really thank you for taking time to help us verify your email.\n"
                + "Your verification code is: " + verifyCode;

        return message;
    }
}
