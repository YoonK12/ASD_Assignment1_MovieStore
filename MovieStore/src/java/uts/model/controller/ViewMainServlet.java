/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uts.model.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.asd.dao.DBMovie;
import uts.asd.model.*;

/**
 *
 * @author campf
 */
public class ViewMainServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int movieID = 0;
        try{
            movieID = Integer.parseInt(request.getParameter("movieID"));
        }catch (NumberFormatException e) {
            
        }
        
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        String title = request.getParameter("title");
        String director = request.getParameter("director");
        String description = request.getParameter("description"); 
        String price = request.getParameter("price");
        String released_date = request.getParameter("released_date");
        String category = request.getParameter("category"); 
        DBMovie movieManager = (DBMovie) session.getAttribute("movieManager");
        
        try {
            ArrayList<Movie> display = movieManager.fetchMovie();
            
        } catch (SQLException ex) {
            Logger.getLogger(ViewMainServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
