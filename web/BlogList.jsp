<%-- 
    Document   : BlogList
    Created on : May 20, 2023, 8:48:37 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSSsimple/blogList.css"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
              integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        
    </head>
    <body style="background-color: #101012;">
        <jsp:include page="header.jsp"/>
        <div style="margin-top: 100px"></div>
        <h1 style="text-align: center; color: #FF8C00">Blog List</h1>
        <div style="margin-top: 60px"></div>

        <div class="container">
            <div class="row">
                <c:forEach items="${data}" var ="i"> 
                    <div class="col col-md-4 column-style" >
                        <div class="wrap-item">
                            <a href="BlogController?blogId=${i.getBlog_id()}">
                                <img class="item-image" src="${i.getBlog_image()}" alt="image">
                                <div class="item-detail-infor">
                                    <span>${i.getPost_date()}</span>&ensp;
                                    <span>${i.getUser().getName()}</span>&ensp;
                                </div>
                                <div class="item-title" style="color: gray;">

                                    <span style="color: gray">${i.getBlog_title()} </span>

                                </div>
                            </a>
                        </div>
                    </div>
                </c:forEach>

                <!--                <div class="wrap-pagination">
                
                <c:set var="page" value="${requestScope.page}" />
                <div style=" margin-top: 20px">
                <c:forEach begin="${1}" end="${requestScope.numberOfPage}" var="i">
                    <a style="background-color: #d1b33c;
                       color: black;
                       border-radius: 5px;
                       border: 2px inset #e2a222;
                       margin-left: 5px " href="Blog?page=${i}">${i}    
                    </a>

                </c:forEach>
            </div>
        </div>-->
            </div>
        </div>
        <jsp:include page="Footer.jsp"/>
    </body>
</html>
