<%-- 
    Document   : profile
    Created on : 18/09/2020, 3:54:45 PM
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
        <!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">-->
        <meta http-equiv="Pragma" content="no-cache" />
        <meta http-equiv="Cache-Control" content="no-cache, must-revalidate" />
        <meta http-equiv="Expires" content="0" />
   </head>
    <body>
        
        <%
             String updated = (String)session.getAttribute("updated");
             String deleteErr = (String)session.getAttribute("deleteErr");
             User user = (User)session.getAttribute("user");
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
                                <h3 class="subpage-heading">My Account</h3>
                                <p sytle= "color:red;"><span><%=(updated != null? updated:"")%></span></p>
                                <p sytle= "color:red;"><span><%=(deleteErr != null? deleteErr:"")%></span></p>               
                             
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
                                            <table>
                                                <tbody>
                                                <tr>
                                                    <th>USER ID</th>
                                                    <td><%=user.getId()%></td>
                                                </tr>
                                                <tr>
                                                    <th>EMAIL</th>
                                                    <td><%=user.getEmail()%></td>
                                                </tr>
                                                <tr>
                                                    <th>FIRST NAME</th>
                                                    <td><%=user.getfName()%></td>
                                                 </tr>
                                                 <tr>
                                                     <th>LAST NAME</th>
                                                     <td><%=user.getlName()%></td>
                                                 </tr>
                                                 <tr>
                                                     <th>CONTACT</th>
                                                     <td><%=user.getMobileNum()%></td>
                                                 </tr>
                                                 <tr>
                                                     <th>USER TYPE</th>
                                                     <td><%=user.getUsertype()%></td>
                                                 </tr>
                                                 <tr>
                                                     <th colspan="2">
                                                       <a href="./edit.jsp">Edit profile</a> 
                                                       <a href="UserRecordsServlet?userId=<%=user.getId()%>">Logs history</a></td>
                                                       <a href="DeleteAccServlet?userId=<%=user.getId()%>">Delete my account</a> 
                                                     </th>
                                                 </tr>
                                                </tbody>
                                            </table>
                                            
                                        </div>
                                        <div id="myorder" class="right-cont-detail" style="display:none;">orders</div>
                                    </div>
                                </div>
                                    
                                               
                                               
                            </div><!-- sub-content END -->
                      </div> <!-- group group2 END -->
                 </section>
            </main>
           <jsp:directive.include file="./inc/footer.jsp" />
        </div><!-- container END -->
    </body>
</html>
