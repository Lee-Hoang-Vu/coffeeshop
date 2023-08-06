<%-- 
    Document   : ManageBlog
    Created on : Jun 18, 2023, 11:14:15 PM
    Author     : Hoàng Vũ
--%>
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
        <title>Coffee</title>     
           <script src="ckeditor/ckeditor.js"></script> 
        <script src="ckfinder/ckfinder.js"></script>
        <title>Seller Dashbord</title>   
        <style>
            /* Định dạng nút View */
            .viewButton {
                margin-top: 10px;
                background: none;
                border: none;
                padding: 0;
                cursor: pointer;
            }

            /* Định dạng biểu tượng mắt */
            .eye-icon {
                width: 16px;
                height: 16px;
                background-image: url("image/eye.jpg");
                /* Đường dẫn tới ảnh biểu tượng mắt */
                background-repeat: no-repeat;
                background-size: cover;
                display: inline-block;
                transform: scale(2);
                border: 2px solid transparent;
                /* Viền mặc định là trong suốt */
                border-radius: 50%;
                /* Bo tròn viền */
                transition: box-shadow 0.3s ease;
                /* Hiệu ứng chuyển động mượt mà cho box-shadow */
            }
            .viewButton:hover .eye-icon {
                border: 2px solid limegreen;
                /* Viền sáng màu xanh lá cây */
            }
        </style>
    </head>

    <body>
        <!-- SIDEBAR -->
        <jsp:include page="headerSeller.jsp"/>
        <!-- SIDEBAR -->

        <!-- CONTENT -->
        <section id="content">
            <!-- NAVBAR -->
            <nav>
                <i class='bx bx-menu' ></i>
                <form action="ManageBlog" method="post">
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
                        <h1>Manage Blogs</h1>
                    </div>
                    <div>
                        <form action="ManageBlog" method="post" onsubmit="return checkDate();">
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
                    <button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#myModalAddNew">Add Blog</button>
                    <!-- Modal -->
                    <div class="modal fade" id="myModalAddNew" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Add Blog</h4>
                                </div>
                                <form action="AddBlog" method="post" enctype="multipart/form-data">
                                    <div class="modal-body">
                                        <b>Title: </b><input type="text" class="form-control" value="" required name="title"><br>  
                                        <b>Content: </b>
                                        <div class="form-control">
                                            <textarea id="edit" rows="5" name="content" class="form-control" placeholder="Write some thing..." required=""></textarea>
                                        </div>
                                        
                                        <b>Image:</b><input type="file" class="form-control" required  value="" name="img"><br>
                                        <b><input type="hidden" class="form-control" required  value="${sessionScope['account'].getId()}" name="user"></b>
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
                                <th scope="col">Title</th>
                                <th scope="col">Creator</th>
                                <th scope="col">Create Date</th>
                                <th scope="col">Content</th>
                                <th scope="col">Image</th>
                                <th scope="col" colspan="2" style="text-align: center">Action</th>
                            </tr>
                        </thead>

                        <c:forEach var="bl" items="${bl}">
                            <tr>
                                <th scope="row">${bl.getBlog_id()}</th>
                                <td>${bl.getBlog_title()}</td>
                                <td>${bl.getUser().getName()}</td>   
                                <td>${bl.getPost_date()}</td>
                                <td>
                                    <details>
                                        <summary style="color:blue">Show</summary>
                                        <p>${bl.getContent()}</p>
                                    </details>
                                </td>
                                <td><img style="width:150px;height:150px;"src="${bl.getBlog_image()}"></td>
                                <td>
                                    <a href="DeleteBlog?bid=${bl.getBlog_id()}" class="btn- btn-danger  btn-lg" style="display: block;" onclick="return confirm('Bạn có chắc chắn muốn xóa không?')">Delete</a>
                                </td>

                                <td> <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal${bl.getBlog_id()}">Edit</button></td>

                                <td>
                                    <button class="viewButton" data-blog-id="${bl.getBlog_id()}">
                                        <span class="eye-icon"></span>
                                    </button>

                                </td>
                            </tr>
                            <div class="modal fade" id="myModal${bl.getBlog_id()}" role="dialog">
                                <div class="modal-dialog">
                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Edit blog:</h4>
                                        </div>
                                        <form action="EditBlog" method="post">
                                            <div class="modal-body">
                                                <b>ID: </b><input type="text" class="form-control" name="id" value="${bl.getBlog_id()}" readonly=""><br>
                                                <b>Title: </b><input type="text" class="form-control" value="${bl.getBlog_title()}" name="title"><br>
                                                <b>Creator: </b><input type="text" class="form-control" value="${bl.getUser().getName()}" name="user" readonly=""><br>    
                                                <b>Content: </b><textarea class="form-control"name="content">${bl.getContent()}</textarea><br>
                                                <b>Image link:</b><input type="text" class="form-control" value="${bl.getBlog_image()}" name="img">
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
                    </table>
                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- CONTENT -->
        <script>
            // Lắng nghe sự kiện khi nút "View" được bấm
            var viewButtons = document.getElementsByClassName("viewButton");
            for (var i = 0; i < viewButtons.length; i++) {
                viewButtons[i].addEventListener("click", function () {
                    // Lấy giá trị blog_id từ thuộc tính data-blog-id
                    var blogId = this.dataset.blogId;

                    // Mở một cửa sổ mới với URL BlogController và tham số blogId
                    window.open("BlogController?blogId=" + blogId, "_blank");
                });
            }
        </script>
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
        <script >

            CKEDITOR.replace('edit', {
                filebrowserBrowseUrl: 'ckfinder/ckfinder.html',
                filebrowserUploadUrl: 'ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files'
            });
        </script>
        <script src="js/adminDashbord.js"></script>
        <script src="js/jquery-3.4.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

    </body>

</html>
