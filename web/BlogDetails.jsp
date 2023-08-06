<%-- 
    Document   : BlogDetails
    Created on : May 18, 2023, 8:36:56 PM
    Author     : ASUS
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Coffee</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans:400,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Great+Vibes" rel="stylesheet">

        <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.css">

        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">

        <link rel="stylesheet" href="css/aos.css">

        <link rel="stylesheet" href="css/ionicons.min.css">

        <link rel="stylesheet" href="css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="css/jquery.timepicker.css">


        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">
    </head>

    <body>
        <jsp:include page="header.jsp"/>   
        <section class="ftco-section" style="margin-top: 100px">
            <c:if test="${not empty blog}">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 ftco-animate">
                            <h2 class="mb-3">${blog.blog_title}</h2>
                            <p>
                                <img src="${blog.blog_image}" alt="" class="img-fluid">
                            </p>
                            <p>${blog.content}</p>
                            <i><h6 class="mb-3">Post by: ${blog.getUser().getName()}</h6></i>
                            <i><h6 class="mb-3">Post date: ${blog.post_date}</h6></i>
                        </div>
                        <div class="col-lg-4 col-md-6 mb-5 mb-md-5">
                            <div class="ftco-footer-widget mb-4">
                                <h2 class="ftco-heading-2">Recent Blog</h2>
                                <c:forEach var="bl" items="${bl}">
                                    <div class="block-21 mb-4 d-flex">
                                        <a href="BlogController?blogId=${bl.getBlog_id()}"><img class="blog-img mr-4" src="${bl.getBlog_image()}" alt="image"></a>
                                        <div class="text">
                                            <h3 class="heading"><a href="BlogController?blogId=${bl.getBlog_id()}">${bl.getBlog_title()}</a></h3>
                                            <div class="meta">
                                                <div><a href="BlogController?blogId=${bl.getBlog_id()}"><span class="icon-calendar"></span> ${bl.getPost_date()}</a></div>
                                                <div><a href="BlogController?blogId=${bl.getBlog_id()}"><span class="icon-person"></span> ${bl.getUser().getName()}</a></div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
        </section> 

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
        <script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <script src="js/google-map.js"></script>
        <script src="js/main.js"></script>

    </body>

</html>