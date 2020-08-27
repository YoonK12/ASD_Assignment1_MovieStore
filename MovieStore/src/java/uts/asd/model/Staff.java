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
//INSERT INTO Staffs(sEmail,password,staName,sRole,gender,active)
public class Staff {
    private String sEmail;
    private String password;
    private String staName;
    private String sRole;
    private int gender;
    private boolean active;

    public Staff(String sEmail, String password, String staName, String sRole, int gender, boolean active) {
        this.sEmail = sEmail;
        this.password = password;
        this.staName = staName;
        this.sRole = sRole;
        this.gender = gender;
        this.active = active;
    }
    
    //getters and setters
    public String getsEmail() {
        return sEmail;
    }

    public void setsEmail(String sEmail) {
        this.sEmail = sEmail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStaName() {
        return staName;
    }

    public void setStaName(String staName) {
        this.staName = staName;
    }

    public String getsRole() {
        return sRole;
    }

    public void setsRole(String sRole) {
        this.sRole = sRole;
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
