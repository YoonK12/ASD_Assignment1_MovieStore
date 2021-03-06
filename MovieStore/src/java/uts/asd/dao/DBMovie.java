/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uts.asd.dao;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.*;
import javax.servlet.http.Part;
import uts.asd.model.*;


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
                Blob searchMovieImage = rs.getBlob(5);
                float searchMoviePrice = rs.getFloat(6);
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
               Blob searchMovieImage = rs.getBlob(5);
               float searchMoviePrice = rs.getFloat(6);
               String searchMovieReleased_Date = rs.getString(7);
               String searchCategory = rs.getString(8);
               
//               return new Movie(searchMovieID, searchMovieTitle, searchMovieDirector, searchMovieDescription, searchMovieImage, searchMoviePrice,searchMovieReleased_Date, searchCategory);
               return new Movie(searchMovieID);
            }
        }
        return null;
    }
    
    public Movie updateMovieID(int movieID) throws SQLException {
        String fetch = "SELECT * FROM MS.MOVIE WHERE movieID = " + movieID;
        ResultSet rs = st.executeQuery(fetch);
        
        while (rs.next()) {
            int searchMovieID = rs.getInt(1);
            
            if (searchMovieID == movieID){
               String searchMovieTitle = rs.getString(2);
               String searchMovieDirector = rs.getString(3);
               String searchMovieDescription = rs.getString(4);
//               Blob searchMovieImage = rs.getBlob(5);
               float searchMoviePrice = rs.getFloat(6);
               String searchMovieReleased_Date = rs.getString(7);
               String searchCategory = rs.getString(8);
               
               return new Movie(searchMovieID, searchMovieTitle, searchMovieDirector, searchMovieDescription, searchMoviePrice,searchMovieReleased_Date, searchCategory);
        
            }
        }
            return null;
    }
    
  public ArrayList<Movie> fetchMovie() throws SQLException, IOException {
      String fetch = "SELECT * FROM MS.MOVIE";
      ResultSet rs = st.executeQuery(fetch);
      ArrayList<Movie> temp = new ArrayList<Movie>();
      
      while (rs.next()) {
          int searchMovieID = rs.getInt(1);
          String searchMovieTitle = rs.getString(2);
          String searchMovieDirector = rs.getString(3);
          String searchMovieDescription = rs.getString(4);
          Blob blob = rs.getBlob(5);
//          StringBuffer strOut = new StringBuffer();
//          String aux;
//          BufferedReader br;
//          
//          br = new BufferedReader(new InputStreamReader(blob.getBinaryStream()));
//          while ((aux = br.readLine())!=null){
//              strOut.append(aux);
//          }
          InputStream inputStream = blob.getBinaryStream();
          ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
          byte[] buffer = new byte[4096];
          int bytesRead = -1;
          while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);                  
                }
          byte[] imageBytes = outputStream.toByteArray();
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                 
                 
                inputStream.close();
                outputStream.close();
//          String searchMovieImage = strOut.toString();
//          Blob searchMovieImage = rs.getBlob(5);
//          byte byteArray[] = searchMovieImage. getBytes(1, (int) searchMovieImage.length());
          float searchMoviePrice = rs.getFloat(6);
          String searchReleasedDate = rs.getString(7);
          String searchMovieCategory = rs.getString(8);
          
          
          temp.add(new Movie(searchMovieID, searchMovieTitle, searchMovieDirector, searchMovieDescription, base64Image, searchMoviePrice, searchReleasedDate, searchMovieCategory));
          
      }
      
      return temp;
  }
  
  public Movie fetchMovieWithID(int movieID) throws SQLException, IOException {
      String fetch = "SELECT * FROM MS.MOVIE WHERE movieID = " + movieID;
      ResultSet rs = st.executeQuery(fetch);
      Movie temp = null;
      
      while (rs.next()) {
          int searchMovieID = rs.getInt(1);
          String searchMovieTitle = rs.getString(2);
          String searchMovieDirector = rs.getString(3);
          String searchMovieDescription = rs.getString(4);
          Blob blob = rs.getBlob(5);

            InputStream inputStream = blob.getBinaryStream();
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int bytesRead = -1;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                      outputStream.write(buffer, 0, bytesRead);                  
                  }
            byte[] imageBytes = outputStream.toByteArray();
                  String base64Image = Base64.getEncoder().encodeToString(imageBytes);

                 
            inputStream.close();
            outputStream.close();

          float searchMoviePrice = rs.getFloat(6);
          String searchReleasedDate = rs.getString(7);
          String searchMovieCategory = rs.getString(8);
          
          
          temp = new Movie(searchMovieID, searchMovieTitle, searchMovieDirector, searchMovieDescription, base64Image, searchMoviePrice, searchReleasedDate, searchMovieCategory);
          
      }
      
      return temp;
  }
  
  public void deleteMovie(int movieID) throws SQLException {
      st.executeUpdate("DELETE FROM MS.MOVIE where movieID = " + movieID + "");
  }
 
  public void updateMovie(int movieID, String title, String director, String description, Part image, String price, String released_date, String category) throws IOException, SQLException{
            InputStream inputStream = null;
            
            if(image != null){
                long fileSize = image.getSize();
                String fileContent = image.getContentType();
                inputStream = image.getInputStream();
            }
            
          st.executeUpdate("UPDATE MS.MOVIE SET TITLE='" + title + "', DIRECTOR='" + director + "', DESCRIPTION='" + description + "', image=" + inputStream + ", price = '"+ price + "', released_date ='" + released_date + "', category ='" +category+ "'");
  }
  
}
