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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import uts.asd.dao.*;
import uts.asd.model.*;

/**
 *
 * @author campf
 */
public class deleteMovieServlet extends HttpServlet {



    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        int movieID = Integer.parseInt(request.getParameter("movieID"));
        System.out.println("movieID =" + movieID);
        String title = request.getParameter("title");
        String director = request.getParameter("director");
        Part image = request.getPart("image");
        String price = request.getParameter("price");
        String released_date = request.getParameter("released_date");
        String category = request.getParameter("category");
        DBMovie movieManager = (DBMovie) session.getAttribute("movieManager");
    
        Movie movie = null;
        validator.clear(session);
        try {
            Movie exist = movieManager.findMovieID(movieID);
            
            if (exist != null) {
                movieManager.deleteMovie(movieID);
                session.setAttribute("existMovieErr", "Movie has been deleted!");
            } else {
                session.setAttribute("existMovieErr", "No movie is in database");
            }
            
            ArrayList<Movie> display = movieManager.fetchMovie();
            
            request.setAttribute("display", display);
            request.getRequestDispatcher("staffMain.jsp").include(request, response);
            
        } catch (SQLException | NullPointerException ex) {
            ex.printStackTrace();
        }
    }


}
