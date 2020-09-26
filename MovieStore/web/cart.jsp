<%-- 
    Document   : cart.jsp
    Created on : 2020. 9. 15, 오전 10:42:03
    Author     : heeseong
--%>

<%@page import="java.util.ArrayList" %>
<%@page import="uts.asd.dao.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.sql.Connection" %>
<%@page import="uts.asd.model.Movie" %>
<%@page import="uts.asd.model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">-->
        <title>MY Cart | Movie Store</title>
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display+SC:wght@400;700;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="./css/style.css" type="text/css"/>
    </head>
    <body>
        <div class="container">
            
            <jsp:directive.include file="./inc/header.jsp" />
        
            <main class="main-content admin-content">
            <section>
                <form action="/CartServlet" method="GET" class="view-table-form">
                <table>
                    <colgroup>
                        <col width="10%">
                        <col width="10%">
                        <col width="30%">
                        <col width="10%">
                        <col width="20%">
                        <col width="10%">
                        <col width="10%">
                    </colgroup>
                    <tr>
                        <th>MovieID</th>
                        <th>POSTER</th>
                        <th>title</th>
                        <th>category</th>
                        <th>quantity</th>
                        <th>price</th>
                        <th>delete</th>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td><img src="./image/img_1.png" width="100px"/></td>
                        <td>Umbokdong</td>
                        <td>drama</td>
                        <td>
                            <input type="text" value="1" class="inp-quantity"/>
                            <a class="btn-movie-edit" role="button" href="EditMovieServlet?movieID=<c:out value='${display.movieID}' />">Edit</a>
                        </td>
                        <td>$14.99</td>
                        <td>
                            
                            <a class="btn-movie-delete" role="button" href="deleteMovieServlet?movieID=<c:out value='${display.movieID}' />">Delete</a>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td><img src="./image/img_2.png" width="100px"/></td>
                        <td>Adventure</td>
                        <td>Anime</td>
                        <td>
                            <input type="text" value="1" class="inp-quantity"/>
                            <a class="btn-movie-edit" role="button" href="EditMovieServlet?movieID=<c:out value='${display.movieID}' />">Edit</a>
                        </td>
                        <td>$14.99</td>
                        <td>
                            
                            <a class="btn-movie-delete" role="button" href="deleteMovieServlet?movieID=<c:out value='${display.movieID}' />">Delete</a>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="5" style="text-align: right;padding-right: 1rem;">Total</th>
                        <td colspan="2">$30</td>
                    </tr>
                    <tr>
                        <td colspan="7">
                            <a href="index.jsp">go main</a>
                            <a href="order.jsp"class="btn-go-order">ORDER</a>
                        </td>
                    </tr>
                </table>
                </form>
            </section>
            </main>
            
            <jsp:directive.include file="./inc/footer.jsp" />
        
        </div>
    </body>
</html>

<!--<img src="data:image/jpeg;base64,${display.image}" width="50">-->