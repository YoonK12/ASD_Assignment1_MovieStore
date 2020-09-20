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
    </head>
    <body>
        <div class="container">
            <h1>Checkout</h1>
            <div class ="main-content">
                <div class ="checkout-container">
                    <form action="action">
                        <div class="checkout-form">
                              <div class="billing-information">
                                <h2> Billing information </h2>
                                <label> First name </label> <input type="text"/>
                                <label> Last name </label> <input type="text"/>
                                <label> Billing address </label><input type="text"/>
                                BIlling <input type="text"/>
                                Country <input type="text"/>
                                City <input type="text"/>
                                Zip or postal code <input type="text"/>
                                Phone number <input type="text"/>
                            </div>
                            <div class="payment-information">
                                <h2> Payment Information </h2>
                                <div class="payment-methods">
                                    <p>Accepted Cards: </p>
                                </div>
                                <label>Card Number</label> <input type="text"/>
                                <label>Expiration Month</label> <input type="text"/>
                                <label>Expiration Year</label> <input type="text"/>
                                <label>CVV</label> <input type="text"/>
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
