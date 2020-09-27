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
                <div>
                    <h2>My Cart</h2>
                    
                    <c:if test="${fn:length(items) > 0}">
                        <form action="/CartServlet" method="GET" class="view-table-form">
                <table>
<!--                    <colgroup>
                        <col width="10%">
                        <col width="10%">
                        <col width="30%">
                        <col width="10%">
                        <col width="20%">
                        <col width="10%">
                        <col width="10%">
                    </colgroup>-->
                    <tr>
                        <th>MovieID</th>
                        <th>POSTER</th>
                        <th>title</th>
                        <th>category</th>
                        <th>price</th>
                        <th>delete</th>
                    </tr>
                    
                    <c:forEach var="item" items="${items}">
                    <tr>
                        <td>${item.movieID}</td>
                        <td><img src="data:image/jpeg;base64,${item.image}"></td>
                        <td>${item.title}</td>
                        <td>${item.category}</td>
                        <td>${item.price}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/cart?method=deleteCart&id=${item.orderLineID}"
                               class="btn btn-danger">delete</a>
                        </td>
                    </tr>
                    </c:forEach>
                </table>
                </form>
                        
                        <div>
                            <a href="${pageContext.request.contextPath}/cart?method=order" class="btn-go-order">Order All</a>
                        </div>
                    </c:if>
                    <c:if test="${fn:length(items) <= 0}">
                        <div class="row justify-content-md-center" style="min-height: 20rem;">
                            <h4>There is nothing in your cart , try to add more</h4>
                        </div>
                    </c:if>
                </div>
                
            </section>
            </main>
            
            <jsp:directive.include file="./inc/footer.jsp" />
        
        </div>
    </body>
</html>

<!--<img src="data:image/jpeg;base64,${display.image}" width="50">-->