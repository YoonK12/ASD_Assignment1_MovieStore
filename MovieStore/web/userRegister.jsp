<%-- 
    Document   : userRegister
    Created on : 27/09/2020, 10:41:51 PM
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
    
    System.out.println("========================= id " + id);
    UserManager userManager = (UserManager)session.getAttribute("manager");
    
    
    pageContext.setAttribute("userType", userType);
    
    if(id != null){
        User result = userManager.selectUser(id);
        pageContext.setAttribute("result", result);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">-->
        <title>Movie Store Admin</title>
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display+SC:wght@400;700;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css" type="text/css"/>
        <style>
table.type11 { border-collapse: separate; border-spacing: 1px; text-align: center; line-height: 1.5; margin: 20px 10px;}
table.type11 th { width: 155px; padding: 10px; font-weight: bold; vertical-align: top; color: #fff; background: #ce4869 ;}
table.type11 td { width: 155px; padding: 10px; vertical-align: top; border-bottom: 1px solid #ccc; background: #eee;}
</style>
    </head>
    <body>
        <jsp:directive.include file="admin/header.jsp" />
        <main class="main-content admin-content">
            <h3 class="subpage-heading">${userType}
                <c:if test="${result == null}">Register</c:if>
                <c:if test="${result != null}">Edit</c:if>
            </h3>
            <div>
                <input type="button" id="" name="" value="list" onclick="javascript:history.go(-1);"/>
                <input type="button" id="" name="" value="${result == null ? 'Register' : 'Edit'}" />
            </div>
                
            <form id="" name="" method="post" action="<%=request.getContextPath()%>/UserServlet"> 
                <input type="hidden" id="userType" name="userType" value="${userType}"/>
                <table class="type11" style="width:100%">
                    <tbody>
                        <tr>
                            <td>fName</td>
                            <td>
                                <input type="text" id="fName" name="fName" value="${result.fName}" />
                            </td>
                        </tr>
                        <tr>
                            <td>lName</td>
                            <td>
                                <input type="text" id="lName" name="lName" value="${result.lName}" />
                            </td>
                        </tr>
                        <tr>    
                            <td>email</td>
                            <td>
                                <input type="text" id="email" name="email" value="${result.email}" />
                            </td>
                        </tr>
                        <tr>    
                            <td>password</td>
                            <td>
                                <input type="text" id="email" name="password" value="${result.password}" />
                            </td>
                        </tr>
                        <tr>    
                            <td>mobileNum</td>
                            <td>
                                <input type="text" id="mobileNum" name="mobileNum" value="${result.mobileNum}" />
                            </td>
                        </tr>
                    </tbody>
                </table>
                            
                <div>
                    <input type="button" id="" name="" value="list" onclick="javascript:history.go(-1);"/>
                    <input type="submit" id="" name="" value="${result == null ? 'Register' : 'Edit'}" />
                </div>
            
            </form>
                        
            
        </main>
        
        <jsp:directive.include file="admin/footer.jsp" />
    </body>
</html>
