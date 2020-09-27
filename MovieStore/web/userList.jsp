<%-- 
    Document   : userList
    Created on : 27/09/2020, 10:40:50 PM
    Author     : parkjunhyun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="uts.asd.dao.UserManager" %>
<%@ page import="uts.asd.model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String userType = request.getParameter("userType");
    UserManager userManager = (UserManager)session.getAttribute("manager");
    List<User> resultList = userManager.selectListUser(userType);
    
    pageContext.setAttribute("userType", userType) ;
    pageContext.setAttribute("resultList", resultList) ;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">-->
        <title>Movie Store Admin</title>
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display+SC:wght@400;700;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css" type="text/css"/>
    </head>
    <body>
        <jsp:directive.include file="admin/header.jsp" />
        <main class="main-content admin-content">
            <h1>${userType} List</h1>
            <div>
                <input type="button" id="" name="" value="add" onclick="javasciprt:location.href='./userRegister.jsp?userType=${userType}'"/>
            </div>
            <table border="1" style="width:100%">
                <thead>
                    <tr>
                        <td>fName</td>
                        <td>lName</td>
                        <td>email</td>
                        <td>mobileNum</td>
                        <td>active</td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="result" items="${resultList}">
                        <tr>
                            <td>${result.fName}</td>
                            <td>${result.lName}</td>
                            <td>
                                <a href="./userDetail.jsp?id=${result.id}&userType=${userType}">${result.email}</a>
                            </td>
                            <td>${result.mobileNum}</td>
                            <td>${result.active}</td>
                        </tr>    
                    </c:forEach>
                </tbody>
            </table>
            <div>
                <input type="button" id="" name="" value="add" onclick="javasciprt:location.href='./userRegister.jsp?userType=${userType}'"/>
            </div>
        </main>
        
        <jsp:directive.include file="admin/footer.jsp" />
    </body>
</html>
