<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="no-js" lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Boxicons -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- My CSS -->
        <link rel="stylesheet" href="CSSsimple/adminDashbord.css">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/nice-select.css" rel="stylesheet">
        <script src="ckeditor/ckeditor.js"></script> 
        <script src="ckfinder/ckfinder.js"></script>
        <title>Admin Dashboard</title>     
    </head>

    <body>
        <!-- SIDEBAR -->
        <jsp:include page="headerDashbord.jsp"/>
        <!-- SIDEBAR -->

        <!-- CONTENT -->
        <section id="content">
            <!-- NAVBAR -->
            <nav>
                <i class='bx bx-menu' ></i>
                <form action="ManageProduct" method="post">
                    <div class="form-input">
                        <input type="search" name="search" placeholder="Search...">
                        <button type="submit" class="search-btn"><i class='bx bx-search' ></i></button>
                    </div>
                </form>

            </nav>
            <!-- NAVBAR -->

            <!-- MAIN -->
            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>Manage Product</h1>
                    </div>
                    <div>
                        <form action="ManageProduct" method="post" onsubmit="return checkDate();">
                            <input required type="date" name="firstDate">
                            <input style="margin: 14px" required type="date" name="secondDate">
                            <input style="background: var(--blue);
                                   color: white;
                                   border: solid var(--blue);
                                   font-size: 17px;
                                   border-radius: 15px;" type="submit" value="Search">
                        </form>
                    </div>
                </div>


                <div style="margin-top: 3rem;" class="col-md-12">       
                    <button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#myModalAddNew">Add Product</button>
                    <!-- Modal -->
                    <div class="modal fade" id="myModalAddNew" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Add New product:</h4>
                                </div>
                                <form action="AddNewProduct" method="post" enctype="multipart/form-data">
                                    <div class="modal-body">
                                        <b>Name: </b><input type="text" class="form-control" value="" required name="name"><br>
                                        <b>Price: </b><input type="number" min ="1" class="form-control"  required value="" name="price"><br>
                                        <b>Category: </b>
                                        <div style="height: 50px; width: 100%">
                                            <select  class="form-control" style="display: block;" name="category" >
                                                <c:forEach var="c" items="${clist}">
                                                    <option value="${c.getId()}" ${p.getCategory().getName()==c.getName()?"selected":""} >${c.getName()} </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <b>Description: </b><textarea class="form-control" required value="" name="descri"></textarea><br>
                                        <b>Image link:</b><input type="file" class="form-control" required  value="" name="img"><br>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-success" value="submit">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <table class="table" style="margin-top: 20px; margin-bottom: 20px;">
                        <thead >
                            <tr style="font-size: 20px;">
                                <th scope="col">ID</th>
                                <th scope="col">Name</th>
                                <th scope="col">Price</th>
                                <th scope="col">Category</th>
                                <th scope="col">Status</th>
                                <th scope="col">Create Date</th>
                                <th scope="col">Description</th>
                                <th scope="col">Image</th>
                                <th scope="col" colspan="2" style="text-align: center">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="p" items="${pl}">
                                <tr>
                                    <th scope="row">${p.getId()}</th>
                                    <td>${p.getName()}</td>
                                    <td>${p.getPrice()}</td>
                                    <td>${p.getCategory().getName()}</td>
                                    <td><a href="UpdateStatusProduct?pid=${p.getId()}&psid=${p.getStatus().getId()}">${p.getStatus().getName()}</a></td>
                                    <td>${p.getCreateDate()}</td>
                                    <td style="width: 30%;">${p.getDecription()}</td>
                                    <td><img style="width:150px;height:150px;"src="${p.getImage()}"></td>

                                    <td> <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal${p.getId()}" onclick="showImage('${p.getImage()}')">Edit</button></td>

                                </tr>
                                <!-- Modal -->
                            <div class="modal fade" id="myModal${p.getId()}" role="dialog">
                                <div class="modal-dialog">
                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Edit product:</h4>
                                        </div>
                                        <form action="EditProduct" method="post" enctype="multipart/form-data">
                                            <div class="modal-body">
                                                <b>ID: </b><input type="text" class="form-control" name="id" value="${p.getId()}" readonly=""><br>
                                                <b>Name: </b><input type="text" class="form-control" value="${p.getName()}" name="name"><br>
                                                <b>Price: </b><input type="number"  min ="0" class="form-control" value="${p.getPrice()}" name="price"><br>
                                                <b>Category: </b>
                                                <div style="height: 50px; width: 100%">
                                                    <select  class="form-control" style="display: block;" name="category" >
                                                        <c:forEach var="c" items="${clist}">
                                                            <option value="${c.getId()}" ${p.getCategory().getName()==c.getName()?"selected":""} >${c.getName()} </option>
                                                        </c:forEach>
                                                    </select>
                                                </div>                         
                                                <b>Description: </b><textarea class="form-control"name="descri">${p.getDecription()}</textarea> <br>
                                                <c:if test="${p.getImage() != null}">
                                                    <img style="width:150px;height:150px;" src="${p.getImage()}" id="originalImage">
                                                </c:if>
                                                <br>
                                                <b>Image link:</b><input type="text" value="${p.getImage()}" class="form-control" name="img">
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-success" value="submit">Submit</button>
                                            </div>
                                        </form>                                 
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- CONTENT -->
        <script src="js/adminDashbord.js"></script>
        <script src="js/jquery-3.4.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>