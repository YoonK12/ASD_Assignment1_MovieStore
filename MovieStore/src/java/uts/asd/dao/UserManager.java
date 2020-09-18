/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.asd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import uts.asd.model.User;

/**
 *
 * @author yoonkoo
 */

// find User by id or email, update User's info, register User and delete User account
public class UserManager {

     private Statement st;
     private Connection conn;
    private DBConnector connector;
    
    private UserManager manager;

    public UserManager(Connection conn) throws SQLException {
        st = conn.createStatement();
    }
     public UserManager() throws SQLException, ClassNotFoundException {
        connector = new DBConnector();
        conn = connector.openConnection();
        st = conn.createStatement();
    }
   
    //Read - find a user by email and password
    public User findUser(String email, String password) throws SQLException {
      
        String query = "SELECT * FROM MS.USERS WHERE EMAIL= '" + email + "' AND PASSWORD= '" + password + "'";
        ResultSet rs = st.executeQuery(query);

        if (rs != null) {
            
            while (rs.next()) {
                
                String userEmail = rs.getString(5); //coloum 5
                String userPass = rs.getString(4); //coloum 4

                if (userEmail.equals(email) && userPass.equals(password)) {

                    int id = rs.getInt(1);
                    String fName = rs.getString(2);
                    String lName = rs.getString(3);
                    String mobileNum = rs.getString(6);
                    String usertype = rs.getString(7);
                    boolean active = rs.getBoolean(8);

                    return new User(id, fName, lName, userPass, userEmail, mobileNum, usertype, active);
                   
                }
               
            }

        }
        return null;
    }
//find user by email
    public User findEmail(String email) throws SQLException {
        User user = null;
        String query = "SELECT * FROM MS.USERS WHERE EMAIL= '" + email + "'";
        ResultSet rs = st.executeQuery(query);
        if (rs != null) {
            while (rs.next()) {
                String userEmail = rs.getString("email");
                String password = rs.getString("password");
                int id = rs.getInt("id");
                String fName = rs.getString("fName");
                String lName = rs.getString("lName");
                String mobileNum = rs.getString("mobileNum");
                String usertype = rs.getString("usertype");
                boolean active = rs.getBoolean("active");

                user = new User(id, fName, lName, password, userEmail, mobileNum,usertype, active);
                return user;
            }

        }
        return user;
    }
// Add user (registration)
    public void addUser(String fName, String lName, String password, String email, String mobileNum) throws SQLException {

        String usertype = "Customer";
        boolean active = false;
        String query = "INSERT INTO MS.USERS(fName,lName,password,email,mobileNum,usertype,active) VALUES (?,?,?,?,?,?,?)";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, fName);
        ps.setString(2, lName);
        ps.setString(3, password);
        ps.setString(4, email);
        ps.setString(5, mobileNum);
        ps.setString(6, usertype);
        ps.setBoolean(7, active);

        ps.executeUpdate();
    }

    public ArrayList<User> fetchAll() throws SQLException {
        String fetch = "SELECT * FROM MS.USERS";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<User> user= new ArrayList();

        while (rs.next()) {
            int id = rs.getInt(1);
            String fName = rs.getString(2);
            String lName = rs.getString(3);
            String password = rs.getString(4);
            String email = rs.getString(5);
            String mobileNum = rs.getString(6);
            String usertype = rs.getString(7);
            Boolean active = rs.getBoolean(8);
            user.add(new User(id, fName, lName, password, email, mobileNum,usertype, active));
        }
        return user;
    }
//find user by user id
    public User findId(int userId) throws SQLException {
        User user = null;
        String query = "SELECT * FROM MS.USERS WHERE id= " + userId;
        ResultSet rs = st.executeQuery(query);
        if (rs != null) {
            //HttpSession sesion = request.getSession(true);
            while (rs.next()) {
                String userEmail = rs.getString("email");
                String password = rs.getString("password");
                int id = rs.getInt("id");
                String fName = rs.getString("fName");
                String lName = rs.getString("lName");
                String mobileNum = rs.getString("mobileNum");
                String usertype = rs.getString("usertype");
                boolean active = rs.getBoolean("active");

                user = new User(id, fName, lName, password, userEmail, mobileNum,usertype, active);
                return user;
            }

        }
        return user;
    }
//update User's info
    public void updateUser(int id, String fName, String lName, String password, String email, String mobileNum, String address) throws SQLException {
        User user = null;
        boolean active = false;
        String query = "UPDATE USERS SET fName=?, lName=?, password=?, email=?,"
                + "mobileNum=? WHERE id=?";
        /*
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, fName);
        ps.setString(2, lName);
        ps.setString(3, password);
        ps.setString(4, email);
        ps.setString(5, mobileNum);
        ps.setInt(6, id);

        ps.executeUpdate();*/

    }
//delete User by id
    public void deleteUserById(int id) throws SQLException {
     st.executeUpdate("DELETE FROM MS.USERS WHERE id='"+ id +"'");
    
    }
//delete User by email
    public void deleteUserByEmail(String email) throws SQLException {
    st.executeUpdate("DELETE FROM MS.USERS WHERE email='"+ email +"'");
    }
// add user activity log
    public void addUserLog(int userId, String description) throws SQLException {
       
        String query = "INSERT INTO MS.LOGS (userid, timestamp, description) VALUES (?,?,?)";
        
        Timestamp timestamp = new Timestamp(new java.util.Date().getTime());
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, userId);
        ps.setTimestamp(2, timestamp);
        ps.setString(3, description);

        ps.executeUpdate();
    }
    
}
