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
        <!--<link rel="stylesheet" href="./css/style.css" type="text/css"/>-->
    </head>
    <body>
        <%
            User user = (User)session.getAttribute("user");
            String exceptionErr = (String) session.getAttribute("exceptionErr");
        %>
        
        <form action="<%=request.getContextPath()%>/EditServlet?Id=<%=user.getId()%>&func=default" method="post">
        
        <h3> Edit Profile</h3>
        <a href="./index.jsp">Go Back</a>
        <a href="LogoutServlet">Logout</a>
        <p sytle= "color:red;"><span><%=(exceptionErr!= null? exceptionErr:"")%></span></p>
      
        
        <table class="redTable">
            
            <tr>
                <th>User ID: </th>
                <td><%=user.getId()%></td>
                
            </tr>
             <tr>
                <th>Email</td>
                <td><%=user.getEmail()%></td>
            </tr>
            <tr>
		<th>First Name</th>
                <td><%=user.getfName()%></td>
                <td><input type="text" value="<%=user.getfName()%>" name="fName"></td>
	    </tr>
            <tr>
                <th>Last Name</th>
                <td><%=user.getlName()%></td>
		<td><input type="text" value="<%=user.getlName()%>" name="lName"></td>
            </tr>
            <tr>
		<th>Mobile Number</th>
                <td><%=user.getMobileNum()%></td>
		<td><input type="text" value= "<%=user.getMobileNum()%>" name="mobileNum"></td>
            </tr>
   
            <tr>
                <td colspan="2"> 
                    <input type="submit" value="Update" >
                    <a href="changePW.jsp">Change my password</a>
                </td>
            </tr>
        </table>
        
        </form>
        
    </body>
</html>
