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
        <link rel="stylesheet" href="CSSsimple/adminDashbord.css">
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <title>Admin Dashbord</title>     
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
                <form action="ManagerUser" method="post">
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
                        <h1>Manage User</h1>
                    </div>
                </div>

                <div style="margin-top: 3rem;" class="col-md-12">
                    <table class="table">
                        <thead >
                            <tr style="font-size: 20px;">
                                <th scope="col">ID</th>
                                <th scope="col">Name</th>
                                <th scope="col">Email</th>                      
                                <th scope="col">Role</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="p" items="${userList}">
                                <tr>
                                    <th scope="row">${p.getId()}</th>
                                    <td>${p.getName()}</td>
                                    <td>${p.getEmail()}</td>                                
                                    <td>   <form action="EditRole" method="post">
                                            <input type="hidden" name="userId" value="${p.getId()}">
                                            <select name="roleId">
                                                <c:forEach var="role" items="${roleList}">
                                                    <option value="${role.getId()}" ${role.getName() == p.getRole().getName() ? 'selected' : ''}>
                                                        ${role.getName()}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                            <input style="    background: var(--blue);
                                                   border: solid var(--blue);
                                                   color: white;" type="submit" value="Save">
                                        </form></td>                              
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- CONTENT -->
        <script src="js/adminDashbord.js"></script>

    </body>
</html>
