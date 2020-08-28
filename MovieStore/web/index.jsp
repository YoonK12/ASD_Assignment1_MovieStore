<%-- 
    Document   : index
    Created on : Aug 28, 2020, 11:18:00 AM
    Author     : campf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>
        <h1>Online Movie Store</h1>
          <a href="login.jsp">Login as Customer</a>
          <a href="login.jsp">Login as Staff</a>
          <a href="register.jsp">Register</a>
          <jsp:include page="/ConnServlet" flush="true" />
    </body>
</html>

