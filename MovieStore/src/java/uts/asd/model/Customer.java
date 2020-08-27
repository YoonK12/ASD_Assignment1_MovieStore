/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.asd.model;

/**
 *
 * @author yoonkoo
 */
//Customers(cEmail,password,cusName,DOB,gender,active)
public class Customer {
    
    private String cEmail;
    private String password;
    private String DOB;
    private int gender;
    private boolean active;

    public Customer(String cEmail, String password, String DOB, int gender, boolean active) {
        this.cEmail = cEmail;
        this.password = password;
        this.DOB = DOB;
        this.gender = gender;
        this.active = active;
    }

    public Customer(String cEmail, String password, String cusName, String DOB, int gender, boolean active) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    //Getters and Setters
    public String getcEmail() {
        return cEmail;
    }

    public void setcEmail(String cEmail) {
        this.cEmail = cEmail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDOB() {
        return DOB;
    }

    public void setDOB(String DOB) {
        this.DOB = DOB;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }
   
}
