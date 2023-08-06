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

        <!-- Boxicons -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- My CSS -->
        <link rel="stylesheet" href="CSSsimple/sellerDashbord.css">

        <title>Seller Dashbord</title>     
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>
    <body>
        <!-- SIDEBAR -->
        <jsp:include page="headerSeller.jsp"/>

        <!-- CONTENT -->
        <section id="content">
            <!-- MAIN -->
            <!-- NAVBAR -->
            <nav>
                <i class='bx bx-menu' ></i>
                <form action="#">
                    <div class="form-input">                  
                    </div>
                </form>
                <a href="#" class="profile">
                </a>
            </nav>
            <!-- NAVBAR -->

            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>Seller Manage</h1>
                        <ul class="breadcrumb">
                            <li>
                                <a href="#"></a>
                            </li>
                            <li>
                                <a class="active" href="#"></a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <h3>Order confirmation</h3>                   
                        </div>             
                        <table>
                            <thead>
                                <tr>
                                    <th>Name Order</th>
                                    <th>Date Order</th>
                                    <th>Notes</th>
                                    <th>Address Order</th>
                                    <th>Phone Order</th>
                                    <th>Status Order</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${olist}" var="o">
                                    <tr>
                                        <td><p>${o.getOrderName()}</p></td>
                                        <td>${o.formatDate()}</td>
                                        <td><textarea class="note" readonly>${o.getNotes()}</textarea></td>
                                        <td><textarea class="address" readonly>${o.getAddress()}</textarea></td>
                                        <td>${o.getPhone()}</td>
                                        <td>
                                            <form action="updateOrderStatus" method="get">
                                                <span class="status process">

                                                    <select name="select" style="background-color: var(--yellow); border: solid var(--yellow);" onchange="this.form.submit()">
                                                        <option value="0">${o.getStatus().getName()}</option> 
                                                        <c:forEach items="${otlist}" var="ot">
                                                            <option value="${ot.getId()}&${o.getId()}">${ot.getName()}</option>
                                                        </c:forEach>
                                                    </select>   
                                                </span>
                                            </form>
                                        </td>   
                                    </tr>                               
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- CONTENT -->
        <script src="js/adminDashbord.js"></script>
    </body>
</html>
