<%-- 
    Document   : header
    Created on : 2020. 9. 20, 오후 5:41:15
    Author     : heeseong
--%>
<%@page import="uts.asd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="header main-header">
    <h1 class="logo-heading"><a href="./index.jsp" class="logo">Movie Store</a></h1>

    <nav>
        <ul class="nav-category">
            <li><a href="#">Top 10</a></li>
            <li><a href="#">Romantic/Comedy</a></li>
            <li><a href="#">Horror</a></li>
            <li><a href="#">SF/Mistery</a></li>
            <li><a href="#">Animations</a></li>
        </ul>
    </nav>
    <div class="search-bar">
        <form action="action" method="get" class="search-form">
            <fieldset>
                <legend class="readable-hidden">Searching movies</legend>
                <p>
                    <label for="input-movie-title" class="readable-hidden">Search:</label>
                    <input type="text" name="Title" id="input-movie-title" class="input-movie-title" placeholder="What MOVIE are you looking for?"/>

                    <input type="submit" value="Search" class="btn-search" onclick="alert('go search.');return false;"/>
                </p>
            </fieldset>
        </form>
    </div>
    <div class="member">
        <ul>
            <%
            User user= (User) session.getAttribute("user");                     
            if (user == null) {
            %>
            <li><a href="./login.jsp">Login</a></li>
            <li><a href="./register.jsp">Register</a></li>
            <% } else {
            %>

            <li><a href="./profile.jsp">Account</a></li>
            <li><a href="LogoutServlet">Logout</a></li>
            <li><button type="button" class="btn-go-cart" onclick="location.href='cart.jsp';">Cart</button></li>
            <% }%>
        </ul>

    </div>
</header>
