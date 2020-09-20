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
        <!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">-->
        <title>Register | Movie Store</title>
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display+SC:wght@400;700;900&display=swap" rel="stylesheet">
        <!--<link rel="stylesheet" href="./css/style.css" type="text/css"/>-->
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
     
        <div class="container form-container">
            <header class="header form-header">
                <h1><a href="./index.jsp" class="logo">Movie Store</a></h1>
                    <div class="member">
           
                    <ul>
                        <li><a href="./index.jsp">Go Back</a></li>
                        <li><a href="LogoutServlet">Logout</a></li>
                        <li><button type="button" class="btn-go-cart" onclick="location.href='cart.jsp';">Cart</button></li>            
                    </ul>
                    
                </div>
        </div>
            </header>
       
                    <br><h3>Profile</h3>
                     <p sytle= "color:red;"><span><%=(updated != null? updated:"")%></span></p>
                     <p sytle= "color:red;"><span><%=(deleteErr != null? deleteErr:"")%></span></p>               
                    
                    <table class="redTable">
                        <tbody>
                        <tr>
                            <td>ID: </td>
                            <td><%=user.getId()%></td>
                         </tr>
                        <tr>
                            <td>First Name: </td>
                            <td><%=user.getfName()%></td>
                         </tr>
                         <tr>
                             <td>Last Name: </td>
                             <td><%=user.getlName()%></td>
                         </tr>
                         <tr>
                             <td>Email: </td>
                             <td><%=user.getEmail()%></td>
                         </tr>
                         <tr>
                             <td>Contact: </td>
                             <td><%=user.getMobileNum()%></td>
                         </tr>
                         <tr>
                             <td>User type: </td>
                             <td><%=user.getUsertype()%></td>
                         </tr>
                         <tr>
                             <td>
                               <a href="./edit.jsp">Edit my profile</a> 
                               
                             </td>
                             <td>
                               <a href="UserRecordsServlet?userId=<%=user.getId()%>">See my logs history</a></td>
                           
                             </td>
                         </tr>
                        </tbody>
                    </table>
         
                  
        <footer class="footer">
                
        </footer>
 
    </body>
</html>
