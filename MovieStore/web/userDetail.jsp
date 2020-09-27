<%-- 
    Document   : UserDetail.jsp
    Created on : 27/09/2020, 10:38:36 PM
    Author     : parkjunhyun
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="uts.asd.dao.UserManager" %>
<%@ page import="uts.asd.model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String id = request.getParameter("id");
    String userType = request.getParameter("userType");
    
    UserManager userManager = (UserManager)session.getAttribute("manager");
    User result = userManager.selectUser(id);

    pageContext.setAttribute("result", result);
    pageContext.setAttribute("userType", userType);
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
            <h3 class="subpage-heading">${userType} Detail</h3>
            <div>
                
                <input type="button" id="" name="" value="delete" onclick="javasciprt:location.href='<%=request.getContextPath()%>/UserServlet?id=${result.id}'"/>
                <input type="button" id="" name="" value="list" onclick="javascript:history.go(-1);"/>
                <input type="button" id="" name="" value="edit" onclick="javasciprt:location.href='./userRegister.jsp?id=${result.id}&userType=${userType}'"/>
            </div>
            <table border="1" style="width:100%">
                <tbody>
                    <tr>
                        <td>fName</td>
                        <td>${result.fName}</td>
                    </tr>
                    <tr>
                        <td>lName</td>
                        <td>${result.lName}</td>
                    </tr>
                    <tr>    
                        <td>email</td>
                        <td>${result.email}</td>
                    </tr>
                    <tr>    
                        <td>mobileNum</td>
                        <td>${result.mobileNum}</td>
                    </tr>
                    <tr>    
                        <td>active</td>
                        <td>${result.active}</td>
                    </tr>    
                </tbody>
            </table>
            <div>
                <input type="button" id="" name="" value="delete" onclick="javasciprt:location.href='<%=request.getContextPath()%>/UserServlet?id=${result.id}&userType=${userType}'"/>
                <input type="button" id="" name="" value="list" onclick="javascript:history.go(-1);"/>
                <input type="button" id="" name="" value="edit" />
            </div>
        </main>
        
        <jsp:directive.include file="admin/footer.jsp" />
    </body>
</html>

