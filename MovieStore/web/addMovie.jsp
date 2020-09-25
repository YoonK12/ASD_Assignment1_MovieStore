<%-- 
    Document   : addMovie
    Created on : Sep 21, 2020, 6:03:05 PM
    Author     : campf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.model.controller.*"%>
<%@page import="uts.asd.model.*"%>
<%@page import="uts.asd.dao.*"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">-->
        <title>Add New Movie | Movie Store Admin</title>
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display+SC:wght@400;700;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css" type="text/css"/>
    </head>
    <body>
        <%
            String Message = (String) session.getAttribute("Message");
        %>
        <jsp:directive.include file="admin/header.jsp" />
        <main class="main-content admin-content">

            <section class="movie-list admin-section">
                <h2>Add New Movie</h2>
                <p><span class="message"> <%=(Message != null ? Message : "")%></span></p> 
                <form method="post" action="addMovieServlet" enctype="multipart/form-data" class="admin-form">
                    <div>
                        <label for="movieTitle">Movie Title</label>
                        <input type="text" placeholder="Enter Movie title" name="title">
                    </div>
                    <div>
                        <label for="type">Director</label>
                        <input type="text" placeholder="Enter Director" name="director">
                    </div>

                    <div>
                        <label for="description">Movie Description</label>
                        <textarea name="description" placeholder="Enter Description" rows="10" cols="30"></textarea>
                        <%--<td><input type="text" placeholder="<%=(productDescriptionErr != null ? productDescriptionErr :  "Enter Description")%>" name="description"></td>--%>
                    </div>
                    <div>
                        <label for="moviePoster">Poster</label>
                        <input type="file" name="image"/>
                    </div>
                    <div>
                        <label for="price">Price</label>
                        <input type="text" placeholder="Enter Price: 0.00" name="price">
                    </div>
                    <div>
                        <label for="releasedDate">Released Date</label>
                        <input type="text" placeholder="Enter Released Date: Feb-26-2000" name="released_date">
                    </div>
                    <div>
                        <label for="category">Categories</label>
                        <input type="text" placeholder="Enter categories" name="category">
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
