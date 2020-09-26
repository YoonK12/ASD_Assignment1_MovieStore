/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.model.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.asd.dao.UserManager;
import uts.asd.model.User;

/**
 *
 * @author yoonkoo
 */
public class EditServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //current session
        HttpSession session = request.getSession();
        UserManager manager = (UserManager)session.getAttribute("manager");
        
        String func = request.getParameter("func");
        String type = request.getParameter("type");
        
        if(func.equals("default")){
         //fields
        int userId = Integer.parseInt(request.getParameter("Id"));
        String fName = request.getParameter("fName");
        String lName = request.getParameter("lName");
        String mobileNum = request.getParameter("mobileNum");
          
        User user = null;
        // clear validator

             try {
                 //find user by email
                 user = manager.findUserById(userId);
                // if user not found (same email does not exist in the database)
                 if(user != null){
                // Update User info     
                manager.updateUser(userId, fName, lName, mobileNum);
                session.setAttribute("updated", "Info Successfully Updated");
                //add log 
                manager.addUserLog(userId, "Info changed");
                User updatedUser = manager.findUserById(userId);
                session.setAttribute("user", updatedUser);
                if("staff".equals(type)){
                request.getRequestDispatcher("./profile.jsp?type=staff").forward(request, response);
                
                }
                request.getRequestDispatcher("./profile.jsp").forward(request, response);
                
                
                 }
                 // if there is a same email exist in the database
                 else
                 {
                     session.setAttribute("exceptionErr", "Error while loading your info");
                     if("staff".equals(type)){
                     response.sendRedirect("./edit.jsp?type=staff");
                     }
                     response.sendRedirect("./edit.jsp");
                     
                 }
            } catch (SQLException ex) {
                // exception message if adding customer fails
                session.setAttribute("exceptionErr", "Registration failed");
                if("staff".equals(type)){
                     response.sendRedirect("./edit.jsp?type=staff");
                     }
                response.sendRedirect("./edit.jsp");
                     
            }   
        }
        
        else{
            //fields
        int userId = Integer.parseInt(request.getParameter("Id"));
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        User user = null;
        Validator validator = new Validator();
        
        //Invalid password format
            if(!validator.validatePassword(password)){
            
            session.setAttribute("passErr","Error: Password format incorrect");
            if("staff".equals(type)){
                response.sendRedirect("./changePW.jsp?type=staff");
            }
            response.sendRedirect("./changePW.jsp");
            
            }
            else{
                if(!password.equals(repassword)){
             
            session.setAttribute("matchErr", "Password confirmation must match password");
            if("staff".equals(type)){
                response.sendRedirect("./changePW.jsp?type=staff");
            }
            response.sendRedirect("./changePW.jsp");
          
            }
                //if password and re-type password is correct
                else{
                    try {
                    //find user by email
                    user = manager.findUserById(userId);
                    // if user not found (same email does not exist in the database)
                    if(user != null){
                    // Update User info     
                    manager.changeUserPW(userId, password);
                    //add log
                    manager.addUserLog(userId, "Password changed");
                   // session.setAttribute("updated", "Info Successfully Updated");
                    request.getRequestDispatcher("./login.jsp").forward(request, response);
                    }
                    // In case no use returned
                    else
                    {
                     session.setAttribute("exceptionErr", "Error while loading your info");
                     if("staff".equals(type)){
                    response.sendRedirect("./changePW.jsp?type=staff");
                    }
                     request.getRequestDispatcher("./changePW.jsp").include(request, response);
                    }
                    
                    } catch (SQLException ex) {
                    // exception message if failed
                    session.setAttribute("exceptionErr", "Registration failed");
                    if("staff".equals(type)){
                    response.sendRedirect("./changePW.jsp?type=staff");
                    }
                    request.getRequestDispatcher("./changePW.jsp").include(request, response);
                    }     
                }
            }
            
        
            
                
            
        }
        
             
             
           
       
            
    }

}
