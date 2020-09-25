<%-- 
    Document   : checkout.jsp
    Created on : 20/09/2020, 2:41:33 PM
    Author     : jackw
--%>
<%@page import="uts.asd.model.User"%>
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
            User user = (User)session.getAttribute("user");
            String postalErr = (String) session.getAttribute("postalErr");
            String mobileErr = (String) session.getAttribute("mobileErr");
            String cardErr = (String) session.getAttribute("cardErr");
            String monthErr = (String) session.getAttribute("monthErr");
            String yearErr =  (String) session.getAttribute("yearErr");
            String cvvErr =  (String) session.getAttribute("cvvErr");
        %>
        <div class="container">
            <h1>Checkout</h1>
            <div class ="main-content">
                <div class="checkout-container">
                    <form action="<%=request.getContextPath()%>/CheckoutServlet" method="post">
                        <div class="checkout-form">
                              <div class="billing-information">
                                <h2> Billing information </h2>
                                <label> First name </label>
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
                                <label> Phone number <span><%=(mobileErr!= null? mobileErr:"")%></span></label>
                                <input name="mobile" placeholder="e.g. 0411960864" type="text"/>
                            </div>
                            <div class="payment-information">
                                <h2> Payment Information </h2>
                                <label>Payment Method</label>
                                <select name="pay-method">
                                    <option value="visa">Visa</option>
                                    <option value="master-card">Mastercard</option>
                                    <option value="american-exp">American Express</option>
                                </select>
                                <label>Card Number <span><%=(cardErr!= null? cardErr:"")%></span></label>
                                <input  type="text" name="card-number" placeholder="1234-1234-1234-1234"/>
                                <label>Expiration Month  <span><%=(monthErr!= null? monthErr:"")%></span></label>
                                <input name="month-exp" placeholder="1-12" type="text"/>
                                 <label>Expiration Year<span><%=(yearErr!= null? yearErr:"")%></span></label>
                                 <input type="text" name="year-exp" placeholder="e.g. 2020" />
                                 <label>CVV<span><%=(cvvErr!= null? cvvErr:"")%></span></label>
                                 <input type="text" name="cvv" placeholder="123"/>
                            </div>
                        </div>
                        <div> 
                            <input type="submit"  value="Complete Payment" />
                        </div>
                    </form>
                </div>
            
                <div class="cart-container">
                    <h2>In your cart</h2>
                    <div class="checkout-list">
                        <div class="checkout-item">
                            <p class="name">Movie</p><p class="price">Price</p>
                        </div>
                        <hr>
                        <div class="checkout-item">
                            <p class="name">Descendents of the Sun</p><p class="price">$51.00</p>
                        </div>
                        <div class="checkout-item">
                            <p class="name">Pinnochio</p><p class="price">$29.00</p>
                        </div>
                        <div class="checkout-item">
                            <p class="name">Goblin</p><p class="price">$29.00</p>
                        </div>
                        <div class="checkout-item">
                            <p class="name">Record of youth</p><p class="price">$29.00</p>
                        </div>
                        <div class="checkout-item">
                            <p class="name">Dr. Stranger</p><p class="price">$29.00</p>
                        </div>
                         <div class="checkout-item">
                            <p class="name">Boku No Pico</p><p class="price">$29.00</p>
                        </div>
                         <div class="checkout-item">
                            <p class="name">Man to Man</p><p class="price">$29.00</p>
                        </div>
                        <div class="checkout-item">
                            <p class="name">Crash Landing on you</p><p class="price">$29.00</p>
                        </div>
                            <div class="checkout-item">
                            <p class="name">Flower of Evil</p><p class="price">$29.00</p>
                        </div>
                            <div class="checkout-item">
                            <p class="name">Love in the Moonlight</p><p class="price">$29.00</p>
                        </div>
                    </div>
                    <hr> 
                    <div class="total">
                        <p class="total-label"> Total </p> <p class="price">$100</p>
                    </div>
                </div>
        </div>
            </div>
    </body>
</html>
