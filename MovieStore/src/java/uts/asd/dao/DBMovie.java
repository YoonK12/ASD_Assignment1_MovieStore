/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uts.asd.dao;

import uts.asd.model.*;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;


/**
 *
 * @author campf
 */
public class DBMovie {
    
    private Statement st;
    private Connection conn;
    
    public DBMovie(Connection conn) throws SQLException {
        st = conn.createStatement();
    }
    
    //find product in database by title
    public Movie findMovie(String title, String director) throws SQLException {
        String fetch = "SELECT * FROM MS.MOVIE WHERE TITLE= '" + title + "' AND DIRECTOR='" + director +"'";
        ResultSet rs = st.executeQuery(fetch);
        
        while (rs.next()) {
            String searchMovieTitle = rs.getString(2);
            String searchMovieDirector = rs.getString(3);
            
            if (searchMovieTitle.equals(title) && searchMovieDirector.equals(director)){
                int searchMovieID = rs.getInt(1);
                String searchMovieDescription = rs.getString(4);
                byte[] searchMovieImage = rs.getBytes(5);
                String searchMoviePrice = rs.getString(6);
                String searchMovieReleased_Date = rs.getString(7);
                String category = rs.getString(8);
            }
        }
        return null;
    }
    
    public Movie findMovieID(int movieID) throws SQLException {
        String fetch = "SELECT * FROM MS.MOVIE WHERE movieID = " + movieID;
        ResultSet rs = st.executeQuery(fetch);
        
        while (rs.next()) {
            int searchMovieID = rs.getInt(1);
            
            if (searchMovieID == movieID){
               String searchMovieTitle = rs.getString(2);
               String searchMovieDirector = rs.getString(3);
               String searchMovieDescription = rs.getString(4);
               byte[] searchMovieImage = rs.getBytes(5);
               String searchMoviePrice = rs.getString(6);
               String searchMovieReleased_Date = rs.getString(7);
               String searchCategory = rs.getString(8);
            }
        }
        return null;
    }
    
  
}
