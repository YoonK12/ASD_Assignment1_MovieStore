<%-- 
    Document   : staffMovieList
    Created on : Sep 24, 2020, 5:25:44 PM
    Author     : campf
--%>

<%@page import="java.io.OutputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="uts.asd.model.*"%>
<%@page import="uts.asd.dao.*"%>
<%@page import="uts.model.controller.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">-->
        <title>Movie Collections | Movie Store Admin</title>
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display+SC:wght@400;700;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css" type="text/css"/>
    </head>
    <body>
        <%
            Movie movie = (Movie) session.getAttribute("display");
        %>
        <jsp:directive.include file="admin/header.jsp" />
    <main>
        <form action="/ViewMovieServlet" method="GET">
            <table align="center">
                <c:forEach var="display" items="${display}">
                    <tr>
                        <td><img src="data:image/jpeg;base64,${display.image}" width="50" height="50"></td>
                        <td>${display.title}</td>
                        <td>${display.director}</td>
                        <td>${display.description}</td>
                        <td>
                            <a class="btn btn-info" role="button" href="EditMovieServlet?movieID=<c:out value='${display.movieID}' />">Edit</a>
                            <a class="btn btn-danger" role="button" href="deleteMovieServlet?movieID=<c:out value='${display.movieID}' />">Delete</a>
                        </td>
                    </tr>
                </c:forEach>}
            </table>
        </form>
    </main>
        <jsp:directive.include file="admin/footer.jsp" />
    </body>
</html>
