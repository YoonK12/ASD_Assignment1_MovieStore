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

public class UserServlet extends HttpServlet{

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
	System.out.println("======================================== doGet");
        HttpSession session = request.getSession();
        UserManager manager = (UserManager)session.getAttribute("manager");
        try{
            int userId = Integer.parseInt(request.getParameter("id"));
            String userType = request.getParameter("userType");
            
            manager.deleteUser(userId);    
            
            request.getRequestDispatcher("userList.jsp?userType="+userType).include(request,response);
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
    }
    
   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        try{
            HttpSession session = request.getSession();
            UserManager manager = (UserManager)session.getAttribute("manager");

            if(request.getParameter("Id") == null){
                String fName = request.getParameter("fName");
                String lName = request.getParameter("lName");
                String password = request.getParameter("password");
                String mobileNum = request.getParameter("mobileNum");
                String email = request.getParameter("email");
                String userType = request.getParameter("userType");

                manager.insertUser(fName, lName, password, email, mobileNum, userType, false);
            }else{
                int userId = Integer.parseInt(request.getParameter("Id"));    
                String fName = request.getParameter("fName");
                String lName = request.getParameter("lName");
                String password = request.getParameter("password");
                String mobileNum = request.getParameter("mobileNum");
                String email = request.getParameter("email");
                String userType = request.getParameter("userType");
                
                manager.updateUser(userId, fName, lName, password, email, mobileNum, userType);
            }
            
            request.getRequestDispatcher("userList.jsp").include(request,response);
            
        }catch(Exception e){
            e.printStackTrace();
        }
            
        System.out.println("======================================== doPost");
        
        
    }

}
