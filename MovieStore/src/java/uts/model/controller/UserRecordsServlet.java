package uts.model.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.asd.dao.UserManager;
import uts.asd.model.*;

public class UserRecordsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    public UserRecordsServlet(){
       super();
}
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        UserManager manager = (UserManager) session.getAttribute("manager");
        //User user = (User) session.getAttribute("user");*/
       
        ArrayList<UserRecords> logs = new ArrayList<UserRecords>();
        String id = request.getParameter("userId");
        if( id != null){
            int userId = Integer.parseInt(id);
   
        try {
                logs = manager.findUserLogs(userId);
                if(logs == null){
                    session.setAttribute("LogsResult","No logs exists");
                    request.getRequestDispatcher("userLogs.jsp").include(request, response);
                    
                }
                else{
                     // set the session
                     session.setAttribute("LogsResult","Saved Logs List");
                     session.setAttribute("logs", logs);
                     request.getRequestDispatcher("userLogs.jsp").include(request, response);
                }
            
           
       } catch (SQLException ex) {
           
            session.setAttribute("LogsResult", "No logs exists");
        }
       }
        
      
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
       
       HttpSession session = request.getSession();
        UserManager manager = (UserManager) session.getAttribute("manager");
           ArrayList<UserRecords> logs = new ArrayList<UserRecords>();
        // search logs by date
        int userId = Integer.parseInt(request.getParameter("userId"));
        String start = request.getParameter("startDate");
        String end = request.getParameter("endDate");
        
        java.sql.Timestamp startStamp = convertToTimeStamp(start);
        java.sql.Timestamp endStamp = convertToTimeStamp(end);
       
      //  User user = (User) session.getAttribute("user");
       
         if(startStamp != null && endStamp !=null){
       
            try {
                    logs = manager.findUserLogs(startStamp,endStamp,userId);             
                    session.setAttribute("LogsResult", "Searched Activity Logs");
                    session.setAttribute("logs", logs);
                    request.getRequestDispatcher("userLogs.jsp").include(request, response);
            } catch (SQLException ex) {
              
                session.setAttribute("SearchErr", "No logs for user exists");
                request.getRequestDispatcher("userLogs.jsp").include(request, response);
                
            }
            
                
         }
          
            // public UserRecords(int logId, int userId, Timestamp timestamp, String description
            
            
        
    }
  

 public java.sql.Timestamp convertToTimeStamp(String date) {
        try {
            DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

            Date toDate = formatter.parse(date);

           java.sql.Timestamp timestamp = new java.sql.Timestamp(toDate.getTime());
            
            return timestamp;
        } catch (Exception ex) {
            return null;
        }
    }
}