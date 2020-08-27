/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.asd.dao;

import uts.asd.model.Customer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
/**
 *
 * @author yoonkoo
 */
public class CusManager {
    private Statement st;
    private Connection conn;
    
    
     public CusManager(Connection conn) throws SQLException{
        st = conn.createStatement();
        this.conn = conn;
    
    }
    
//Customers(cEmail,password,cusName,DOB,gender,active)
//Read - find a customer by email and password
  public Customer findCustomer(String cEmail, String password) throws SQLException{
        
      Customer customer = null;
        String query = "SELECT * FROM Customers WHERE CEMAIL= '"+cEmail+"' AND PASSWORD= '"+password+"'";
        ResultSet rs = st.executeQuery(query);
    
        
        if(rs!=null){
          //HttpSession sesion = request.getSession(true);
            while(rs.next()){
            String userEmail = rs.getString("email"); 
            String userPass = rs.getString("password"); 
            
            if(userEmail.equals(cEmail) && userPass.equals(password)){
                
                    String cusName= rs.getString("cusName");
                    String DOB= rs.getString("DOB");
                    int gender = rs.getInt("gender");
                    boolean active = rs.getBoolean("active");
                    
                    customer = new Customer(cEmail,password,cusName,DOB,gender,active);
                    return customer;
            }
            //if email or password incorrect
            else 
            {
                return customer;
            }
            
        }
        
    }
        return customer;
  }
  //find customer by email
  public Customer findCusByEmail(String cEmail) throws SQLException{
        Customer user = null;
        String query = "SELECT * FROM Customers WHERE CEMAIL= '"+cEmail+"'";
        ResultSet rs = st.executeQuery(query);
         if(rs!=null){
          //HttpSession sesion = request.getSession(true);
            while(rs.next()){
            String email = rs.getString("cEmail");
            String password = rs.getString("password");
            String cusName= rs.getString("cusName");
            String DOB= rs.getString("DOB");
            int gender = rs.getInt("gender");
            boolean active = rs.getBoolean("active");
                    
            user = new Customer(email,password,cusName,DOB,gender,active);
            return user;
            }
        
        
    }return user;
 }
  // add Customer
    public void addCustomer(String cEmail,String password,String cusName,String DOB,int gender) throws SQLException{
       
      
        boolean active = false;
        String query = "INSERT INTO Customers(cEmail,password,cusName,DOB,gender,active) VALUES (?,?,?,?,?,?)";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1,cEmail);
        ps.setString(2,password);
        ps.setString(3,cusName);
        ps.setString(4,DOB);
        ps.setInt(5,gender);
        ps.setBoolean(6,active);
    
        ps.executeUpdate();
         
      
  
       //ResultSet rs = st.executeQuery(query);

    }
    //Delete Customer 
    public void deleteCusByEmail(String email) throws SQLException{
        
        String query = "DELETE FROM Customers WHERE cEmail=?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1,email);
        ps.executeQuery();
        
        
        
    }
}