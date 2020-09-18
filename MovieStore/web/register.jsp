<%-- 
    Document   : register.jsp
    Created on : 2020. 9. 15, 오전 10:42:03
    Author     : heeseong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">-->
        <title>Register | Movie Store</title>
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display+SC:wght@400;700;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="./css/style.css" type="text/css"/>
    </head>
      <body onload="startTime()">
        <div><span class="time" id="time"></span></div>

        <%
            String emailErr = (String) session.getAttribute("emailErr");
            String passErr = (String) session.getAttribute("passErr");
            String exceptionErr = (String) session.getAttribute("exceptionErr");
        %>
        <div class="container form-container">
            <header class="header form-header">
                <h1><a href="./index.jsp" class="logo">Movie Store</a></h1>
            </header>
            <main class="main-content">
                <section class="">
                        <div class ="group group1">
                            <div class="form">
                                <form action="<%=request.getContextPath()%>/RegisterServlet" method="post">
                                    <h3 class="form-heading">Register</h3>
                                    
                                    <fieldset border=0>
                                        <p class="required">*All required</p>
                                        
                                        <input type="text" name="fName" placeholder="First Name" size="30" required>
                                        <input type="text" name="lName" placeholder="Last Name" size="30" required>
                                        <input type="email" name="email" placeholder="<%=(emailErr != null ? emailErr : "Email")%>" size="30" required>
                                        <input type="password" name="password" placeholder="<%=(passErr != null ? passErr : "Password")%>" size="30" required>
                                        <input type="text" name="mobileNum" placeholder="Contact Number without(-) e.g 04101234567" size="30" required>
                                        <p><%=(exceptionErr != null ? exceptionErr : "")%></p>
                                        <div style="text-align: center;">
                                            <a href="./index.jsp" class="btn-go-back">Back</a>
                                            
                                            <input type="submit" value="Submit">
                                        </div>
                                    </fieldset>
                                    
                                </form>
                            </div>
                        </div>
                </section>
            </main>
            <footer class="footer">
                
            </footer>
        <!--jsp:include page="/ConnServlet" flush="true" /-->
    </body>
</html>
