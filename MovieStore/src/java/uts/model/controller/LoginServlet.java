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

public class LoginServlet extends HttpServlet{

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException{
	
    }
    
   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        //session
        HttpSession session = request.getSession();
        
        //get email and password 
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User user = null;
        //an instance of the validator
        Validator validator = new Validator();
        validator.clear(session);
        
        UserManager manager = (UserManager) session.getAttribute("manager");
        DBMovie movieManager = (DBMovie) session.getAttribute("movieManager");
        
        //Users db manager
        try {      
            user = manager.findUser(email, password);
          
            //if user found
            if(user != null ){
                //if logged in user is a customer
                if(user.getUsertype().equals("Customer")){
                session.setAttribute("user",user);           
                // user's active
                user.setActive(true);
                int userId = user.getId();
                //String usertype = user.getUsertype();
                manager.addUserLog(userId, "Login");
                ArrayList<Movie> display = movieManager.fetchMovie();
                request.setAttribute("display", display);
                request.getRequestDispatcher("index.jsp").include(request,response);
                }
                //if staff
                else if (user.getUsertype().equals("Staff")) {
                session.setAttribute("staff",user);           
                // user's active
                user.setActive(true);
                int userId = user.getId();
                //String usertype = user.getUsertype();
                manager.addUserLog(userId, "Login");
                ArrayList<Movie> display = movieManager.fetchMovie();
                request.setAttribute("display", display);
                request.getRequestDispatcher("staffMain.jsp").include(request,response);
                
                }
            
                } else {
                    // if user not found
                   session.setAttribute("existErr","User does not exist in the Database !");
//                    request.getRequestDispatcher("login.jsp").include(request,response);
                }
              
            } catch(NullPointerException ex){
                System.out.println(ex.getMessage() == null? "User does not exist": "welcome");
                
            } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        // incorrect email
        if(!validator.validateEmail(email)){
            session.setAttribute("emailErr","Error: Email format incorrect");
            request.getRequestDispatcher("login.jsp").include(request,response);
            
        } 
        // incorrect password
        else if (!validator.validatePassword(password)){
            
            session.setAttribute("passErr","Error: Password format incorrect");
            request.getRequestDispatcher("login.jsp").include(request,response);
        } 
      
        
              
    }
    
  
}
