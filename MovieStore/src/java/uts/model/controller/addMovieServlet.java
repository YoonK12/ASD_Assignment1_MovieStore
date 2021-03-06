/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uts.model.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author campf
 */
@MultipartConfig(maxFileSize = 1699999999)
public class addMovieServlet extends HttpServlet {
    private static final long serialVersionID = 1L;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
            
            PreparedStatement prepStmt = conn.prepareStatement("INSERT INTO MS.Movie (TITLE, DIRECTOR, DESCRIPTION, IMAGE, PRICE, RELEASED_DATE, CATEGORY) VALUES (?, ?, ?, ?, ?, ?, ?)");
            prepStmt.setString(1, title);
            prepStmt.setString(2, director);
            prepStmt.setString(3, description);
            prepStmt.setBlob(4, inputStream);
            prepStmt.setString(5, price);
            prepStmt.setString(6, released_date);
            prepStmt.setString(7, category);
            
            int returCode = prepStmt.executeUpdate();
            
            if (returCode == 0){
                request.setAttribute("Message", "Error inserting file");
                request.getRequestDispatcher("addMovie.jsp").include(request, response);
            } else {
                request.setAttribute("Message", "Your record inserted successfully");
                request.getRequestDispatcher("addMovie.jsp").include(request, response);
            }
        }catch(Exception exe){
            request.setAttribute("Message", "Your record inserted successfully");
                request.getRequestDispatcher("addMovie.jsp").include(request, response);
            exe.printStackTrace();
        }
    }


}
