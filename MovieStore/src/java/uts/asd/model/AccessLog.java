/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uts.asd.model;

/**
 *
 * @author campf
 */
public class AccessLog {
    private String accessID;
    private String email;
    private String timestamp;
    
    public AccessLog(String accessID, String email, String timestamp) {
        this.accessID = accessID;
        this.timestamp = timestamp;
        this.email = email;
    }

    public String getAccessID() {
        return accessID;
    }

    public void setAccessID(String accessID) {
        this.accessID = accessID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(String timestamp) {
        this.timestamp = timestamp;
    }
    
}

