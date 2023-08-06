<%--
    Document   : AdminDashbord
    Created on : Jun 6, 2023, 8:26:05 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <!-- Boxicons -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- My CSS -->
        <link rel="stylesheet" href="CSSsimple/sellerDashbord.css">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <title>Manage Order</title>
    </head>
    <body>
        <!-- SIDEBAR -->
        <jsp:include page="headerSeller.jsp" />
        <!-- SIDEBAR -->
        <!-- CONTENT -->
        <section id="content">
            <!-- NAVBAR -->
            <nav>
                <i class='bx bx-menu'></i>
                <form action="ManageOrder" method="post" onsubmit="return checkDate()">
                    <div class="form-input">
                    </div>
                </form>
            </nav>
            <!-- NAVBAR -->

            <!-- MAIN -->
            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>Manage Order</h1>
                    </div>

                    <div>
                        <form action="ManageOrder" method="post" onsubmit="return checkDate();">
                            <input required type="date" name="firstDate">
                            <input style="margin: 14px" required type="date" name="secondDate">
                            <input style="background: var(--blue);
                                   color: white;
                                   border: solid var(--blue);
                                   font-size: 17px;
                                   border-radius: 15px;" type="submit" value="Search">
                        </form>
                    </div>
                    <a href="DownloadOrder" class="btn-download">
                        <i class='bx bxs-cloud-download'></i>
                        <span class="text">Download Excel</span>
                    </a>
                </div>

                <div style="margin-top: 3rem;" class="col-md-12">
                    <table class="table">
                        <thead>
                            <tr style="font-size: 20px;">
                                <th scope="col">Order ID</th>
                                <th scope="col">Order Name</th>
                                <th scope="col">Status</th>
                                <th scope="col">Order Date</th>
                                <th scope="col">Note</th>
                                <th scope="col">Address</th>
                                <th scope="col">Phone</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="o" items="${olist}">
                                <tr>
                                    <th scope="row">
                                        <a style="color: white" class="btn btn-primary" data-toggle="modal" data-target="#myDialog" onclick="getOrderDetails(this)" data-orderid="${o.getId()}">${o.getId()}</a>
                                    </th>
                                    <td>${o.getOrderName()}</td>
                                    <td>${o.getStatus().getName()}</td>
                                    <td>${o.formatDate()}</td>
                                    <td><textarea class="note" readonly>${o.getNotes()}</textarea></td>
                                    <td><textarea class="address" readonly>${o.getAddress()}</textarea></td>
                                    <td>${o.getPhone()}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- CONTENT -->

        <div class="modal fade" id="myDialog" tabindex="-1" role="dialog" aria-labelledby="myDialogLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="myDialogLabel">Chi tiết đơn hàng</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- Thông tin đơn hàng -->
                        <div class="bill-section">
                            <div class="bill-info" id="order-info">
                                <!-- Dữ liệu đơn hàng sẽ được thêm vào đây -->
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <script src="js/adminDashbord.js"></script>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
                                            function checkDate() {
                                                var firstDate = document.getElementsByName("firstDate")[0].value;
                                                var secondDate = document.getElementsByName("secondDate")[0].value;

                                                if (firstDate && secondDate && new Date(secondDate) < new Date(firstDate)) {
                                                    alert("Second date must be after the first date.");
                                                    return false;
                                                }
                                                return true;
                                            }
        </script>
        <script>
            function getOrderDetails(element) {
                var orderId = element.getAttribute("data-orderid");
                $.ajax({
                    url: 'GetOrderDetail?orderId=' + orderId,
                    type: 'GET',
                    success: function (response) {
                        // Cập nhật thông tin đơn hàng và chi tiết sản phẩm
                        $('#myDialogLabel').text('Order details ' + orderId);
                        $('#order-info').html(response);
                        $('#myDialog').modal('show');
                    },
                    error: function () {
                        console.error('Failed to get order details');
                    }
                });
            }
        </script>
    </body>
</html>
