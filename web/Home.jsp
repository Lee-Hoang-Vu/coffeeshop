<%-- 
    Document   : Home
    Created on : May 17, 2023, 8:04:59 PM
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
        <section class="home-slider owl-carousel">
            <div class="slider-item" style="background-image: url(images/bg_1.jpg);">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">
                        <div class="col-md-8 col-sm-12 text-center ftco-animate">
                            <span class="subheading">Welcome</span>
                            <h1 class="mb-4">The Best Coffee Testing Experience</h1>
                            <p class="mb-4 mb-md-5"></p>
                            <p><a href="ProductLists"
                                  class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3">View Menu</a></p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="slider-item" style="background-image: url(images/bg_2.jpg);">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

                        <div class="col-md-8 col-sm-12 text-center ftco-animate">
                            <span class="subheading">Welcome</span>
                            <h1 class="mb-4">The Best Coffee Testing Experience</h1>
                            <p class="mb-4 mb-md-5"></p>
                            <p><a href="ProductLists"
                                  class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3">View Menu</a></p>
                        </div>

                    </div>
                </div>
            </div>

            <div class="slider-item" style="background-image: url(images/bg_3.jpg);">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

                        <div class="col-md-8 col-sm-12 text-center ftco-animate">
                            <span class="subheading">Welcome</span>
                            <h1 class="mb-4">The Best Coffee Testing Experience</h1>
                            <p class="mb-4 mb-md-5"></p>
                            <p><a href="ProductLists"
                                  class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3">View Menu</a></p>
                        </div>

                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-about d-md-flex">
            <div class="one-half img" style="background-image: url(images/about.jpg);"></div>
            <div class="one-half ftco-animate">
                <div class="overlap">
                    <div class="heading-section ftco-animate ">
                        <span class="subheading">Discover</span>
                        <h2 class="mb-4">Our Story</h2>
                    </div>
                    <div>
                        <p>Welcome to Coffee Blend - where you find the passion and taste of coffee beans. 
                            We are proud to be a website dedicated to providing unique and sophisticated coffees, 
                            along with quality services to meet the needs of all coffee flavor lovers. 
                            We are committed to providing an easy, fast and secure online shopping experience so that fresh coffee is always at your fingertips.</p>
                    </div>
                </div>
            </div>
        </section>
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center mb-5 pb-3">
                    <div class="col-md-7 heading-section ftco-animate text-center">
                        <span class="subheading">Discover</span>
                        <h2 class="mb-4">NEW PRODUCT</h2>
                        <p>We are very excited to introduce the latest products to you. 
                            Immerse yourself in the diverse and sophisticated world of coffee, 
                            we offer the most unique and interesting selections</p>
                    </div>
                </div>
                <div class="row">     
                    <c:forEach var="p" items="${plist}">
                        <div class="col-md-3">
                            <div class="menu-entry"> 
                                <a href="./ProductDetails?pid=${p.getId()}&mode=0" class="img" style="background-image: url(${p.getImage()});"></a>
                                <div class="text text-center pt-4">
                                    <h3 class="place-heading"" href="./ProductDetails?pid=${p.getId()}&mode=0" class="pr-name">${p.getName()}</a></h3>
                                    <div class="place-price">
                                        <p style="color: white;" class="currencySymbol">Price: <span class="priceSpan">${p.getPrice()}</span>đ</p>
                                    </div>               
                                    <p><a href="./ProductDetails?pid=${p.getId()}&mode=0" class="btn btn-primary btn-outline-primary">Order</a></p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center mb-5 pb-3">
                    <div class="col-md-7 heading-section ftco-animate text-center">
                        <span class="subheading">Discover</span>
                        <h2 class="mb-4">Best Coffee Selling</h2>
                        <p>Here, we would like to introduce you to the best-selling products, bringing you great and memorable coffee experiences.</p>
                    </div>
                </div>
                <div class="row">     
                    <c:forEach var="p" items="${plist1}">
                        <div class="col-md-3">
                            <div class="menu-entry"> 

                                <a href="./ProductDetails?pid=${p.getId()}&mode=0" class="img" style="background-image: url(${p.getImage()});"></a>
                                <div class="text text-center pt-4">
                                    <h3 class="place-heading"" href="./ProductDetails?pid=${p.getId()}&mode=0" class="pr-name">${p.getName()}</a></h3>

                                    <div class="place-price">
                                        <p style="color: white;" class="currencySymbol">Price: <span class="priceSpan">${p.getPrice()}</span>đ</p>
                                    </div>               
                                    <p><a href="./ProductDetails?pid=${p.getId()}&mode=0" class="btn btn-primary btn-outline-primary">Order</a></p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
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
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <script src="js/google-map.js"></script>
        <script src="js/main.js"></script>

        <script>
            var priceSpans = document.querySelectorAll(".priceSpan");

            priceSpans.forEach(function (span) {
                var price = parseFloat(span.textContent);
                var formattedPrice = price.toFixed(3); // Định dạng giá trị với 3 số 0 sau dấu chấm
                span.textContent = formattedPrice;
            });
        </script>
    </body>
</html>