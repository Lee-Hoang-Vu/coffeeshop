
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Coffee Shop</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>

    <body>
        <jsp:include page="header.jsp"/>  
        <!-- END nav -->

        <section class="home-slider owl-carousel">

            <div class="slider-item" style="background-image: url(images/bg_3.jpg);" data-stellar-background-ratio="0.5">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row slider-text justify-content-center align-items-center">

                        <div class="col-md-7 col-sm-12 text-center ftco-animate">
                            <h1 class="mb-3 mt-5 bread">Cart</h1>
                            <p class="breadcrumbs"><span class="mr-2"><a href="Home">Home</a></span> <span>My Order</span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div id="main">
            <div class="container">
                <h1 class="title-page">My Order</h1>
                <div class="group-tabs">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#all" aria-controls="all" role="tab" data-toggle="tab">All</a></li>
                        <li role="presentation"><a href="#process" aria-controls="process" role="tab" data-toggle="tab">Processing</a></li>
                        <li role="presentation"><a href="#approve" aria-controls="approve" role="tab" data-toggle="tab">Approve</a></li>
                        <li role="presentation"><a href="#reject" aria-controls="reject" role="tab" data-toggle="tab">Reject</a></li>
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="all">
                            <section class="ftco-section ftco-cart">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-12 ftco-animate">
                                            <div class="cart-list">
                                                <table class="table">
                                                    <thead class="thead-primary">
                                                        <tr class="text-center">                                                        
                                                            <th>STT</th>
                                                            <th>Order Date</th>
                                                            <th>Order Name</th>
                                                            <th>Status</th>
                                                            <th colspan="2">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${requestScope.list}" var="i" varStatus="idx">
                                                            <tr class="text-center">           
                                                                <td>${idx.index}</td>
                                                                <td>${i.formatDate()}</td>
                                                                <td>${i.orderName}</td>
                                                                <td>${i.status.name}</td>
                                                                <td><a href="orderDetail?id=${i.id}">Detail</a></td>
                                                                <c:if test="${i.status.id == 1}">
                                                                    <td><a href="changeStatus?id=${i.id}">Cancel</a></td>
                                                                </c:if>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row justify-content-end">
                                        <div class="col col-lg-3 col-md-6 mt-5 cart-wrap ftco-animate">
                                            <p class="text-center"><a href="Home" class="btn btn-primary py-3 px-4">Back to home</a></p>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="process">
                            <section class="ftco-section ftco-cart">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-12 ftco-animate">
                                            <div class="cart-list">
                                                <table class="table">
                                                    <thead class="thead-primary">
                                                        <tr class="text-center">
                                                            <th>STT</th>
                                                            <th>Order Date</th>
                                                            <th>Order Name</th>
                                                            <th>Status</th>
                                                            <th colspan="2">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${requestScope.list}" var="i" varStatus="idx">
                                                            <c:if test="${i.status.id == 1}">
                                                                <tr class="text-center">
                                                                    <td>${idx.index}</td>
                                                                    <td>${i.formatDate()}</td>
                                                                    <td>${i.orderName}</td>
                                                                    <td>${i.status.name}</td>
                                                                    <td><a href="orderDetail?id=${i.id}">Detail</a></td>
                                                                    <td><a href="changeStatus?id=${i.id}">Cancel</a></td>
                                                                </tr>
                                                            </c:if>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row justify-content-end">
                                        <div class="col col-lg-3 col-md-6 mt-5 cart-wrap ftco-animate">
                                            <p class="text-center"><a href="Home" class="btn btn-primary py-3 px-4">Back to home</a></p>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="approve">
                            <section class="ftco-section ftco-cart">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-12 ftco-animate">
                                            <div class="cart-list">
                                                <table class="table">
                                                    <thead class="thead-primary">
                                                        <tr class="text-center">
                                                            <th>STT</th>
                                                            <th>Order Date</th>
                                                            <th>Order Name</th>
                                                            <th>Status</th>
                                                            <th colspan="2">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${requestScope.list}" var="i" varStatus="idx">
                                                            <c:if test="${i.status.id == 2}">
                                                                <tr class="text-center">                                            
                                                                    <td>${idx.index}</td>
                                                                    <td>${i.formatDate()}</td>
                                                                    <td>${i.orderName}</td>
                                                                    <td>${i.status.name}</td>
                                                                    <td><a href="orderDetail?id=${i.id}">Detail</a></td>
                                                                </tr>
                                                            </c:if>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row justify-content-end">
                                        <div class="col col-lg-3 col-md-6 mt-5 cart-wrap ftco-animate">
                                            <p class="text-center"><a href="Home" class="btn btn-primary py-3 px-4">Back to home</a></p>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="reject">
                            <section class="ftco-section ftco-cart">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-12 ftco-animate">
                                            <div class="cart-list">
                                                <table class="table">
                                                    <thead class="thead-primary">
                                                        <tr class="text-center">                                                          
                                                            <th>STT</th>
                                                            <th>Order Date</th>
                                                            <th>Order Name</th>
                                                            <th>Status</th>
                                                            <th colspan="2">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${requestScope.list}" var="i" varStatus="idx">
                                                            <c:if test="${i.status.id == 3}">
                                                                <tr class="text-center">                                             
                                                                    <td>${idx.index}</td>
                                                                    <td>${i.formatDate()}</td>
                                                                    <td>${i.orderName}</td>
                                                                    <td>${i.status.name}</td>
                                                                    <td><a href="orderDetail?id=${i.id}">Detail</a></td>
                                                                </tr>
                                                            </c:if>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row justify-content-end">
                                        <div class="col col-lg-3 col-md-6 mt-5 cart-wrap ftco-animate">
                                            <p class="text-center"><a href="Home" class="btn btn-primary py-3 px-4">Back to home</a></p>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="Footer.jsp"/>    

        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
            <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
            <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                    stroke="#F96D00" />
            </svg></div>


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
        <script type="text/javascript">
            function updateCart(i) {
                var value = $('#' + i).val();
                window.location.href = "${pageContext.request.contextPath}/updateCart?idx=" + i + "&quantity=" + value;
            }
        </script>
    </body>

</html>
