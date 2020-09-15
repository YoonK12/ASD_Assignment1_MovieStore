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
        
        String cEmail = request.getParameter("cEmail");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String DOB = request.getParameter("DOB");
        String gender = request.getParameter("gender");
        
        int registered_gen;
        
        if("male".equals(gender)){
            registered_gen = 0;
        } else {
            registered_gen = 1;
        }
   
        
        CusManager cusManager = (CusManager) session.getAttribute("manager");
        Validator validator = new Validator();
        
        // validate email
        if (!validator.validateEmail(cEmail)) {           

            // set incorrect email error to the session   
            session.setAttribute("emailErr", "Error: Email format incorrect");

            // redirect user back to the login.jsp
            request.getRequestDispatcher("register.jsp").include(request, response);
            
        // validate password
        } else if (!validator.validatePassword(password)) {
            // set incorrect password error to the session 
            session.setAttribute("passErr", "Requires at least 6 characters including upper or lower alpha and digit");

            // redirect user back to the login.jsp          
            request.getRequestDispatcher("register.jsp").include(request, response);
        
        // validate name  
        } else if (name.contains("[0-9]+") == true) {
            
            // set incorrect name error to the session           
            session.setAttribute("errMsg", "Error: name format incorrect");
            
            // redirect user back to the login.jsp          
            request.getRequestDispatcher("register.jsp").include(request, response);
        
        } else {
        
            try {
                //Customer(String cEmail, String password, String cusName,String DOB, int gender, boolean active)
                if (cusManager.findCustomer(cEmail) == null) {
                    cusManager.addCustomer(cEmail, password, name, DOB, registered_gen, true);
                    Customer customer = new Customer(cEmail, password, name, DOB, registered_gen, true);
                    session.setAttribute("customer", customer);

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