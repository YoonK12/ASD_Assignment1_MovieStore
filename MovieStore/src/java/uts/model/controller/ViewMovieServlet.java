/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uts.model.controller;

import java.io.IOException;
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
public class ViewMovieServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int movieID = 0;
        try {
            movieID = Integer.parseInt(request.getParameter("movieID"));
        } catch (NumberFormatException e){
                
            }
            
            HttpSession session = request.getSession();
            String title = request.getParameter("title");
            String director = request.getParameter("director");
            String description = request.getParameter("description");
//            String image = request.getParameter("image");
            String price = request.getParameter("price");
            String released_date = request.getParameter("released_date");
            String category = request.getParameter("category");  
            DBMovie movieManager = (DBMovie) session.getAttribute("movieManager");
            
            try {
//                Class.forName("org.apache.derby.jdbc.ClientDriver");
//                Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/MSdb","ms","admin");    
//                PreparedStatement ps = conn.prepareStatement("SELECT * from MS.MOVIE");
//                ResultSet rs = ps.executeQuery();
//                
//                if (rs.next()){
//                    int searchMovieID = rs.getInt(1);
//                    String searchMovieTitle = rs.getString(2);
//                    String searchMovieDirector = rs.getString(3);
//                    String searchMovieDescription = rs.getString(4);
//                }
//                response.setContentType("image");
//                OutputStream os = response.getOutputStream();
                
                ArrayList<Movie> display = movieManager.fetchMovie();
//                System.out.println(display.size());
                if (display.size() == 0){
                    request.getRequestDispatcher("staffMain.jsp").include(request, response);
                } else {
                    request.setAttribute("display", display);
                    request.getRequestDispatcher("staffMovieList.jsp").include(request, response);
                }
            } catch (SQLException ex){
                Logger.getLogger(ViewMovieServlet.class.getName()).log(Level.SEVERE, null, ex);

            }
    }



}
