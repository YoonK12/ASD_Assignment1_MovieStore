<%--
    Document   : Login
    Created on : Sep 15, 2020, 11:18:00 AM
    Author     : Heeseong Jeon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">-->
        <title>Login | Movie Store</title>
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display+SC:wght@400;700;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="./css/style.css" type="text/css"/>
    </head>
    <body onload="startTime()">
        <div><span class="time" id="time"></span></div>
        <% 
        String existErr = (String) session.getAttribute("existErr");
        String emailErr = (String) session.getAttribute("emailErr");
        String passErr = (String) session.getAttribute("passErr");
        String registerSuccess = (String)session.getAttribute("registerSuccess");
        %>
        <div class="container form-container">
            <header class="header form-header">
                <h1><a href="./index.jsp" class="logo">Movie Store</a></h1>
            </header>
            <main class="main-content">
                <section class="">
                        <div class ="group group1">
                            <div class="form">
                                <p sytle= "color:red;"><%=(registerSuccess != null? registerSuccess:"")%></p>
                                <p sytle= "color:red;"><%=(existErr != null? existErr: "")%></p>
                                
                                <form action="<%=request.getContextPath()%>/LoginServlet" method="post">
                                    <h3 class="form-heading">Welcome to Movie Store</h3>
                                    <fieldset border=0>
                                        <input type="text" placeholder="<%=(emailErr != null ? emailErr:"Enter the email") %>" name="email" size="30" required >
                                        <input type="password" placeholder="<%=(passErr != null ? passErr:"Enter the password") %>" name="password" size="30" required>
                                        <div style="text-align: center;">
                                            <a href="./index.jsp" class="btn-go-back">Back</a>
                                            <input type="submit" value="Submit" class="btn-login" href="./main.jsp" >
                                        </div>
                                        
                                    </fieldset>
                                    <p class="goto-register">No account? Click <a href="register.jsp" class="btn-link">here</a> to register</p>
                                </form>
                            </div>
                        </div>
                </section>
            </main>
        <jsp:include page="/ConnServlet" flush="true" />
    </body>
</html>
