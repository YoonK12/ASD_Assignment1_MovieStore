<%-- 
    Document   : header
    Created on : 2020. 9. 20, ì¤í 7:18:49
    Author     : heeseong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="header main-header">
    <div class="admin-member">
        Welcome, Admin | <a href="./profile.jsp?type=staff">Account</a> | <a href="LogoutServlet">Logout</a>
    </div>
    <h1 class="logo-heading admin-heading"><a href="staffMain.jsp" class="logo">Movie Store</a> - Admin</h1>
    
    <nav>
        <ul class="nav-category">
            <li><a href="./userList.jsp?userType=Customer">Customers Manager</a></li>
            <li><a href="./userList.jsp?userType=Staff">Staff Manager</a></li>
            <li><a href="#">Categories</a></li>
            <li><a href="ViewMovieServlet">Movies</a></li>
            <li><a href="#">Reviews</a></li>
            <li><a href="#">Orders</a></li>
        </ul>
    </nav>
</header>

