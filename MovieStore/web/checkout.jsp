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
         <link rel="stylesheet" href="./css/style.css" type="text/css"/>
         <link rel="stylesheet" href="./css/checkout.css" type="text/css"/>
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <%
        
        %>
        <div class="container">
            <h1>Checkout</h1>
            <div class ="main-content">
                <div class ="checkout-container">
                    <form action="<%=request.getContextPath()%>/CheckoutServlet" method="post">
                        <div class="checkout-form">
                              <div class="billing-information">
                                <h2> Billing information </h2>
                                <label> First name </label> <span> error </span>
                                <input type="text" name="fname" placeholder="First Name" required/>
                                
                                <label> Last name </label>
                                <input type="text" name = "lname" placeholder="Last Name" required/>
                                
                                <label> Billing address </label>
                                <input type="text" name="address" placeholder="e.g. 21 Donald Street" required/>
                                <label> Country </label>
                                <input name= "country" placeholder="e.g. Australia" input type="text"/>
                                <label> City </label>
                                <input name="city" placeholder="e.g. Sydney" type="text"/>
                                <label> Zip or postal code </label>
                                <input name="zip" placeholder="e.g. 2220"type="text"/>
                                <label> Phone number</label> <input name="phone number" placeholder="e.g. +61411960864" type="text"/>
                            </div>
                            <div class="payment-information">
                                <h2> Payment Information </h2>
                                <label>Payment Method</label>
                                <select name="cards">
                                    <option class="icon-container" value="visa">Visa</option>
                                    <option value="master-card">Mastercard</option>
                                    <option value="american-exp">American Express</option>
                                </select>
                                <label>Card Number</label>
                                <input  type="text" name="card-number" placeholder="1234-1234-1234-1234"/>
                                <div class="exp-date">
                                    <label>Expiration Month</label>
                                    <input name="month-exp" placeholder="1-12" type="text"/>
                                    <label>Expiration Year</label>
                                    <input type="text" name="year-exp" placeholder="e.g. 2020" />
                                </div
                                <label>CVV</label> <input type="text" name="cvv" placeholder="123"/>
                            </div>
                        </div>
                        <div> 
                            <input type="submit"  value="Complete Payment" />
                        </div>
                    </form>
                </div>
            
                <div class="cart-container">
                    <h2>In your cart</h2>
                    <h3> Products</h3>
                    <p> Total </total>
                </div>
        </div>
            </div>
    </body>
</html>
