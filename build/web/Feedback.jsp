<%-- 
    Document   : Feedback
    Created on : Jun 2, 2023, 4:44:56 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Feedback Form</title>
    </head>
    <style>

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp"/>
    <div>
        <form  action="FeedbackController" method="post"
               style=" max-width: 72%;
               margin-left: 290px;

               padding: 20px;">
            <div  class="" style="padding: 2px;">           
                <input value="${p.getId()}" name="pid" hidden>
            </div>
            <div  class="" style="padding: 2px;">           
                <input value="${sessionScope['account'].getId()}" name="user_id" hidden>
            </div>
            <div  class="" style="padding: 2px;">           
                <input value="${sessionScope['account'].getId()}" name="user_id" hidden>
            </div>
            <h5>Feedback:</h5>
            <span style="
                   margin-top: -10px;
                   font-weight: bold;" for="feedback"></span>
                   <c:if test="${sessionScope['account']!=null && index == 1}">
            <textarea style="width: 50%;
                      height: 100px;
                      margin-left: 10px;
                      border-radius: 4px;
                      display: inline-block;
                      resize: vertical;" id="feedback" name="content" rows="5" required></textarea>
                      <div style="margin-left: 700px; margin-top: -40px  "><input type="submit" value="Send"></div>
                           </c:if>
        </form>


        <div style=" max-width: 70%; margin-left: 300px" >
            <div class ="">
                <c:forEach items="${feedback}" var ="i"> 

                    <div style="border-bottom: solid 1px; margin-top: 15px">
                        <div class = "user">
                            <h5>${i.getUser().getName()}</h5>
                        </div>
                        <div class = "feedback" style="margin-left: 50px">
                            <span style="font-size: 20px; color: white">${i.getContent()}</span>
                        </div>
                    </div>
                </c:forEach>
            </div>

        </div>
    </div>
    <div style="margin-bottom: 200px"></div>
    <jsp:include page="Footer.jsp"/>
</body>
</html>