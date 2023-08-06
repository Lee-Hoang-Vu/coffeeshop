<%-- 
    Document   : Verify
    Created on : Mar 8, 2023, 8:35:05 PM
    Author     : Sio8 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TOPTECH</title>
    </head>
    <style>
        body {
            font-family: "Open Sans", sans-serif;
            height: 100vh;

            background: #c49b63;
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
/*            background: rgba(darken(40%), 0.85);*/
        }


        .verify {
            border-radius: 10px;
            padding: 10px 20px 20px 20px;
            width: 90%;
            max-width: 320px;
            position: relative;
            padding-bottom: 15px;
            box-shadow: 0px 1px 5px rgba(0,0,0,0.3);
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
            color: black;
        }
        .state:hover {
            background-color: #1976d2;
            color: white;
        }

    </style>
    <body>
        <div class="wrapper">
            <form class="verify" action="VerifyForgotPassword" method="POST">
                <h3 style="text-align: center;">Verify Forgot Password</h3>
                <input class="a"  type="text" name="verifyCode" placeholder="Enter your code here"><br>
                <p style="font-size: 15px; color: red; margin-top: -45px;">${alertTitle}</p>
                <input class="state" type="submit" value="Verify">
            </form>
        </div>
    </body>
</html>
