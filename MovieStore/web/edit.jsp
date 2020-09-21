<%-- 
    Document   : edit
    Created on : 19/09/2020, 12:45:24 AM
    Author     : yoonkoo
--%>

<%@page import="uts.asd.model.User"%>
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
    <body>
        <%
            User user = (User)session.getAttribute("user");
            String exceptionErr = (String) session.getAttribute("exceptionErr");
        %>
        <div class="container">
            <header class="header main-header">
                <h1 class="logo-heading"><a href="./index.jsp" class="logo">Movie Store</a></h1>
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
                                            <form action="<%=request.getContextPath()%>/EditServlet?Id=<%=user.getId()%>&func=default" method="post">
                                                <p sytle= "color:red;"><span><%=(exceptionErr!= null? exceptionErr:"")%></span></p>
                                                <table>
                                                    <tr>
                                                        <th>USER ID</th>
                                                        <td><%=user.getId()%></td>
                                                    </tr>
                                                     <tr>
                                                        <th>EMAIL</td>
                                                        <td><%=user.getEmail()%></td>
                                                    </tr>
                                                    <tr>
                                                        <th>FIRST NAME</th>
                                                        <!--<td><%=user.getfName()%></td>-->
                                                        <td class="padd"><input type="text" value="<%=user.getfName()%>" name="fName"></td>
                                                    </tr>
                                                    <tr>
                                                        <th>LAST NAME</th>
                                                        <!--<td><%=user.getlName()%></td>-->
                                                        <td class="padd"><input type="text" value="<%=user.getlName()%>" name="lName"></td>
                                                    </tr>
                                                    <tr>
                                                        <th>CONTACT</th>
                                                        <!--<td><%=user.getMobileNum()%></td>-->
                                                        <td class="padd"><input type="text" value= "<%=user.getMobileNum()%>" name="mobileNum"></td>
                                                    </tr>

                                                    <tr>
                                                        <th colspan="2"> 
                                                            <input type="submit" value="Update" class="btn-update">
                                                            <a href="changePW.jsp">Change my password</a>
                                                        </th>
                                                    </tr>
                                                </table>

                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                      </div>
                 </section>
            </main>
        </div>
    </body>
</html>
