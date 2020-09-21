<%-- 
    Document   : movieDetail.jsp
    Created on : 2020. 9. 21, 오후 8:01:57
    Author     : heeseong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">-->
        <title>Movie Store | Welcome to Movie Store</title>
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display+SC:wght@400;700;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="./css/style.css" type="text/css"/>
    </head>
    <body>
        <div class="container">
            
            <jsp:directive.include file="./inc/header.jsp" />
            
            <main class="main-content main-movie">
                <section class="movie-list">
                    <div class ="group group1">
                        <div>
                    </div>
                </section>
            </main>
            
            <jsp:directive.include file="./inc/footer.jsp" />
        </div>

    </body>
</html>
