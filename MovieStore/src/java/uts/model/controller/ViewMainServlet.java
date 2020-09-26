/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uts.model.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.asd.dao.DBMovie;
import uts.asd.model.Cart;

/**
 *
 * @author campf
 */
public class ViewMainServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        Cart cart = (Cart)session.getAttribute("cart");
        DBMovie movie = (DBMovie) session.getAttribute("addedMovie");
        cart.addToCart(movie,1);
        session.removeAttribute("addedMovie");
        session.setAttribute("cart", cart);

        response.sendRedirect("cart.jsp"); // Cart page

    }

}
