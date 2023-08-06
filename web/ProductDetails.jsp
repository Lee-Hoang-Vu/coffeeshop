<%-- 
    Document   : ProductDetails
    Created on : May 25, 2023, 12:04:42 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Coffee</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans:400,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Great+Vibes" rel="stylesheet">


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
                            <h1 class="mb-3 mt-5 bread">Product Detail</h1>
                        </div>

                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 mb-5 ftco-animate">
                        <img src="${p.getImage()}" class="img-fluid" alt="Colorlib Template">
                    </div>
                    <div class="col-lg-6 product-details pl-md-5 ftco-animate">
                        <h3>${p.getName()}</h3>

                        <p class="price">
                        <p style="    font-size: 30px;
                           color: #f8b500;"><span style="color:#f8b500 " id="product-price">${p.getPrice()}</span>,000đ</p>
                        <span id="selected-size-price" style="display: none;"></span>
                        </p>

                        <p>${p.getDecription()}</p>	
                        <form action="AddToCart" method="post"> 
                            <div class="row mt-4">
                                <div class="col-md-6">
                                    <div class="form-group d-flex">
                                        <div class="select-wrap">
                                            <span style="font-size: 20px">Select Size:</span><br>
                                            <c:forEach items="${slist}" var="s">
                                                <label>
                                                    <span><input type="radio" name="psize" value="${s.getId()}" required>${s.getName()}: <p style="color: #f8b500; display: inline-block"> +${s.getPrice()}</span>00đ</p>
                                                </label><br>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <div class="w-100"></div>
                                <div class="input-group col-md-6 d-flex mb-3">
                                    <span class="input-group-btn mr-2">
                                        <button type="button" class="quantity-left-minus btn"  data-type="minus" data-field="">
                                            <i class="icon-minus"></i>
                                        </button>
                                    </span>
                                    <input type="text" id="quantity" name="quantity" class="form-control input-number" value="1" min="1" max="100" readonly>
                                    <span class="input-group-btn ml-2">
                                        <button type="button" class="quantity-right-plus btn" data-type="plus" data-field="">
                                            <i class="icon-plus"></i>
                                        </button>
                                    </span>
                                </div>
                            </div>
                            <input type="hidden" value="${p.getId()}" name="pid">
                            <p><input type="submit" value="Add to Cart" class="btn btn-primary py-3 px-5"></p>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 ftco-animate">
                        <c:if test="${sessionScope['account']!=null && index == 1}">
                            <div class="comment-form-wrap pt-5">
                                <form action="FeedbackController" method="post">
                                    <h3 class="mb-5">${sessionScope['account'].getName()}</h3>
                                    <input value="${p.getId()}" name="pid" type="hidden">
                                    <input value="${sessionScope['account'].getId()}" name="userid" hidden>

                                    <div class="form-group">
                                        <label for="message">Comments</label>
                                        <textarea name="content" id="message" cols="30" rows="10" class="form-control"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <input type="submit" value="Post Comment" class="btn py-3 px-4 btn-primary">
                                    </div>
                                </form>
                            </div>
                        </c:if>

                        <div class="pt-5 mt-5">
                            <h3 class="mb-5">${count} Comments</h3>
                            <ul class="comment-list">
                                <c:forEach items="${feedback}" var ="i"> 
                                    <li class="comment">
                                        <div class="vcard bio">

                                        </div>
                                        <div class="comment-body">
                                            <h3>${i.getUser().getName()}</h3>
                                            <div class="meta">${i.formatDate()}</div>
                                            <p>${i.getContent()}</p>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                            <!-- END comment-list -->
                        </div>
                    </div> <!-- .col-md-8 -->      
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
                var basePrice = ${p.getPrice()}; // Get the base price from the server
                var quantity = parseInt($('#quantity').val()); // Get the initial quantity value

                function formatPrice(price) {
                    return price.toLocaleString('en-US');
                }

                // Function to update the price based on the size and quantity
                function updatePrice() {
                    var selectedSizePrice = parseInt($('#selected-size-price').text()); // Get the price of the selected size
                    var totalPrice = (basePrice + selectedSizePrice) * quantity; // Calculate the total price
                    $('#product-price').text(formatPrice(totalPrice)); // Update the displayed price
                }

                // Increase quantity event
                $('.quantity-right-plus').click(function (e) {
                    e.preventDefault();
                    var selectedSize = $('input[name="psize"]:checked').val(); // Get the selected size value

                    if (selectedSize === undefined || selectedSize === "") {
                        alert("Please select a size before changing the quantity.");
                        return;
                    }

                    if (quantity < 50) {
                        quantity++; // Increase the quantity value
                        $('#quantity').val(quantity); // Update the quantity input value
                        updatePrice(); // Update the price based on the new quantity and selected size
                    }
                });


                // Decrease quantity event
                $('.quantity-left-minus').click(function (e) {
                    e.preventDefault();
                    var selectedSize = $('input[name="psize"]:checked').val(); // Get the selected size value

                    if (selectedSize === undefined || selectedSize === "") {
                        alert("Please select a size before changing the quantity.");
                        return;
                    }

                    if (quantity > 1) {
                        quantity--; // Decrease the quantity value
                        $('#quantity').val(quantity); // Update the quantity input value
                        updatePrice(); // Update the price based on the new quantity and selected size
                    }
                });


                // Size selection event
                $('input[name="psize"]').change(function () {
                    var selectedSizePrice = parseInt($('#selected-size-price').text()); // Get the price of the selected size
                    updatePrice(); // Update the price based on the selected size and current quantity
                });

                // Initial price update
                updatePrice();
            });
        </script>
        <script>
            $(document).ready(function () {
                // Lấy giá ban đầu từ server
                var basePrice = ${p.getPrice()};
                // Hiển thị giá ban đầu
                $('#product-price').text(basePrice);

                // Xử lý sự kiện khi chọn size
                $('input[name="psize"]').change(function () {
                    // Lấy giá trị của size được chọn
                    var selectedSizeId = $(this).val();
                    // Gửi yêu cầu AJAX để lấy giá của size từ server
                    $.ajax({
                        url: 'GetPriceBySize', // Đường dẫn tới servlet hoặc controller để xử lý yêu cầu
                        type: 'POST',
                        data: {sizeId: selectedSizeId, productId: ${p.getId()}}, // Gửi tham số kích thước và ID sản phẩm
                        success: function (response) {
                            // Cập nhật giá mới
                            $('#selected-size-price').text(response);
                            // Hiển thị giá mới
                            $('#product-price').text(basePrice + parseInt(response));
                        },
                        error: function (xhr, status, error) {
                            console.log(error); // Xử lý lỗi nếu có
                        }
                    });
                });
            });
        </script>
    </body>
</html>
