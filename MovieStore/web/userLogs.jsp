<%-- 
    Document   : userLogs
    Created on : 20/09/2020, 5:03:04 AM
    Author     : yoonkoo
--%>


<%@page import="uts.asd.model.UserRecords"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uts.asd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>User Logs | Movie Store</title>
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display+SC:wght@400;700;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="./css/style.css" type="text/css"/>
        <!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">-->
        <meta http-equiv="Pragma" content="no-cache" />
        <meta http-equiv="Cache-Control" content="no-cache, must-revalidate" />
        <meta http-equiv="Expires" content="0" />
    </head>
 
    <%
         String userId = request.getParameter("userId");
         String LogsResult = (String) session.getAttribute("LogsResult");
         String SearchErr = (String) session.getAttribute("SearchErr");
        
    %>
    <body onload="startTime()">
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
                                <h3 class="subpage-heading">Logs History</h3>
                                <div><span class="time" id="time"></span></div>
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
                                            <h3>User Activity Logs</h3>
                                            <p style="text-align: right;"> <span><%=(LogsResult != null? LogsResult : "")%> / </span>
                                                <strong>User ID: <%=userId%></strong>
                                            </p>
                                            
                                            <table class="vertical-form">
                                                <colgroup>
                                                    <col width="15%"/>
                                                    <col width="15%"/>
                                                    <col width="45%"/>
                                                    <col width="25%"/>
                                                </colgroup>
                                                <thead>
                                                    <tr>
                                                        <th>Log ID</th>
                                                        <th>User ID</th>
                                                        <th>Timestamp</th>
                                                        <th>Description</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    
                                                <% ArrayList<UserRecords> logs =  (ArrayList<UserRecords>) session.getAttribute("logs");
                                                        for(UserRecords log:logs){%> 

                                                <tr> 
                                                    <td><%=log.getLogId()%></td> 
                                                    <td><%=log.getUserId()%></td> 
                                                    <td><%=log.getTimestamp()%></td> 
                                                    <td><%=log.getDescription()%></td>
                                                </tr> 
                                                
                                                <%}%> 

                                                </tbody>
                                            </table>
                                        </div>
                                        <div id="mydetails" class="right-cont-detail">
                                            <h3>Search Logs by date </h3>
                                            <p color="red"><%=(SearchErr != null? SearchErr : "")%></p>
                                            <form action="UserRecordsServlet" method="post" >
            
                                            <table>
                                                <tr>
                                                    <th>User ID</th>
                                                    <td><input type="text" name="userId" value="<%=userId%>" disabled></td>
                                                </tr>
                                                <tr>
                                                    <th>Start Date</th>
                                                    <td><input type="date" name="startDate" class="date"></td>
                                                </tr>
                                                <tr>
                                                    <th>End Date</th>
                                                    <td><input type="date" name="endDate" class="date"></td>
                                                </tr>
                                                <tr>
                                                    <th colspan="2"><input type="submit" value="Search" class="btn-search"></th> 
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
            
            
            
            
        </div><!-- container-->
        
        
  
           
    </body>
</html>
