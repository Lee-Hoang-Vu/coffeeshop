<%-- 
    Document   : header.jsp
    Created on : May 17, 2023, 8:03:38 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Coffee</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans:400,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Great+Vibes" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>


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
        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" href="Home">Coffee<small>Blend</small></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>
                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <form action="ProductLists" class="search-form" method="post" >
                                <div class="form-group">
                                    <div class="icon">
                                        <span class="icon-search"></span>
                                    </div>
                                    <input type="text" class="form-control" name="search" placeholder="Search...">
                                </div>
                            </form>
                        </li>
                        <li class="nav-item"><a href="Home" class="nav-link">Home</a></li>
                        <li class="nav-item"><a href="ProductLists" class="nav-link">Menu</a></li>
                        <li class="nav-item"><a href="Blog" class="nav-link">Blog</a></li>
                        <li class="nav-item">
                            <c:if test="${sessionScope['account'].getRole().getId() == 3}">
                                <a href="myorder" class="nav-link" >MY ORDER</a>
                            </c:if>
                        </li>
                        <li class="nav-item">
                            <c:if test="${sessionScope['account'].getRole().getId() == 1}">
                                <a href="AdminDashbord" class="nav-link" >MANAGER PAGE</a>
                            </c:if>
                        </li>

                        <li class="nav-item">
                            <c:if test="${sessionScope['account']!=null}">
                                <a href="userprofile.jsp" class="nav-link"><i class="biolife-icon icon-login"></i>PROFILE</a>
                            </c:if>
                        </li>
                        <li class="nav-item">
                            <c:if test="${sessionScope['account']==null}">
                                <a href="Login.jsp" class="nav-link"><i style="font-size: 23px;" class="icon icon-person"></i></a>
                                </c:if>
                        </li>
                        <li class="nav-item">
                            <c:if test="${sessionScope['account']!=null}">
                                <a href="LogOut" class="nav-link"> <i style="font-size: 23px;" class='bx bxs-log-in-circle' ></i></a>
                                </c:if>
                        </li>
                        <li class="nav-item cart"><a href="cart" class="nav-link"><span class="icon icon-shopping_cart"></span><span class="bag d-flex justify-content-center align-items-center"><small>${sessionScope.map.size()}</small></span></a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </body>
</html>
