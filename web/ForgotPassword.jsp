<%-- 
    Document   : ForgotPassword
    Created on : May 20, 2023, 2:55:49 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- forgotpassword.jsp -->
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Forgot Password</title>
        <style>
            body {
                font-family: "Open Sans", sans-serif;
                height: 100vh;

                background-color: white;
                background-size: cover;
            }

            @keyframes spinner {
                0% {
                    transform: rotateZ(0deg);
                }
                100% {
                    transform: rotateZ(359deg);
                }
            }

            * {
                box-sizing: border-box;
            }

            .wrapper {
                display: flex;
                align-items: center;
                flex-direction: column;
                justify-content: center;
                width: 100%;
                min-height: 100%;
                padding: 20px;
                background: rgba(darken(40%), 0.85);
            }


            .forgot{
                border-radius: 10px;
                padding: 10px 20px 20px 20px;
                width: 90%;
                max-width: 369px;
                position: relative;
                padding-bottom: 43px;
                box-shadow: 0px 1px 5px rgb(0 0 0 / 30%);
                background-color: white;
            }

            .a {
                display: block;
                padding: 15px 10px;
                width: 100%;
                border: 1px solid #ddd;
                transition: border-width 0.2s ease;
                border-radius: 20px;
                margin: 37px 0px;
                color: #1976d2;
                border: solid;
            }
            .state {
                display: block;
                padding: 8px 10px;
                margin-bottom: 38px;
                width: 100%;
                border: 1px solid #ddd;
                transition: border-width 0.2s ease;
                border-radius: 20px;
                color: white;
                margin-bottom: -27px;
                margin-top: 13px;
                background-color: #1976d2;
            }
            .state:hover {
                background-color: white;
                color: #1976d2;
            }

        </style>
    </head>
    <body>
        <div class="wrapper">
            <form method="post" action="ForgotPassword" class="forgot">
                <h2 style="text-align: center;
                    font-size: 29px;
                    color: #1976d2">Forgot Password</h2>
                <label>Email:</label>
                <input style="
                       width: 80%;
                       border: 0px;
                       text-align: center;
                       margin-bottom: 20px;
                       height: 32px;
                       border-radius: 10px;
                       " type="email" name="email" required="" placeholder="Your Email Address"><br>
                <p style="color: red">${mess}</p>
                <input class="state" type="submit" value="Forgot Password">
            </form>
        </div>
    </body>
</html>
