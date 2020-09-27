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
import uts.asd.model.UserRecords;

/**
 *
 * @author yoonkoo
 */

// find User by id or email, update User's info, register User and delete User account
public class UserManager {

     private Statement st;
     private Connection conn;


    public UserManager(Connection conn) throws SQLException {
        st = conn.createStatement();
        this.conn = conn;
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
    public User findUserByEmail(String email) throws SQLException {
        User user = null;
        String query = "SELECT * FROM MS.USERS WHERE EMAIL= '" + email + "'";
        ResultSet rs = st.executeQuery(query);
        if (rs != null) {
            while (rs.next()) {
                String userEmail = rs.getString("email");
                String password = rs.getString("password");
                int userId = rs.getInt("userId");
                String fName = rs.getString("fName");
                String lName = rs.getString("lName");
                String mobileNum = rs.getString("mobileNum");
                String usertype = rs.getString("usertype");
                boolean active = rs.getBoolean("active");

                user = new User(userId, fName, lName, password, userEmail, mobileNum,usertype, active);
                return user;
            }

        }
        return user;
    }
    //find user by id
    public User findUserById(int userId) throws SQLException {
       User user = null;
        String query = "SELECT * FROM USERS WHERE userId= " + userId;
        ResultSet rs = st.executeQuery(query);
        if (rs != null) {
            //HttpSession sesion = request.getSession(true);
            while (rs.next()) {
                String userEmail = rs.getString("email");
                String password = rs.getString("password");
                int id = rs.getInt("userId");
                String fName = rs.getString("fName");
                String lName = rs.getString("lName");
                String mobileNum = rs.getString("mobileNum");
                
                String usertype = rs.getString("usertype");
                boolean active = rs.getBoolean("active");

                user = new User(id, fName, lName, password, userEmail, mobileNum, usertype, active);
                return user;
            }

        }
        return user;
    }
// Add user (registration)
    public void addUser(String fName, String lName, String password, String email, String mobileNum, String usertype, boolean active) throws SQLException {

        String query = "INSERT INTO USERS (fName,lName,password,email,mobileNum,usertype,active) VALUES " +
                "('" + fName + "', '" + lName+ "', '" + password
                + "', '" + email + "', '" + mobileNum+ "', '" + usertype + "', '" + active + "')";
        st.execute(query); 

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
        String query = "SELECT * FROM MS.USERS WHERE userId= " + userId;
        ResultSet rs = st.executeQuery(query);
        if (rs != null) {
            //HttpSession sesion = request.getSession(true);
            while (rs.next()) {
                String userEmail = rs.getString("email");
                String password = rs.getString("password");
                int id = rs.getInt("userId");
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
    public void updateUser(int id, String fName, String lName, String password, String email, String mobileNum) throws SQLException {
        
        String query = "UPDATE USERS SET fName=?, lName=?, password=?, email=?,"
                + "mobileNum=? WHERE userId=?";
        
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, fName);
        ps.setString(2, lName);
        ps.setString(3, password);
        ps.setString(4, email);
        ps.setString(5, mobileNum);
        ps.setInt(6, id);

        ps.executeUpdate();

    }
    
    //update User's info (first Name, Last Name, mobile Num)
     public void updateUser(int id, String fName, String lName, String mobileNum) throws SQLException {
        
        String query = "UPDATE USERS SET fName=?, lName=?, mobileNum=? WHERE userId=?";
        
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, fName);
        ps.setString(2, lName);
        ps.setString(3, mobileNum);
        ps.setInt(4, id);

        ps.executeUpdate();

    }
     //Update User Password
      public void changeUserPW(int id, String password) throws SQLException {
        
        String query = "UPDATE USERS SET PASSWORD=? WHERE userId=?";
        
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, password);
        ps.setInt(2, id);

        ps.executeUpdate();

    }
     
//delete User by id
    public void deleteUserById(int id) throws SQLException {
    String query = "DELETE FROM MS.USERS WHERE userId=?";
        
    PreparedStatement ps = conn.prepareStatement(query); 
    ps.setInt(1, id);
    ps.executeUpdate();
    }
//delete User by email
    public void deleteUserByEmail(String email) throws SQLException {
    st.executeUpdate("DELETE FROM MS.USERS WHERE email='"+ email +"'");
    }
// add user activity log
    public void addUserLog(int userId, String description) throws SQLException {
      
        String query = "INSERT INTO LOGS (userid, timestamp, description) VALUES (?,?,?)";
        Timestamp timestamp = new Timestamp(new java.util.Date().getTime());
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, userId);
        ps.setTimestamp(2, timestamp);
        ps.setString(3, description);

        ps.executeUpdate();         
    }
  public ArrayList<UserRecords> findUserLogs(int userid) throws SQLException {
        String query = "SELECT * FROM MS.LOGS WHERE userId=?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, userid);
        
        ResultSet rs = ps.executeQuery();
        ArrayList<UserRecords> logs = new ArrayList<UserRecords>();
       
        while (rs.next()) {
            int logId = rs.getInt("logId");
            int userId = rs.getInt("userId");
            Timestamp timestamp = rs.getTimestamp("timestamp");
            String description = rs.getString("description");
            logs.add(new UserRecords(logId, userId, timestamp, description));
        }

        if (logs.isEmpty()) {
            throw new SQLException("No logs exists");
        }
        else{
        return logs;
        }
        
    }

    public ArrayList<UserRecords> findUserLogs(Timestamp start, Timestamp end, int userid) throws SQLException {

        String query = "SELECT * FROM MS.LOGS WHERE TIMESTAMP >= ? AND TIMESTAMP <= ? AND USERID = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setTimestamp(1, start);
        ps.setTimestamp(2, end);
        ps.setInt(3, userid);
        ResultSet rs = ps.executeQuery();
        ArrayList<UserRecords> logs = new ArrayList<UserRecords>();
        
        // public UserRecords(int logId, int userId, Timestamp timestamp, String description
        while (rs.next()) {
            int logId = rs.getInt(1);
            int userId = rs.getInt(2);  
            Timestamp timestamp = rs.getTimestamp(3);
            String description = rs.getString(4);
            logs.add(new UserRecords(logId, userId, timestamp, description));
        }

        if (logs.isEmpty()) {
            throw new SQLException("No logs exists");
        }
        else {
            return logs;
        }
    }

    public ArrayList<User> selectListUser(String userType) throws SQLException {
        String sql = "SELECT * "
                + "FROM USERS "
                + "WHERE 1=1 ";
        
        if(!"".equals(userType)){
            sql += "AND usertype = '" + userType +"'";
        }
                
        ResultSet rs = st.executeQuery(sql);
        ArrayList<User> resultList = new ArrayList();

        while (rs.next()) {
            int id = rs.getInt(1);
            String fName = rs.getString(2);
            String lName = rs.getString(3);
            String password = rs.getString(4);
            String email = rs.getString(5);
            String mobileNum = rs.getString(6);
            String usertype = rs.getString(7);
            Boolean active = rs.getBoolean(8);
            resultList.add(new User(id, fName, lName, password, email, mobileNum,usertype, active));
        }
        
        return resultList;
    }
    
    //find user by id
    public User selectUser(String userId){
        User user = null;
        if("".equals(userId) || "null".equals(userId)){
            user = new User();
            return user;
        }
        
        try{

            String sql = "SELECT * "
                    + "FROM USERS "
                    + "WHERE 1=1 ";

            if(!"".equals(userId)){
                sql += "AND userId = " + userId;
            }
            System.out.println(sql);
            ResultSet rs = st.executeQuery(sql);

            if (rs != null) {
                //HttpSession sesion = request.getSession(true);
                while (rs.next()) {
                    String userEmail = rs.getString("email");
                    String password = rs.getString("password");
                    int id = rs.getInt("userId");
                    String fName = rs.getString("fName");
                    String lName = rs.getString("lName");
                    String mobileNum = rs.getString("mobileNum");

                    String usertype = rs.getString("usertype");
                    boolean active = rs.getBoolean("active");

                    user = new User(id, fName, lName, password, userEmail, mobileNum, usertype, active);
                    return user;
                }

            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return user;
    }

    public void insertUser(String fName, String lName, String password, String email, String mobileNum, String usertype, boolean active) throws SQLException {
        
        String query = "INSERT INTO USERS (fName, lName, password, email, mobileNum, usertype, active) VALUES (?, ?, ?, ?, ?, ?, ?)";
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
    
    public void updateUser(int id, String fName, String lName, String password, String email, String mobileNum, String usertype) throws SQLException {

        String query = "UPDATE USERS "
                + "SET fName=?, "
                + "    lName=?, "
                + "    password=?, "
                + "    email=?, "
                + "    mobileNum=? "
                + "WHERE userId=? ";
        
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, fName);
        ps.setString(2, lName);
        ps.setString(3, password);
        ps.setString(4, email);
        ps.setString(5, mobileNum);
        ps.setInt(6, id);

        ps.executeUpdate();
    }
    
    public void deleteUser(int id) throws SQLException {
        
        String query = "DELETE FROM USERS WHERE userid = ?";
        PreparedStatement ps = conn.prepareStatement(query);

        ps.setInt(1, id);

        ps.executeUpdate();
    }
}
