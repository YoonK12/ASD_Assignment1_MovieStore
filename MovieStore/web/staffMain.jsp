<%-- 
    Document   : index
    Created on : 2020. 9. 20, 오후 7:18:41
    Author     : campf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">-->
        <title>Movie Store Staff</title>
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display+SC:wght@400;700;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css" type="text/css"/>
    </head>
    <body>
        <jsp:directive.include file="admin/headerStaff.jsp" />
        <main class="main-content admin-content">
            <section>
                <h2>Administrator Dashboard</h2>
                <hr>
            </section>
            <section>
                <h3>Quick Action:</h3>
                <hr>
                <div>
                    <a href="addMovie.jsp">New Movie</a> | 
                    <a href="create_user">New User</a> | 
                    <a href="create_category">New Category</a> | 
                    <a href="create_customer">New Customer</a>
                </div>
            </section>
            <section>
                <h3>Recent sales:</h3>
                <hr>
            </section>
            <section>
                <h3>Recent reviews</h3>
                <hr>
            </section>
            <section>
                <h3>Statistics:</h3>
                <hr>
            </section>
        </main>
        
        <jsp:directive.include file="admin/footer.jsp" />
    </body>
</html>
