<%--
    Document   : index
    Created on : Aug 28, 2020, 11:18:00 AM
    Author     : Heeseong Jeon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">-->
        <title>Movie Store | Welcome to Movie Store</title>
        <link rel="stylesheet" href="./css/style.css" type="text/css"/>
    </head>
    <body>
        <div class="container login-container">
            <header class="header login-header">
                <h1><a href="./index.jsp" class="logo">Movie Store</a></h1>
            </header>
            <main class="main-content">
                <section class="">
                        <div class ="group group1">
                            <div class="login-form">
                                <form action="<%=request.getContextPath()%>/LoginServlet" method="post">
                                    <h3 class="login-heading">Welcome to Movie Store</h3>
                                    <fieldset border=0>
                                        <input type="text" name="name" placeholder="Enter the email" size="30">
                                        <input type="password" name="password" placeholder= "Enter password" size="30">
                                        <input type="submit" value="Submit" class="btn-login" href="./main.jsp">

                                    </fieldset>
                                    <p class="goto-register">No account? Click <a href="register.jsp" class="btn-link">here</a> to register</p>
                                </form>
                            </div>
                        </div>
                </section>
            </main>
            <footer class="footer">
                
            </footer>
        <jsp:include page="/ConnServlet" flush="true" />
    </body>
</html>
