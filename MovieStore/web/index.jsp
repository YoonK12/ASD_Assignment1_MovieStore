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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <title>Home Page</title>
    </head>
    <body>
        <div style="position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%);">
        <a class="btn btn-primary btn-lg" href="register.jsp" role="button">Register</a>
        <a class="btn btn-warning btn-lg" href="login.jsp" role="button">Login</a>
        </div>
        
        <jsp:include page="/ConnServlet" flush="true" />
    </body>
</html>
