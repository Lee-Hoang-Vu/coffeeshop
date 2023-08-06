<%-- 
    Document   : ChangePassword
    Created on : May 21, 2023, 8:31:02 AM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
        <link rel="stylesheet" href="./CSSsimple/login.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body style="background:url(image/changepass.jpg);
          background-size: cover; "  >
        <div id="wrapper">
            <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
                <div class="container">
                    <a class="navbar-brand" href="Home">Coffee<small>Blend</small></a>
                </div>
            </nav>  
            <form action="ResetPassword" method="Post" id="form-login">
                <h1 class="form-heading">NEW PASSWORD</h1>
                <div class="form-group">
                    <i class="far fa-user"></i>
                    <input type="password" class="form-input" name="pass"   pattern=".{8,20}"
                            title="Mật khẩu ít nhất 8 đến 20 kí tự !!!"  placeholder="Create your password">
                </div>
                <div class="form-group">
                    <i class="fas fa-key"></i>
                    <input type="password" class="form-input" name="confirmpass" placeholder="Confirm your password">
                </div>
                <p style="color: red;">${mess}</p>
                <input type="submit" value="Change" class="form-submit">
            </form>
        </div>
    </body>
</html>

