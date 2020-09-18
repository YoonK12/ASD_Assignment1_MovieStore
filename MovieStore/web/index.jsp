<%-- 
    Document   : index
    Created on : Sep 14, 2020, 1:43:33 PM
    Author     : Heeseong Jeon
--%>

<%@page import="uts.asd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">-->
        <title>Movie Store | Welcome to Movie Store</title>
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display+SC:wght@400;700;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="./css/style.css" type="text/css"/>
    </head>
    <body>
<!--        <div class="container bg-image">-->
        <% 
        User user = (User)session.getAttribute("user");
        
        %>
        <div class="container">
            <header class="header main-header">
                <h1 class="logo-heading"><a href="./index.jsp" class="logo">Movie Store</a></h1>
                <h4> ${user.getfName()}</h4>
                <nav>
                    <ul class="nav-category">
                        <li><a href="#">Top 10</a></li>
                        <li><a href="#">Romantic/Comedy</a></li>
                        <li><a href="#">Horror</a></li>
                        <li><a href="#">SF/Mistery</a></li>
                        <li><a href="#">Animations</a></li>
                    </ul>
                </nav>
                <div class="search-bar">
                    <form action="action" method="get" class="search-form">
                        <fieldset>
                            <legend class="readable-hidden">Searching movies</legend>
                            <p>
                                <label for="input-movie-title" class="readable-hidden">Search:</label>
                                <input type="text" name="Title" id="input-movie-title" class="input-movie-title" placeholder="What MOVIE are you looking for?"/>
                            
                                <input type="submit" value="Search" class="btn-search" onclick="alert('go search.');return false;"/>
                            </p>
                        </fieldset>
                    </form>
                </div>
                <div class="member">
                    <!-- if user logged in -->
                    
                    <!--
                    <ul>
                        <li><a href="#">Account</a></li>
                        <li><a href="#">Logout</a></li>
                        <li><button type="button">Cart</button></li>
                    </ul>
                    -->
                    
                    <!-- if user hasn't registered -->
                    <ul>
                        <li><a href="./login.jsp">Login</a></li>
                        <li><a href="./register.jsp">Register</a></li>
                        <li><button type="button" class="btn-go-cart" onclick="location.href='cart.jsp';">Cart</button></li>
                    </ul>
                    
                </div>
            </header>
            <main class="main-content main-movie">
                <section class="movie-list">
                    
                        <div class ="group group1">
                            <div class="movie-item">
                                <h3 class="movie-heading">Umbockdong</h3>
                                <p class="movie-poster">
                                    <img src="./image/img_1.png" alt="Umbockdong"/>
                                </p>
                                <p class="movie-desc">
                                    Japanese colonial era In Japan, the Korean National Convention is held to 
                                    show off its dominance by defeating Joseon's national consciousness.
                                </p>
                                <p class="more"><a href="#">See more..</a></p>
                                <div class="add-item">
                                    <button type="submit">Add to Cart</button>
                                </div>
                            </div>
                            <div class="movie-item">
                                <h3 class="movie-heading">Digimomn Adventure</h3>
                                <p class="movie-poster">
                                    <img src="./image/img_2.png" alt="Digimomn Adventure"/>
                                </p>
                                <p class="movie-desc">
                                    Tai is now a university student, living alone, 
                                    working hard at school, and working every day, 
                                    but with his future still undecided.
                                </p>
                                <p class="more"><a href="#">See more..</a></p>
                                <div class="add-item">
                                    <button type="submit">Add to Cart</button>
                                </div>
                            </div>
                            <div class="movie-item">
                                <h3 class="movie-heading">Becky</h3>
                                <p class="movie-poster">
                                    <img src="./image/img_3.png" alt="Becky"/>
                                </p>
                                <p class="movie-desc">
                                    Spunky and rebellious, Becky (Lulu Wilson) is brought 
                                    to a weekend getaway at a lake house by her father Jeff (Joel McHale) in an effort to try to reconnect. 
                                </p>
                                <p class="more"><a href="#">See more..</a></p>
                                <div class="add-item">
                                    <button type="submit">Add to Cart</button>
                                </div>
                            </div>
                            
                            <div class="movie-item">
                                <h3 class="movie-heading">Jet to the Rescue</h3>
                                <p class="movie-poster">
                                    <img src="./image/img_7.png" alt="Jet to the Rescue"/>
                                </p>
                                <p class="movie-desc">
                                    Get Ready to zoom back to Barkingburg with the pups in this all-new movie! 
                                </p>
                                <p class="more"><a href="#">See more..</a></p>
                                <div class="add-item">
                                    <button type="submit">Add to Cart</button>
                                </div>
                            </div>
                            <div class="movie-item">
                                <h3 class="movie-heading">AFTER WE COLLIDED</h3>
                                <p class="movie-poster">
                                    <img src="./image/img_6.png" alt="AFTER WE COLLIDED"/>
                                </p>
                                <p class="movie-desc">
                                    Hardin will always be… Hardin. But is he really the deep, 
                                    thoughtful guy Tessa fell madly in love with—
                                </p>
                                <p class="more"><a href="#">See more..</a></p>
                                <div class="add-item">
                                    <button type="submit">Add to Cart</button>
                                </div>
                            </div>
                            <div class="movie-item">
                                <h3 class="movie-heading">An American Pickle</h3>
                                <p class="movie-poster">
                                    <img src="./image/img_5.png" alt="An American Pickle"/>
                                </p>
                                <p class="movie-desc">
                                    An immigrant worker at a pickle factory is accidentally 
                                    preserved for 100 years and wakes up in modern day Brooklyn.
                                </p>
                                <p class="more"><a href="#">See more..</a></p>
                                <div class="add-item">
                                    <button type="submit">Add to Cart</button>
                                </div>
                            </div>
                            <div class="movie-item">
                                <h3 class="movie-heading">Astro Kid</h3>
                                <p class="movie-poster">
                                    <img src="./image/img_4.png" alt="Astro Kid"/>
                                </p>
                                <p class="movie-desc">
                                    Following the destruction of their spaceship, 
                                    ten-year-old William gets separated from his 
                                    parents while traveling through the galaxy. 
                                </p>
                                <p class="more"><a href="#">See more..</a></p>
                                <div class="add-item">
                                    <button type="submit">Add to Cart</button>
                                </div>
                            </div>
                            <div class="movie-item">
                                <h3 class="movie-heading">Plural blood clot</h3>
                                <p class="movie-poster">
                                    <img src="./image/img_8.png" alt="plural blood clot"/>
                                </p>
                                <p class="movie-desc">
                                    Taeyoung, who runs a discotheque with his fist, 
                                    is a young man who lives in good health with 
                                    Inhye, who runs a bakery, and his brother Jun-seok, who is his brother. 
                                </p>
                                <p class="more"><a href="#">See more..</a></p>
                                <div class="add-item">
                                    <button type="submit">Add to Cart</button>
                                </div>
                            </div>
                        </div>
                </section>
            </main>
            <footer class="footer">
                
            </footer>
            <div class="modal-wrapper">
                <div class="modal-info">
                    <h4>Thank you!</h4>
                    <p class="info-img">
                        <img src="" alt=""/>
                    </p>
                    <p>Added this item in your cart.</p>
                    <div class="btns">
                        <button type="button">confirm</button>
                    </div>
                </div>
            </div>
        <jsp:include page="/ConnServlet" flush="true" />
    </body>
</html>
