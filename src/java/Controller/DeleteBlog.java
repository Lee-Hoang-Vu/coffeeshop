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

/**
 *
 * @author Hoàng Vũ
 */
public class DeleteBlog extends HttpServlet {
 
   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       int id = Integer.valueOf(request.getParameter("bid"));
        BlogDao bdao = new BlogDao();
        bdao.DeleteBlog(id);
        response.sendRedirect("./ManageBlog");
    } 

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
