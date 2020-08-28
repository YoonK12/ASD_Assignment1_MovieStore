/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.asd.dao;

import uts.asd.model.*;
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
    
    // add an access log
    public void addLog(String email) throws SQLException {    
        st.execute(String.format("INSERT INTO MS.CUSTOMERS (\"%s\", \"%s\") VALUES('"+email+"', CURRENT_TIMESTAMP)", "email", "dateTime")); 
    }
    
    // view all access logs for a user
    public LinkedList<AccessLog> viewLogs(String cemail) throws SQLException {
        LinkedList<AccessLog> logs = new LinkedList<AccessLog>();
        
        // get all access logs using email
        String fetch = String.format("select * from MS.ACCESSLOGS where \"%s\"='"+cemail+"'", "cemail");
        ResultSet rs = st.executeQuery(fetch);

        while (rs.next()) {
            // add the logs to the list
            logs.add(new AccessLog(rs.getString(1), rs.getString(2), rs.getString(3)));
        }

        // return the list
        return logs;
    }

//    update a user details in the database   
    public void updateUser(String cemail, String name, String password, String phone, String address, String gender, String type) throws SQLException {       
        String fetch = String.format("UPDATE MS.CUSTOMERS SET \"%s\"='"+name+"' where \"%s\"='"+email+"'", "name", "email");
        st.execute(fetch);
        fetch = String.format("UPDATE MS.CUSTOMERS SET \"%s\"='"+password+"' where \"%s\"='"+email+"'", "password", "email");
        st.execute(fetch);
        fetch = String.format("UPDATE MS.CUSTOMERS SET \"%s\"='"+phone+"' where \"%s\"='"+email+"'", "phone", "email");
        st.execute(fetch);
        fetch = String.format("UPDATE MS.CUSTOMERS SET \"%s\"='"+address+"' where \"%s\"='"+email+"'", "address", "email");
        st.execute(fetch);
        fetch = String.format("UPDATE MS.CUSTOMERS SET \"%s\"='"+gender+"' where \"%s\"='"+email+"'", "gender", "email");
        st.execute(fetch);
        fetch = String.format("UPDATE MS.CUSTOMERS SET \"%s\"='"+type+"' where \"%s\"='"+email+"'", "type", "email");
        st.execute(fetch);        
    }
    
    public void deleteUser(String email) throws SQLException {
        st.execute(String.format("DELETE FROM ISDUSER.USERS WHERE \"%s\"='"+email+"'", "email"));
    }
    
    public void deleteStaffUser(String email) throws SQLException {
        st.execute("DELETE FROM ISDUSER.USERS WHERE EMAIL = '"+email+"'");
    }



   //user list - Austin
   public ArrayList<User> searchUser(String searchParam)throws SQLException{
        String cond  = "";
        if(searchParam.equals("")){
            cond = "true";
        }
        else cond = "EMAIL LIKE '%"+searchParam+"%' OR NAME LIKE '%"+searchParam+"%' OR PHONE LIKE '%"+searchParam+"%' OR ADDRESS LIKE '%"+searchParam+"%'";
        String fetch = "SELECT * FROM ISDUSER.USERS WHERE " + cond;
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<User> temp = new ArrayList<User>();
            while (rs.next()){
                String email = rs.getString(1);
                String name = rs.getString(2);
                String password = rs.getString(3);
                String gender = rs.getString(4);
                String phone = rs.getString(5);
                String address = rs.getString(6);
                String type = rs.getString(7);
                temp.add(new User(email, name, password, gender, phone, address, type));
            }
        return temp;
    }
}