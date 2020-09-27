/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uts.model.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
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
@MultipartConfig(maxFileSize = 1699999999)
public class UpdateMovieServlet extends HttpServlet {
    private static final long serialVersionID = 1L;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
//        Validator validator = new Validator();
          int movieID = Integer.parseInt(request.getParameter("movieID"));
//        System.out.println("movieID =" + movieID);
//        String title = request.getParameter("title");
//        String director = request.getParameter("director");
//        Part image = request.getPart("image");
//        String price = request.getParameter("price");
//        String released_date = request.getParameter("released_date");
//        String category = request.getParameter("category");
       DBMovie movieManager = (DBMovie) session.getAttribute("movieManager");
//        
//        Movie movie = null;
//        validator.clear(session);
//        
//        try {
//            Movie exist = movieManager.updateMovieID(movieID);
//            if (exist != null){
//                movieManager.updateMovie(movieID, title, director, director, image, price, released_date, category);
//                session.setAttribute("movie", movieID);
//                request.getRequestDispatcher("staffMovieList.jsp").include(request, response);
//            } else {
//                session.setAttribute("updated", "Update was not Successful");
//                request.getRequestDispatcher("editMovie.jsp").include(request, response);
//            }
//        } catch (SQLException ex) {
//        System.out.println("Error has occurred while updating movie details");
//}
        try {
            String title = request.getParameter("title");
            String director = request.getParameter("director");
            String description = request.getParameter("description");
            Part image = request.getPart("image");
            String price = request.getParameter("price");
            String released_date = request.getParameter("released_date");
            String category = request.getParameter("category");
            InputStream inputStream = null;
            
            if(image != null){
                long fileSize = image.getSize();
                String fileContent = image.getContentType();
                inputStream = image.getInputStream();
            }
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/MSdb","ms","admin");
            
            PreparedStatement prepStmt = conn.prepareStatement("UPDATE MS.MOVIE SET TITLE='" + title + "', DIRECTOR='" + director + "', DESCRIPTION='" + description + "', image=" + inputStream + ", price = '"+ price + "', released_date ='" + released_date + "', category ='" +category+ "'");
//            PreparedStatement prepStmt = (PreparedStatement)conn.prepareStatment("update ms.movie set title=?, director=?, description=?, inputstream=?, price=?, released_date=?, category=? where movieID =?");
            prepStmt.setString(1, title);
            prepStmt.setString(2, director);
            prepStmt.setString(3, description);
            prepStmt.setBlob(4, inputStream);
            prepStmt.setString(5, price);
            prepStmt.setString(6, released_date);
            prepStmt.setString(7, category);
            
            int returCode = prepStmt.executeUpdate();
            //findMovieID(int movieID)
            if (returCode == 0){
                request.setAttribute("Message", "Error inserting file");
                request.getRequestDispatcher("editMovie.jsp").include(request, response);
            } else{
                request.setAttribute("Message", "Your record has updated successfully");
                 Movie updatedMovie = movieManager.findMovieID(movieID);
                 session.setAttribute("movie",updatedMovie);
                request.getRequestDispatcher("editMovie.jsp").forward(request, response);
            }
        
        }catch(Exception exe){
            request.setAttribute("Message", "Your record has updated successfully");
            request.getRequestDispatcher("editMovie.jsp").include(request, response);
            exe.printStackTrace();
        }
    }
}


