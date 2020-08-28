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
import java.util.ArrayList;
import java.util.LinkedList;
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
 
    // find user by email and password in the database   
    public Customer loginCustomer(String cemail, String password) throws SQLException {       
       String fetch = String.format("select * from MS.CUSTOMERS where \"%s\"='"+cemail+"' and \"%s\"='"+password+"'", "cemail", "password");
       
       ResultSet rs = st.executeQuery(fetch);
       
       while (rs.next()) {
           if (rs.getString(1).equals(cemail) && rs.getString(2).equals(password)) {
               return new Customer(rs.getString(1), rs.getString(2), rs.getString(3),
                rs.getString(4),rs.getInt(5), rs.getBoolean(6));
           }
       }
       return null;
    }
    
    
    // find user by email
    public Customer findCustomer(String cemail) throws SQLException {
        String fetch = String.format("select * from MS.CUSTOMERS where \"%s\"='"+cemail+"'", "cemail");
        ResultSet rs = st.executeQuery(fetch);
        
        while (rs.next()) {
            if (rs.getString(1).equals(cemail)) {
                return new Customer(rs.getString(1), rs.getString(2), rs.getString(3),
                rs.getString(4),rs.getInt(5), rs.getBoolean(6));
            }
        }
        return null;
    }

    //Add user to the database   
    public void addCustomer(String cemail, String password, String cusname, String dob,
            int gender, boolean active) throws SQLException {     
        st.execute("INSERT INTO MS.CUSTOMERS VALUES ('"+cemail+"', '"+password+"','"+cusname+"','"+dob+"',"+gender+",'"+active+"'");   

    }
}
