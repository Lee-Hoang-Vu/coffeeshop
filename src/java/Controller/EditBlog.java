/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.BlogDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;

/**
 *
 * @author Hoàng Vũ
 */
public class EditBlog extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        try {
        response.setContentType("text/html;charset=UTF-8");
        String title = request.getParameter("title");
        String img = request.getParameter("img");
        String content = request.getParameter("content");  
        int id = Integer.valueOf(request.getParameter("id"));
        BlogDao bdao = new BlogDao();
        bdao.updateBlog(title, img, content, id);
        response.sendRedirect("ManageBlog");
//        } catch (Exception e) {
//            response.sendRedirect("./404.html");
//        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
