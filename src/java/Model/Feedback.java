/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

/**
 *
 * @author DELL
 */
public class Feedback {

    private User user;
    private String content;
    private Product product;
    private Timestamp date;

    public Feedback() {
    }

    public Feedback(User user, String content, Product product) {
        this.user = user;
        this.content = content;
        this.product = product;
    }

    public Feedback(User user, String content, Product product, Timestamp date) {
        this.user = user;
        this.content = content;
        this.product = product;
        this.date = date;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }
    
    
  public String formatDate() {
        Timestamp date = this.getDate();
        // Lấy ngày, tháng, năm từ đối tượng Date
        String day = String.format("%td", date);
        String month = String.format("%tm", date);
        String year = String.format("%tY", date);
        // Lấy giờ, phút từ đối tượng Date
        String hour = String.format("%tH", date);
        String minute = String.format("%tM", date);
        // Định dạng lại ngày, tháng, năm, giờ, phút thành chuỗi "dd-MM-yyyy HH:mm"
        return day + "-" + month + "-" + year + " " + hour + ":" + minute;
    }

    public String formatDate1() {
        Timestamp timestamp = this.getDate();
        // Định dạng theo "dd-MM-yyyy HH:mm"
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm");
        String formattedDate = dateFormat.format(timestamp);
        return formattedDate;
    }

}
