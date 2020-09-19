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
        <title>Movie Store | Change Password</title>
    </head>
    <body>
        <%
            User user = (User)session.getAttribute("user");
            String matchErr = (String) session.getAttribute("matchErr");
            String exceptionErr = (String) session.getAttribute("exceptionErr");
            String passErr = (String) session.getAttribute("passErr");
        %>
        <form action="<%=request.getContextPath()%>/EditServlet?Id=<%=user.getId()%>&func=changePW" method="POST">
            <p sytle= "color:red;"><span><%=(exceptionErr!= null? exceptionErr:"")%></span></p>
            <p sytle= "color:red;"><span><%=(matchErr!= null? matchErr:"")%></span></p>
        <table>
            <tbody>
                <tr>
                    <td>Email</td>
                    <td><%=user.getEmail()%></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" placeholder="<%=(passErr!= null? passErr:"")%>" name="password"></td>
                </tr>
                <tr>
                    <td>Re-type Password</td>
                    <td><input type="password" name="repassword"></td>
                </tr>
                <tr><td><input type="submit" value="Update Password"></td></tr>
                    
            </tbody>
        </table>
        </form>
    </body>
</html>
