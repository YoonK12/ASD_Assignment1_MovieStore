<%-- 
    Document   : movieDetail.jsp
    Created on : 2020. 9. 21, 오후 8:01:57
    Author     : heeseong
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="uts.asd.model.*"%>
<%@page import="uts.asd.dao.*"%>
<%@page import="uts.model.controller.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">-->
        <title>Movie Store | Welcome to Movie Store</title>
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display+SC:wght@400;700;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="./css/style.css" type="text/css"/>
    </head>
    <%
        int movieID = Integer.parseInt(request.getParameter("movieID"));
        DBMovie movieManager = (DBMovie) session.getAttribute("movieManager");
        Movie product = movieManager.fetchMovieWithID(movieID);
        session.setAttribute("product", product);
    %>
    <body>
        <div class="container">
            
            <jsp:directive.include file="./inc/header.jsp" />
            
            <main class="main-content main-movie">
                <section class="movie-list">
                    <div class ="group group2">
                        <div class="sub-content">
                            <h3 class="subpage-heading">Movie Detail</h3>
                            <div class="layout-2col movie-detail">
                                <div class="left-menu">
                                    <p class="movie-detail-img">
                                        <img src="data:image/jpeg;base64,${product.image}">
                                    </p>
                                </div>
                                <div class="right-cont">
                                    <div id="mydetails" class="right-cont-detail">
                                        <div>
                                            <h4 class="movie-title">${product.title}</h4>
                                            <p class="category">${product.category}</p>
                                            <p class="release-date">${product.released_date}</p>
                                            <p class="director">${product.director}</p>
                                            <p class="price">$ ${product.price}</p>
                                            <p class="movie-quantity">
                                                <input type="text" value="1" name="quantity"/>
                                            </p>
                                        </div>
                                        <div>
                                            <a class="btn-add-cart" href='${pageContext.request.contextPath}/cart?method=addToCart&movieID=${display.movieID}' role="button">Add to Cart</a>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="layout-1col">
                                <h4>Description</h4>
                                <p>${product.description}</p>
                            </div>
                        </div>
                    </div>
                </section>
            </main>
            
            <jsp:directive.include file="./inc/footer.jsp" />
        </div>

    </body>
</html>
