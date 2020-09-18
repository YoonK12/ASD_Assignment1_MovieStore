/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.asd.model;
/**
 *
 * @author 13093950 Heeyoon Koo
 */
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Random;

enum userType{
    Customer,
    Staff,
    Admin;
}
public class User implements Serializable {
    
    //private String userID;

    private int id;
    private String fName;
    private String lName;
    private String password;
    private String email;
    private String mobileNum;
    private String usertype;
    private boolean active;
   // ArrayList<String> ID_List = new ArrayList<String>();
    
//Constructor
    public User(int id, String fName, String lName, String password, String email, String mobileNum,String usertype,boolean active) {
        this.id = id;
        this.fName = fName;
        this.lName = lName;
        this.password = password;
        this.email = email;
        this.mobileNum = mobileNum;
        this.usertype = usertype;
        this.active = active;
        //this.userID = createUserID();
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsertype() {
        return usertype;
    }

    public void setUsertype(String usertype) {
        this.usertype = usertype;
    }

   public String getfName() {
        return fName;
    }

    public void setfName(String fName) {
        this.fName = fName;
    }

    public String getlName() {
        return lName;
    }

    public void setlName(String lName) {
        this.lName = lName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobileNum() {
        return mobileNum;
    }

    public void setMobileNum(String mobileNum) {
        this.mobileNum = mobileNum;
    }

    //enum user activity
    //enum user file 


    
  
}
