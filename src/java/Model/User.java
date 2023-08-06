/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author asus
 */
public class User {
    private int id;
    private String name;
    private String email;
    private String password;
    private Role role;
    private UserStatus userStatus;
    private double point; 

    public User() {
    }    
    
    public User(String name) {
        this.name = name;
    }

    public User(int id, String name, String email, String password, Role role, UserStatus userStatus, double point) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.role = role;
        this.userStatus = userStatus;
        this.point = point;
    } 

    public User(String name, String email, Role role) {
        this.name = name;
        this.email = email;
        this.role = role;
    }

    public User(String name, Role role) {
        this.name = name;
        this.role = role;
    }

    public User(int id, String name, String email, Role role, UserStatus userStatus, double point) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.role = role;
        this.userStatus = userStatus;
        this.point = point;
    }
     
    public User(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public double getPoint() {
        return point;
    }

    public void setPoint(double point) {
        this.point = point;
    }

    public UserStatus getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(UserStatus userStatus) {
        this.userStatus = userStatus;
    }
    
}
