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
        
    </head>
 
    <%
         String userId = request.getParameter("userId");
         String LogsResult = (String) session.getAttribute("LogsResult");
         String SearchErr = (String) session.getAttribute("SearchErr");
        
    %>
    <body onload="startTime()">
        
        <div><span class="time" id="time"></span></div>
        
        <p>User ID: <%=userId%></p>
        
        <div class="header">
            <h1>Logs History</h1>
        </div>	
        <div class="top">
            <a href="index.jsp">Index</a>
            <a href="login.jsp">Login</a>
            <a href="LogoutServlet">Logout</a>
        </div>
        <h3>User Activity Logs</h3>
        <h4> <%=(LogsResult != null? LogsResult : "")%> </h4>
        
        <table>
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
        <h5 color="red"><%=(SearchErr != null? SearchErr : "")%></h4>
        <form action="UserRecordsServlet" method="post" >
            
            <h3>Search Logs by date </h3>
            
            <table>
                <tr>
                    <td>User ID</td>
                    <td><input type="text" name="userId" value="<%=userId%>"></td>
                </tr>
                <tr>
                    <td>Start Date</td>
                    <td><input type="date" name="startDate"></td>
                </tr>
                <tr>
                    <td>End Date</td>
                    <td><input type="date" name="endDate"></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Search"></td> 
                </tr>
            
            
            </table>
                
                    
            </form> 
           
    </body>
</html>
