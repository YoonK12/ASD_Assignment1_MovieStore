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
        <link rel="stylesheet" href="css/style.css" type="text/css"/>
    </head>
    <body>
        <div class="container bg-image">
            <header class="header">
                <h1><a href="./index.jsp">Online Movie Store</a></h1>
            </header>
            <main>
                <section>
                    <div class="group-signIn">
                        <div>
                            <form action="<%=request.getContextPath()%>/LoginServlet" method="post">
                                <h3>Login</h3>
                                <fieldset>
                                    <input type="text" name="name" placeholder="Enter the email" size="30"> </br></br>
                                    <input type="password" name="password" placeholder= "Enter password" size="30"> </br></br>
                                    <button type="submit" value="Submit" class="submit">Submit</button></br></br>

                                </fieldset>
                                <p>No account? Click <a href="./register.jsp">here</a> to register</p>
                            </form>
                        </div>
                    </div>
                </section>
            </main>


            <jsp:include page="/ConnServlet" flush="true" />
        </div>
    </body>
</html>
