/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.model.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.asd.dao.UserManager;

/**
 *
 * @author yoonkoo
 */
public class DeleteAccServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserManager manager = (UserManager) session.getAttribute("manager");
        //field
        int userId = Integer.parseInt(request.getParameter("userId"));
       
        
             try {
                 //execute delete
                  manager.deleteUserById(userId);
                  session.setAttribute("deleteMsg", "Your account has been deleted.");
                  request.getRequestDispatcher("login.jsp").forward(request, response);
                 }
                
        
        catch (SQLException ex) {
                // exception message if deleting user fails
                session.setAttribute("deleteErr", "Cannot delete your account");
                request.getRequestDispatcher("profile.jsp").include(request, response);
            }
    }

}
