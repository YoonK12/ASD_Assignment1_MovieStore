/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uts.model.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uts.asd.dao.*;
import uts.asd.model.*;

/**
 *
 * @author campf
 */
public class RegisterServlet extends HttpServlet {
   

    @Override   
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {       
        HttpSession session = request.getSession();
        
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String type = request.getParameter("type");
        
        
        CusManager cusManager = (CusManager) session.getAttribute("manager");
        Validator validator = new Validator();
        
        // validate email
        if (!validator.validateEmail(email)) {           

            // set incorrect email error to the session   
            session.setAttribute("errMsg", "Error: email format incorrect");

            // redirect user back to the login.jsp
            request.getRequestDispatcher("register.jsp").include(request, response);
            
        // validate password
        } else if (password instanceof String == false) {                  
            
            // set incorrect password error to the session           
            session.setAttribute("errMsg", "Error: password format incorrect");
            
            // redirect user back to the login.jsp          
            request.getRequestDispatcher("register.jsp").include(request, response);
        
        // validate name  
        } else if (name.contains("[0-9]+") == true) {
            
            // set incorrect name error to the session           
            session.setAttribute("errMsg", "Error: name format incorrect");
            
            // redirect user back to the login.jsp          
            request.getRequestDispatcher("register.jsp").include(request, response);
        
        // validate phone number
        } else if (phone.matches("[0-9]+") == false) {
            
            // set incorrect phone error to the session           
            session.setAttribute("errMsg", "Error: phone number format incorrect");
            
            // redirect user back to the login.jsp          
            request.getRequestDispatcher("register.jsp").include(request, response);
            
        } else {
        
            try {
                if (manager.findUser(email) == null) {
                    manager.addUser(email, name, password, gender, phone, address, type);
                    User user = new User(email, name, password, gender, phone, address, type);
                    session.setAttribute("user", user);

                    // redirect to the next page
                    String redirectURL = "welcome.jsp";
                    response.sendRedirect(redirectURL);
                } else {
                    session.setAttribute("errMsg", "Error: email is already used");
                    response.sendRedirect("register.jsp");
                }
            } catch (SQLException ex) {
                Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}