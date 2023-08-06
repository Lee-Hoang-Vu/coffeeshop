<%-- 
    Document   : ChangePassword
    Created on : Jul 2, 2023, 9:27:34 AM
    Author     : Hoàng Vũ
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSSsample/userProfile.css">
        <title>Coffee</title>
        <style>


          body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }

            /* Add some styling to the header */
            header {
                background-color: #333;
                color: #fff;
                padding: 10px;
                text-align: center;
            }

            /* Add some styling to the form container */
            .ipform {
                margin: 100px auto;
                max-width: 600px;
                padding: 20px;
                border: 1px solid #ccc;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            /* Style the form elements */
            form {
                display: flex;
                flex-direction: column;
            }

            h3 {
                text-align: center;
                margin-bottom: 20px;
            }

            label {
                font-weight: bold;
                margin-bottom: 5px;
            }

            input[type="text"],
            input[type="email"] {
                padding: 8px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            

            .change {
                color: #fff;
                font-size: 18px;
                font-weight: normal; /* Adjust the font weight as needed */
                text-decoration: none;
                margin-left: 350px;
            }

            .change:hover {
                text-decoration: underline;
            }


            .editprofile {
                padding: 10px 20px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            .editprofile:hover {
                background-color: #0056b3;
            }

            p {
                color: #d50000; /* Red color for error messages */
                margin-bottom: 10px;
            }

            /* Add some styling to the footer */
            footer {
                background-color: #333;
                color: #fff;
                padding: 10px;
                text-align: center;
            }


        </style>
    </head>
    <body>

        <jsp:include page="header.jsp"/>
        <div style="margin-top: 200px; margin-left: 471px" class="ipform">

            <form method="POST" action="ChangePassword" >
                <h3>Change your password</h3>
                <label class="nameprofile">Old password</label>
                <input class="nameprofile1" type="password" name="oldpass" required><br/>
                <label class="emailprofile">New password:</label>
                <input type="password" class="emailprofile1" pattern=".{8,20}"
                       title="Password must be at least 8 to 20 characters!!!"  name="newpass"><br/>
                <label class="emailprofile">Confirm password:</label>
                <input class="nameprofile1" type="password" name="renewpass" required><br/>
                <p style="color: red">${mess}</p>
                <input style="background: #c49b63; color: white" class="editprofile" type="submit" value="Change Password"> 
            </form>
        </div>
        <div style="margin-bottom: 100px"></div>
        <jsp:include page="Footer.jsp"/>

        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-migrate-3.0.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script src="js/jquery.waypoints.min.js"></script>
        <script src="js/jquery.stellar.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/aos.js"></script>
        <script src="js/jquery.animateNumber.min.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>
        <script src="js/jquery.timepicker.min.js"></script>
        <script src="js/scrollax.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <script src="js/google-map.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>
