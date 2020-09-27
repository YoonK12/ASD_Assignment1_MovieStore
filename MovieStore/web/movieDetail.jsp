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
        Movie movie = movieManager.fetchMovieWithID(movieID);
        session.setAttribute("movie", movie);
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
                                        <img src="data:image/jpeg;base64,${movie.image}">
                                    </p>
                                </div>
                                <div class="right-cont">
                                    <div id="mydetails" class="right-cont-detail">
                                        <div>
                                            <h4 class="movie-title" name="movieTitle">${movie.title}</h4>
                                            <p class="category" name="movieCategory">${movie.category}</p>
                                            <p class="release-date" name="movieReleasedDate">Released Date : ${movie.released_date}</p>
                                            <p class="director" name="movieDirector">Director : ${movie.director}</p>
                                            <p class="price" name="moviePrice">$ ${movie.price}</p>
                                        </div>
                                            
                                        <form action="ViewMovieDetailServlet" method="POST">  
                                        <div class="add-cart">
                                            
                                            <a class="btn-add-cart" href="cart.jsp?method=addToCart&movieID=${movie.movieID}"role="button">Add to Cart</a>
                                        </div>
                                        </form>

                                    </div>
                                </div>
                            </div>
                            <div class="layout-1col">
                                <h4>Description</h4>
                                <p>${movie.description}</p>
                            </div>
                        </div>
                    </div>
                </section>
            </main>
            
            <jsp:directive.include file="./inc/footer.jsp" />
        </div>

    </body>
</html>
