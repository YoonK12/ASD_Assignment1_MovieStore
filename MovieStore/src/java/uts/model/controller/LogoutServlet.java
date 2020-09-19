/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.model.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserManager manager = (UserManager) session.getAttribute("manager");
        //fields
        User user = (User) session.getAttribute("user");
        
        try {
            // save logout time into the USERS table
            manager.addUserLog(user.getId(),"Logout");
            // set user's active status as false
            user.setActive(false);
             //remove session attribute
            session.removeAttribute("user");
            session.invalidate();
            //if it successes go back to index.jsp
            response.sendRedirect("./index.jsp");
            
        } catch (SQLException ex) {
            Logger.getLogger(LogoutServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
   
}

