<%-- 
    Document   : checkout
    Created on : Jun 10, 2023, 6:59:04 PM
    Author     : kienb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <section class="home-slider owl-carousel">

            <div class="slider-item" style="background-image: url(images/bg_3.jpg);" data-stellar-background-ratio="0.5">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row slider-text justify-content-center align-items-center">

                        <div class="col-md-7 col-sm-12 text-center ftco-animate">
                            <h1 class="mb-3 mt-5 bread">Checkout</h1>
                            <p class="breadcrumbs"><span class="mr-2"><a href="Home">Home</a></span> <span>Checkout</span></p>
                        </div>

                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section">
            <div class="container">
                <div class="row">
                    <c:if test="${mode == 1}">
                        <div class="col-xl-10 ftco-animate">
                            <form id="formOrder" action="order" class="billing-form ftco-bg-dark p-3 p-md-5" method="post">
                                <h3 class="mb-4 billing-heading">Order Information</h3>
                                <div class="row align-items-end">
                                    <c:if test="${sessionScope['account']==null}">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="phone">Name</label>
                                                <input type="text" id="name" name="name" class="form-control" title="Tên ít hơn 10 kí tự" pattern="[A-Za-Z0-9]{10}" required>
                                            </div>
                                        </div>
                                    </c:if>

                                    <c:if test="${sessionScope['account']!=null}">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="phone">Name</label>
                                                <input type="text" value="${sessionScope['account'].getName()}" id="name" name="name" class="form-control" title="Tên ít hơn 10 kí tự" pattern="[A-Za-Z0-9]{10}" required>
                                            </div>
                                        </div>
                                    </c:if>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="phone">Phone</label>
                                            <input type="tel" id="phone" name="phone" class="form-control" title="Số điện thoại không hợp lệ!!" pattern="[0-9]{10}" required>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="emailaddress">Address</label>
                                            <input required type="text" name="address" class="form-control"  placeholder="">
                                        </div>
                                    </div>
                                    <div class="w-100"></div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="emailaddress">Note</label>
                                            <textarea name="note" class="form-control" rows="10" ></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="cart-detail cart-total ftco-bg-dark p-3 p-md-4">
                                        <h3 class="billing-heading mb-4">Cart Total</h3>
                                        <p class="d-flex">
                                            <span>Subtotal</span>
                                            <span>${requestScope.total}00đ</span>
                                        </p>
                                        <p class="d-flex">
                                            <span>Discount</span>
                                            <span>${requestScope.discount}%</span>
                                        </p>
                                        <hr>
                                        <p class="d-flex total-price">
                                            <span>Total</span>
                                            <span class="priceSpan"></span>
                                        </p>
                                    </div>
                                </div>
                                <p><input type="submit" class="btn btn-primary py-3 px-4" value="Place an order"></p>
                            </form><!-- END -->
                        </div> <!-- .col-md-8 -->
                    </c:if>
                    <c:if test="${mode == 2}">
                        <div class="col-xl-10 ftco-animate">
                            <form id="formOrder" action="Home" class="billing-form ftco-bg-dark p-3 p-md-5">
                                <h3 class="mb-4 billing-heading">Billing Details</h3>               
                                <div class="row">
                                    <div class="cart-detail cart-total ftco-bg-dark p-3 p-md-4">
                                        <h3 class="billing-heading mb-4">Cart Total</h3>
                                        <p class="d-flex">
                                            <span>Order name</span>
                                            <span>${name}</span>
                                        </p>
                                        <p class="d-flex">
                                            <span>Phone</span>
                                            <span>${phone}</span>
                                        </p>
                                        <p class="d-flex">
                                            <span>Order Address</span>
                                            <span>${address}</span>
                                        </p>
                                        <c:forEach items="${mapOrder}" var="i" varStatus="idx">
                                            <p class="d-flex">
                                                <span style="width: 43%">${i.product.name}:</span>
                                                <span style="width: 31%">Quantity: ${i.quantity}</span>
                                                <span>Size: ${i.productSize != null ? i.productSize.name : ''}</span>
                                                <span style="width: 126%">${i.productSize != null ? i.productSize.price + i.product.price : i.product.price}00đ</span>
                                            </p>
                                        </c:forEach>
                                        <p class="d-flex">
                                            <span>Note</span>
                                            <span>${note}</span>
                                        </p>
                                        <p class="d-flex">
                                            <span>Subtotal</span>
                                            <span>${requestScope.total}00đ</span>
                                        </p>
                                        <p class="d-flex">
                                            <span>Discount</span>
                                            <span>${discount}%</span>
                                        </p>
                                        <hr>
                                        <p class="d-flex total-price">
                                            <span>Total</span>
                                            <span class="priceSpan"></span>
                                        </p>
                                    </div>
                                </div>
                                <p style="color: green">${mess}</p>       
                                <p><input type="submit" class="btn btn-primary py-3 px-4" value="Back to Home"></p>
                            </form><!-- END -->
                        </div> <!-- .col-md-8 -->
                    </c:if>
                </div>
            </div>
        </section> <!-- .section -->

        <jsp:include page="Footer.jsp"/>    





        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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
            $(document).ready(function () {

                var quantitiy = 0;
                $('.quantity-right-plus').click(function (e) {

                    // Stop acting like a button
                    e.preventDefault();
                    // Get the field name
                    var quantity = parseInt($('#quantity').val());

                    // If is not undefined

                    $('#quantity').val(quantity + 1);


                    // Increment

                });

                $('.quantity-left-minus').click(function (e) {
                    // Stop acting like a button
                    e.preventDefault();
                    // Get the field name
                    var quantity = parseInt($('#quantity').val());

                    // If is not undefined

                    // Increment
                    if (quantity > 0) {
                        $('#quantity').val(quantity - 1);
                    }
                });

            });
        </script>
        <script>
            var priceSpans = document.querySelectorAll(".priceSpan");

            priceSpans.forEach(function (span) {
                var total = parseFloat("${requestScope.total}");
                var discount = parseFloat("${requestScope.discount}");
                var price = total * (100 - discount) / 100;
                var formattedPrice = price.toFixed(3);
                span.textContent = formattedPrice + "đ";
            });
        </script>
    </body>
</html>
