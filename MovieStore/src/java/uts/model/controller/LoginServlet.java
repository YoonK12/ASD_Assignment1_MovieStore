/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uts.model.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
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
public class LoginServlet extends HttpServlet {

    @Override

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1- retrieve the current session
        HttpSession session = request.getSession();

        //2- create an instance of the Validator class    
        Validator validator = new Validator();
        //3- capture the posted email      
        String email = request.getParameter("email");
        //4- capture the posted password    
        String password = request.getParameter("password");
        //5- retrieve the customer manager instance from session      
        CusManager cusManager = (CusManager) session.getAttribute("cusManager");
        StaffManager staffManager = (StaffManager) session.getAttribute("staffManager");

        Customer customer = null;
        Staff staff = null;
        // validate email
        if (!validator.validateEmail(email)) {

            //8-set incorrect email error to the session   
            session.setAttribute("emailErr", "Error: email format incorrect");

            //9- redirect user back to the login.jsp
            request.getRequestDispatcher("login.jsp").include(request, response);

            // validate password
        } else if (password instanceof String == false) {

            //11-set incorrect password error to the session           
            session.setAttribute("passErr", "Error: password format incorrect");
            //12- redirect user back to the login.jsp          
            request.getRequestDispatcher("login.jsp").include(request, response);

        } else {
            try {
                // find user by email and password
                customer = cusManager.loginCustomer(email, password);

                if (customer != null) {
                    session.setAttribute("customer", customer);
                    // add access log
                    //manager.addLog(email);

                    // redirect user to the correct page
                    request.getRequestDispatcher("main.jsp").include(request, response);

                } else {
                    session.setAttribute("existErr", "Error: user does not exist!");
                    request.getRequestDispatcher("login.jsp").include(request, response);
                }

            } catch (SQLException | NullPointerException ex) {
                System.out.println(ex.getMessage() == null ? "User does not exist" : "welcome");
            }
        }

    }
}
