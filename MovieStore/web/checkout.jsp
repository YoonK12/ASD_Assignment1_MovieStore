<%-- 
    Document   : checkout.jsp
    Created on : 20/09/2020, 2:41:33 PM
    Author     : jackw
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout | Movie Store</title>
         <!--<link rel="stylesheet" href="./css/style.css" type="text/css"/>-->
         <link rel="stylesheet" href="./css/checkoutForm.css" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <h1>Checkout</h1>
           <h2>In your cart</h2>
           <form action="action">
               <h2> Payment Information </h2>
               <div> 
                   <span>Card Number</span> 
                   <input type="text"/>
               </div>
               <div>
                   <span>Expiration date</span>
                   <input type="month" min="03-2018" value="05-2018"/>
               </div >
               <div>
                   <span> Security Code </span>
                   <input type="text"/>
               </div>
               <h2> Billing information </h2>
               First name <input type="text"/>
               Last name <input type="text"/>
               Billing address <input type="text"/>
               BIlling <input type="text"/>
               Country <input type="text"/>
               City <input type="text"/>
               Zip or postal code <input type="text"/>
               Phone number <input type="text"/>
               You'll have a chance to review your order before its placed
               <input type="submit"/>
           </form>
        </div>
     
    </body>
</html>
