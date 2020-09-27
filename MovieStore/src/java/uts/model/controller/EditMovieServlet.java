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
public class EditMovieServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int movieID = Integer.parseInt(request.getParameter("movieID"));
        System.out.println("movieID =" +  movieID);
        DBMovie movieManager = (DBMovie) session.getAttribute("movieManager");
        
        try {
            if(movieManager != null){
                Movie movie = movieManager.findMovieID(movieID);
                session.setAttribute("movie", movie);
                request.getRequestDispatcher("editMovie.jsp").include(request, response);
            } 
        }catch (SQLException ex){
                Logger.getLogger(EditMovieServlet.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println(ex.getErrorCode() + " and " + ex.getMessage());
                    }
        }
    }


