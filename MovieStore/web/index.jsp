<%-- 
    Document   : index
    Created on : Sep 14, 2020, 1:43:33 PM
    Author     : Heeseong Jeon
--%>

<%@page import="uts.asd.model.Movie"%>
<%@page import="uts.asd.model.User"%>
<%@page import="uts.asd.dao.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">-->
        <title>Movie Store | Welcome to Movie Store</title>
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display+SC:wght@400;700;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="./css/style.css" type="text/css"/>
    </head>
    <body>
        <%
            Movie movie = (Movie) session.getAttribute("display");
        %>
<!--        <div class="container bg-image">-->
     
        <div class="container">
            
            <jsp:directive.include file="./inc/header.jsp" />
            
                            <style>
                        #bg{
                                background: url(./image/bg.jpg) no-repeat;
                                background-size: contain;
                                height: 37rem;
                                position: relative;
                                padding: 0;
                        }
                        #main-bg{
                                background-color: rgba(255,255,255,.5);
                                padding: 2rem;
                                max-height: 44rem;
                                                    }
                    </style>
                    
            <main class="main-content main-movie" >
                <section class="movie-list" >
                    
                    <c:if test="${fn:length(display) > 0}">
                        
                    <form action="/ViewMainServlet" method="GET">
                        <div class ="group group1">
                            
                            <c:forEach var="display" items="${display}">
                            <div class="movie-item">
                                <h3 class="movie-heading" name="movieTitle">${display.title}</h3>
                                <p class="movie-poster">
                                    <img src="data:image/jpeg;base64,${display.image}">
                                </p>
                                <p class="movie-price">$ ${display.price}</p>
                                <p class="more"><a href="./movieDetail.jsp?movieID=${display.movieID}">See more..</a></p>

                               
                                <!--<p class="add-item"><button class="btn-add-cart" href='${pageContext.request.contextPath}/cart.jsp?method=addToCart&movieID=${display.movieID}' role="button">Add to Cart</button></p>-->
                            </div>
                            </c:forEach>
                            
                        </div>
                        </form>
                        </c:if>
                    <c:if test="${fn:length(display) <= 0}">
                        <div id="main-bg">
                            <div id="bg"></div>
                        </div>
                    </c:if>
                </section> 
            </main>
            
            <jsp:directive.include file="./inc/footer.jsp" />
            
            <jsp:include page="/ConnServlet" flush="true" />
    </body>
</html>
