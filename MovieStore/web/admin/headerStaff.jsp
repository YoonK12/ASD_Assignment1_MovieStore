<%-- 
    Document   : headerStaff.jsp
    Created on : 27/09/2020, 3:35:38 PM
    Author     : parkjunhyun
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="header main-header">
    <div class="admin-member">
        Welcome, Staff | <a href="./profile.jsp?type=staff">Account</a> | <a href="LogoutServlet">Logout</a>
    </div>
    <h1 class="logo-heading admin-heading"><a href="staffMain.jsp" class="logo">Movie Store</a> - Staff</h1>
    
    <nav>
        <ul class="nav-category">
            <li><a href="#">User</a></li>
            <li><a href="#">Categories</a></li>
            <li><a href="ViewMovieServlet">Movies</a></li>
            <li><a href="#">Customers</a></li>
            <li><a href="#">Reviews</a></li>
            <li><a href="#">Orders</a></li>
        </ul>
    </nav>
</header>
