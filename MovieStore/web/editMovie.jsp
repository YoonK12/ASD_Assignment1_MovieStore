<%-- 
    Document   : editMovie
    Created on : Sep 27, 2020, 2:25:14 PM
    Author     : campf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.asd.model.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Movie | Movie Store Admin</title>
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display+SC:wght@400;700;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css" type="text/css"/>
    </head>
    <body>
        <%
           Movie movie = (Movie) session.getAttribute("movie");
        %>
        <jsp:directive.include file="admin/header.jsp" />
        <main class="main-content admin-content">
            <h1>Edit Movie Information:</h1>
            <section class="movie-list admin-section">
                <form method="post" action="UpdateMovieServlet" enctype="multipart/form-data" class="admin-form">
                    <div>
                        <label for="movieID">Movie ID</label>
                        <input type="text" value="${movie.movieID}" name="movieID">
                    </div>
                    <div>
                        <label for="movieTitle">Movie Title</label>
                        <input type="text" value="${movie.title}" name="title">
                    </div>
                    <div>
                        <label for="type">Director</label>
                        <input type="text" value="${movie.director}" name="director">
                    </div>

                    <div>
                        <label for="description">Movie Description</label>
                        <textarea name="description" rows="10" cols="30">${movie.description}</textarea>
                        <%--<td><input type="text" placeholder="<%=(productDescriptionErr != null ? productDescriptionErr :  "Enter Description")%>" name="description"></td>--%>
                    </div>
                    <div>
                        <label for="moviePoster">Poster</label>
                        <input type="file" name="image"/>
                    </div>
                    <div>
                        <label for="price">Price</label>
                        <input type="text" value="${movie.price}" name="price">
                    </div>
                    <div>
                        <label for="releasedDate">Released Date</label>
                        <input type="text" value="${movie.released_date}" name="released_date">
                    </div>
                    <div>
                        <label for="category">Categories</label>
                        <input type="text" value="${movie.category}" name="category">
                    </div>
                    <div>
                        <input type="submit" value="Submit">
                        <a href="ViewStaffMainServlet" role="button">Cancel</a>    
                    </div>
                </form>   
            </section>
        </main>
        <jsp:directive.include file="admin/footer.jsp" />
    </body>
</html>
