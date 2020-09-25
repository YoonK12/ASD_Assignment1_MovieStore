<%-- 
    Document   : changePW
    Created on : 19/09/2020, 3:47:51 AM
    Author     : yoonkoo
--%>

<%@page import="uts.asd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account | Movie Store</title>
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display+SC:wght@400;700;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="./css/style.css" type="text/css"/>
    </head>
    <body>
        <%
            User user = (User)session.getAttribute("user");
            String matchErr = (String) session.getAttribute("matchErr");
            String exceptionErr = (String) session.getAttribute("exceptionErr");
            String passErr = (String) session.getAttribute("passErr");
        %>
        <div class="container">
            <header class="header main-header">
                <h1 class="logo-heading"><a href="./index.jsp" class="logo">Movie Store</a></h1>
                <nav>
                    <ul class="nav-category">
                        <li><a href="#">Top 10</a></li>
                        <li><a href="#">Romantic/Comedy</a></li>
                        <li><a href="#">Horror</a></li>
                        <li><a href="#">SF/Mistery</a></li>
                        <li><a href="#">Animations</a></li>
                    </ul>
                </nav>
                <div class="member">
                    <ul>
                        <li><a href="./index.jsp">Go Back</a></li>
                        <li><a href="LogoutServlet">Logout</a></li>
                        <li><button type="button" class="btn-go-cart" onclick="location.href='cart.jsp';">Cart</button></li>            
                    </ul>
                </div>
            </header>
            
            <main class="main-content">
                 <section class="movie-list">
                      <div class ="group group2">
                            <div class="sub-content">
                                <h3 class="subpage-heading">Edit Profile</h3>
                                <div class="layout-2col">
                                    <div class="left-menu">
                                        <nav>
                                            <ul>
                                                <li><a href="./profile.jsp">My details</a></li>
                                                <li><a href="./edit.jsp">Edit profile</a></li>
                                                <li><a href="#myorder">My order</a></li>

                                            </ul>

                                        </nav>
                                    </div>
                                    <div class="right-cont">
                                        <div id="mydetails" class="right-cont-detail">
                                            <form action="<%=request.getContextPath()%>/EditServlet?Id=<%=user.getId()%>&func=changePW" method="POST">
                                                <p sytle= "color:red;"><span><%=(exceptionErr!= null? exceptionErr:"")%></span></p>
                                                <p sytle= "color:red;"><span><%=(matchErr!= null? matchErr:"")%></span></p>
                                                <table>
                                                    <tbody>
                                                        <tr>
                                                            <th>EMAIL</td>
                                                            <td><%=user.getEmail()%></td>
                                                        </tr>
                                                        <tr>
                                                            <th>NEW PASSWORD</th>
                                                            <td class="padd"><input type="password" placeholder="<%=(passErr!= null? passErr:"")%>" name="password"></td>
                                                        </tr>
                                                        <tr>
                                                            <th>RE-PASSWORD</th>
                                                            <td class="padd"><input type="password" name="repassword"></td>
                                                        </tr>
                                                        <tr><th colspan="2"><input type="submit" value="Update Password"></th></tr>

                                                    </tbody>
                                                </table>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                      </div>
                 </section>
            </main>
            <jsp:directive.include file="./inc/footer.jsp" />

        </div>
    </body>
</html>
