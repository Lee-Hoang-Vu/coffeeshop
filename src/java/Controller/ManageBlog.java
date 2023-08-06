/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.BlogDao;
import Model.Blog;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.OutputStream;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hoàng Vũ
 */
public class ManageBlog extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession();
            Object object = session.getAttribute("account");
            User u = (User) object;

            if (u.getRole().getId() == 2) {
                String blogId = (request.getParameter("blogId"));
                BlogDao blog = new BlogDao();
                List<Model.Blog> bl = blog.getBlogs();
                request.setAttribute("bl", bl);
                request.getRequestDispatcher("ManageBlog.jsp").forward(request, response);
            }
        } catch (Exception e) {

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
    String search = request.getParameter("search");
    String firstDate = request.getParameter("firstDate");
    String secondDate = request.getParameter("secondDate");

    BlogDao blogDao = new BlogDao();
    ArrayList<Blog> blogList = new ArrayList<>();

    if (search != null) {
        blogList = blogDao.searchBlog(search);
    } else if (firstDate != null && secondDate != null) {
        Date fdate = Date.valueOf(firstDate);
        Date sdate = Date.valueOf(secondDate);
        blogList = blogDao.getBlogByDate(fdate, sdate);
    }

    request.setAttribute("bl", blogList);
    request.getRequestDispatcher("ManageBlog.jsp").forward(request, response);
}


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
