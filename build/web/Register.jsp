<%-- 
    Document   : Register
    Created on : May 15, 2023, 9:04:59 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Register</title>
        <meta name="viewport" content="width=device-width,
              initial-scale=1.0"/>
        <link rel="stylesheet" href="./CSSsimple/register.css">
        <link rel="stylesheet" href="css/style.css">
    </head>                      
    <body style="background:url(image/login.jpg);
          background-size: cover; "  >
        <div id="wrapper">
            <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
                <div class="container">
                    <a class="navbar-brand" href="Home">Coffee<small>Blend</small></a>
                </div>
            </nav>  
            <form action="Register" method="Post" id="form-login">
                <h1 class="form-heading">REGISTER</h1>

                <div class="form-group">
                    <i class="far fa-user"></i>
                    <input type="text" class="form-input" name="name" placeholder="Name" required>
                </div>

                <div class="form-group">
                    <i class="far fa-user"></i>
                    <input type="text" class="form-input" name="email" placeholder="Email" required>
                </div>

                <div class="form-group">
                    <i class="fas fa-key"></i>
                    <input  class="form-input" type="password"
                            name="pass"
                            pattern=".{8,20}"
                            title="Password must be at least 8 to 20 characters!!!"
                            placeholder="Password" required/>
                </div>

                <div class="form-group">
                    <i class="far fa-user"></i>
                    <input type="password" class="form-input" name="confirmpass" placeholder="Confirm Password" required>
                </div>

                <p style="color: red;"> ${messregis}</p>

                <input type="submit" value="Register" class="form-submit">
            </form>
        </div>
    </body>
</html>
