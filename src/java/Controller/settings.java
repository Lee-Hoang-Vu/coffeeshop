///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
// */
//
//package Controller;
//
//import DAO.RoleDAO;
//import DAO.UserDAO;
//import Model.Role;
//import Model.User;
//import java.io.IOException;
//import java.io.PrintWriter;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.util.List;
//
///**
// *
// * @author DELL
// */
//public class settings extends HttpServlet {
//   
//
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse res)
//            throws ServletException, IOException {
//        UserDAO userDAO = new UserDAO();
//        RoleDAO roleDAO = new RoleDAO();
////        RoleDAO rd = new RoleDAO();
////        
////        List<Role> list = rd.getAll();
////        
////        req.setAttribute("listRole", list);
//        List<User> userList = userDAO.getAllUsersToSetting();
//        List<Role> roleList = roleDAO.getAll();
//        req.setAttribute("userList", userList);
//        req.setAttribute("roleList", roleList);
//        req.getRequestDispatcher("ManageSetting.jsp").forward(req, res);
////        req.getRequestDispatcher("Setting.jsp").forward(req, res);
//    }
//
//    /** 
//     * Handles the HTTP <code>POST</code> method.
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//    throws ServletException, IOException {
//        UserDAO userDAO = new UserDAO();
//        RoleDAO roleDAO = new RoleDAO();
//        int userId = Integer.parseInt(request.getParameter("userId"));
//        int roleId = Integer.parseInt(request.getParameter("roleId"));
//
//        userDAO.updateUserRole(userId, roleId);
//
//        response.sendRedirect(request.getContextPath() + "/settings");
//    }
//
//    /** 
//     * Returns a short description of the servlet.
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}
