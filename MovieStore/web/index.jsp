<%--
    Document   : index
    Created on : Aug 28, 2020, 11:18:00 AM
    Author     : campf

Things to do or not done yet
#0 example of index.jsp ( showing available movie list and login,register at the top)
#1 The design/style of layout, button should be changed later
#2 Movie images should be inserted
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

        <section class="headbanner">
            <h1 class="display-3" align="center">Online Movie Store</h1>
            <div align="right">
                <a href ="login.jsp"> Login </a>
   
                <a href ="register.jsp"> Register </a>
            </div>
            
             <div class ="backImage">
                 <div class="card" style="width:33%;height:300px;background-color: gray;float:left;margin:2px">Movie 1</div>
                 <div class="card" style="width:33%;height:300px;background-color: gray;float:left;margin:2px">Movie 2</div>        
                 <div class="card" style="width:33%;height:300px;background-color: gray;float:left;margin:2px">Movie 3</div>        
                 <div class="card" style="width:33%;height:300px;background-color: gray;float:left;margin:2px">Movie 4</div>        
                 <div class="card" style="width:33%;height:300px;background-color: gray;float:left;margin:2px">Movie 5</div>        
                 <div class="card" style="width:33%;height:300px;background-color: gray;float:left;margin:2px">Movie 6</div>        
                 <div class="card" style="width:33%;height:300px;background-color: gray;float:left;margin:2px">Movie 7</div>        
                 <div class="card" style="width:33%;height:300px;background-color: gray;float:left;margin:2px">Movie 8</div>        
                 <div class="card" style="width:33%;height:300px;background-color: gray;float:left;margin:2px">Movie 9</div>        
             </div>
        </section>

        <jsp:include page="/ConnServlet" flush="true" />
    </body>
</html>
