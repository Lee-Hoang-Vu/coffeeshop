/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.ProductDAO;
import DAO.ProductSizeDao;
import Model.Product;
import Model.ProductDTO;
import Model.ProductSize;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author asus
 */
public class AddToCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pid = request.getParameter("pid");
        String psize = request.getParameter("psize");
        String quantity = request.getParameter("quantity");
        int num = 1;
        if (quantity != null) {
            num = Integer.parseInt(quantity);
        }
        Cookie[] cookies = request.getCookies();
        HttpSession session = request.getSession();
        List<ProductDTO> map = (List<ProductDTO>) session.getAttribute("map");
        for (Cookie i : cookies) {
            if (i.getName().equals("map")) {
                i.setMaxAge(0);
                response.addCookie(i);
                break;
            }
        }
        ProductDAO pdo = new ProductDAO();
        ProductSizeDao pds = new ProductSizeDao();
        ProductSize pdsize = null;
        if (psize != null && !psize.isEmpty()) {
            pdsize = pds.getProductSizeById(Integer.parseInt(psize));
        }
        Product p = pdo.getProductById(Integer.parseInt(pid));
        ProductDTO productDTO = new ProductDTO(p, pdsize, num);
        if (map.contains(productDTO)) {
            int index = map.indexOf(productDTO);
            map.get(index).setQuantity(map.get(index).getQuantity() + num);
        } else {
            map.add(productDTO);
        }
        session.setAttribute("map", map);
        StringBuilder value = new StringBuilder();
        for (int idx = 0; idx < map.size() - 1; idx++) {
            value.append(map.get(idx).getProduct().getId());
            value.append("/");
            value.append(map.get(idx).getProductSize() != null ? map.get(idx).getProductSize().getId() : "none");
            value.append("/");
            value.append(map.get(idx).getQuantity());
            value.append("/");
        }
        value.append(map.get(map.size() - 1).getProduct().getId());
        value.append("/");
        value.append(map.get(map.size() - 1).getProductSize() != null ? map.get(map.size() - 1).getProductSize().getId() : "none");
        value.append("/");
        value.append(map.get(map.size() - 1).getQuantity());
        Cookie c = new Cookie("map", value.toString());
        c.setMaxAge(7 * 60 * 60);
        response.addCookie(c);
        String url = request.getHeader("referer");
        response.sendRedirect(url);
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
