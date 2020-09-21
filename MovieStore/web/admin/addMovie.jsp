<%-- 
    Document   : addMovie
    Created on : Sep 21, 2020, 6:03:05 PM
    Author     : campf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <title>Add Movie Collection</title>
    </head>
    <body>
        <%
            
        %>
        <h1 style="text-align:center;">Add New Movie</h1>
        <form method="post" action="addMovieServlet">
            <div style="position: fixed; top: 55%; left: 50%; transform: translate(-50%, -50%);">
            <div class="form-inline">
                <div class="form-group">
                    <label for="movieTitle">Movie Title:</label>
                    <input class="form-control" type="text" placeholder="Enter Movie title" name="title">
                    </div>
                <div class="form-group">
                    <label for="type">Director</label>
                    <input class="form-control" type="text" placeholder="Enter Director" name="director">
                </div>
                <div class="form-group">
                    <label for="description">Product Description:</label>
                    <textarea class="form-control" name="description" placeholder="Enter Description" rows="10" cols="30"></textarea>
                    <%--<td><input type="text" placeholder="<%=(productDescriptionErr != null ? productDescriptionErr :  "Enter Description")%>" name="description"></td>--%>
                </div>
                <div>
                    <label for="moviePoster">Poster:</label>
                    <input type="file" name="image"/>
                </div>
                <div class="form-group">
                    <label for="price">Price:</label>
                    <input class="form-control" type="text" placeholder="Enter Price: 0.00" name="price">
                </div>
                <div class="form-group">
                    <label for="releasedDate">Released Date:</label>
                    <input class="form-control" type="text" placeholder="Enter Released Date: Feb-26-2000" name="released_date">
                </div>
                <input class="btn btn-secondary" type="submit" value="Submit">
                <a class="btn btn-secondary" href="ViewStaffMainServlet" role="button">Cancel</a>
            </div>
            </div>
        </form>
    </body>
</html>
