/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.ProductSize;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author kienb
 */
public class ProductSizeDao extends DBContext {

    public ProductSize getProductSizeById(int id) {
        String sql = " SELECT *\n"
                + "  FROM [SWP391].[dbo].[ProductSize] where productSize_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductSize p = new ProductSize(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3));
                return p;
            }
        } catch (Exception e) {
        }
        return null;
    }

}
