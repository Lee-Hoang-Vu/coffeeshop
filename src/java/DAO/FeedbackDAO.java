/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Feedback;
import Model.Product;
import Model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DELL
 */
public class FeedbackDAO extends DBContext {

    public List<Feedback> getFeedbackById(int product_id) {
        ArrayList<Feedback> feedback = new ArrayList<>();
        String sql ="  SELECT top(5) f.content, u.user_name, p.product_name,f.post_date\n" +
"               FROM feedback f\n" +
"                JOIN Users u ON f.user_id = u.user_id\n" +
"                JOIN product p ON f.product_id = p.product_id\n" +
"              where f.product_id = ?\n" +
"               ORDER BY f.post_date desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, product_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Feedback feedback1 = new Feedback(new User(rs.getString(2)), rs.getString(1), new Product(rs.getString(3)), rs.getTimestamp(4));
                feedback.add(feedback1);

            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return feedback;
    }

    public void addFeedback(Feedback feedback) {
        String sql = "  INSERT INTO Feedback(product_id, user_id, content, post_date) VALUES (?,?,?, GETDATE())";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, feedback.getProduct().getId());
            ps.setInt(2, feedback.getUser().getId());
            ps.setString(3, feedback.getContent());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public int countComment(int id){
        int count = 0;
        try{
            String sql = "select COUNT(*) from Feedback group by product_id having product_id = ? "; 
            PreparedStatement ps = connection.prepareStatement(sql); 
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery(); 
            while(rs.next()){
                count = rs.getInt(1); 
                return count;
            }
        }catch(Exception e){
            
        }
        return 0;
    }

    public static void main(String[] args) {
        FeedbackDAO bld = new FeedbackDAO();
        List<Feedback> feedback = bld.getFeedbackById(1);
        System.out.println(feedback.get(0).getUser().getName());
    }
}
