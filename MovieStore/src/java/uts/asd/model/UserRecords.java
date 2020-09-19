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


import java.io.Serializable;
import java.sql.Timestamp;


public class UserRecords implements Serializable {
    
    private int logId; //session Id
    private int userId; //save user id
    private Timestamp timestamp; // logs timestamp
    private String description; 
    
    
   public UserRecords(int logId, int userId, Timestamp timestamp, String description){
       this.logId = logId;
       this.userId = userId;
       this.timestamp = timestamp;
       this.description = description;
   }
    public int getLogId() {
        return logId;
    }

    public void setLogId(int logId) {
        this.logId = logId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    public String toString(){
        return String.format("LogId=%s; User ID=%s; Timestamp=%s; Description=%s;", 
        logId, userId, timestamp, description);
    }
    
  
    
}
