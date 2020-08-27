/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.asd.dao;

import uts.asd.model.Staff;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
/**
 *
 * @author yoonkoo
 */
//public Staff(String sEmail, String password, String staName, String sRole, int gender, boolean active)
public class StaffManager {
    
    private Statement st;
    private Connection conn;
    
    
     public StaffManager(Connection conn) throws SQLException{
        st = conn.createStatement();
        this.conn = conn;
     }

//Read - find a customer by email and password
  public Staff findStaff(String sEmail, String password) throws SQLException{
        
        Staff staff = null;
        String query = "SELECT * FROM Staffs WHERE SEMAIL= '"+sEmail+"' AND PASSWORD= '"+password+"'";
        ResultSet rs = st.executeQuery(query);
    
        
        if(rs!=null){
          //HttpSession sesion = request.getSession(true);
            while(rs.next()){
            String userEmail = rs.getString("sEmail"); 
            String userPass = rs.getString("password"); 
            
            if(userEmail.equals(sEmail) && userPass.equals(password)){
                
                    String staName= rs.getString("staName");
                    String sRole= rs.getString("sRole");
                    int gender = rs.getInt("gender");
                    boolean active = rs.getBoolean("active");
                    
                    staff = new Staff(sEmail,password,staName,sRole,gender,active);
                    return staff;
            }
            //if email or password incorrect
            else 
            {
                return staff;
            }
            
        }
        
    }
        return staff;
  }
  //find staff by email
  public Staff findCusByEmail(String sEmail) throws SQLException{
        Staff user = null;
        String query = "SELECT * FROM STAFFS WHERE CEMAIL= '"+sEmail+"'";
        ResultSet rs = st.executeQuery(query);
         if(rs!=null){
          //HttpSession sesion = request.getSession(true);
            while(rs.next()){
            String email = rs.getString("sEmail");
            String password = rs.getString("password");
            String staName= rs.getString("staName");
            String sRole= rs.getString("sRole");
            int gender = rs.getInt("gender");
            boolean active = rs.getBoolean("active");
                    
            user = new Staff(email,password,staName,sRole,gender,active);
            return user;
            }
        
        
    }return user;
 }
  // add staff
    public void addStaff(String sEmail, String password, String staName, String sRole, int gender) throws SQLException{
       
        boolean active = false;
        String query = "INSERT INTO Staffs(sEmail,password,staName,sRole,gender,active) VALUES (?,?,?,?,?,?)";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1,sEmail);
        ps.setString(2,password);
        ps.setString(3,staName);
        ps.setString(4,sRole);
        ps.setInt(5,gender);
        ps.setBoolean(6,active);
    
        ps.executeUpdate();
         
      
  
       //ResultSet rs = st.executeQuery(query);

    }
    //Delete Customer 
    public void deleteStaByEmail(String email) throws SQLException{
        
        String query = "DELETE FROM Customers WHERE sEmail=?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1,email);
        ps.executeQuery();
        
        
        
    }

}
