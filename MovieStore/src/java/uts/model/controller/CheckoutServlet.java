package uts.model.controller;

//Logger
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.logging.Level;
import java.util.logging.Logger;
//Servlet Lib
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
//Database
import uts.asd.model.*;
import uts.asd.dao.*;
import java.sql.PreparedStatement;

/**
 *
 * @author jackw
 * Fuck lee jong suuuk is sooo hot 
 */
public class CheckoutServlet extends HttpServlet {
      /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Get List of orders here
         System.out.println("[DEBUG]: Get method has been called");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         //Get session
         HttpSession session = request.getSession();
         //get User ID
         User user = (User)session.getAttribute("user");
         
         if (user == null){
              request.getRequestDispatcher("login.jsp").include(request,response);
         }
         System.out.println((user == null));
         //Get form data
         String fname = request.getParameter("fname");
         String lname = request.getParameter("lname");
         String address = request.getParameter("address");
         String country = request.getParameter("country");
         String city = request.getParameter("city");
         String zip = request.getParameter("zip");
         String mobile = request.getParameter("mobile");
         String payMethod = request.getParameter("pay-method");
         String cardNumber = request.getParameter("card-number");
         String expMonth = request.getParameter("month-exp");
         String expYear = request.getParameter("year-exp");
         String cvv = request.getParameter("cvv");
         //Validate form data 
            //Validate mobile number
             if (!mobile.matches("[0-9]+") && mobile.length() != 10) {
                 session.setAttribute("mobileErr", "*Phone number must contain 10 digits");
             } else {
                 session.setAttribute("mobileErr", "");
             }
             //Validate card 
             if (!cardNumber.matches("\\d{16}") ) {
                 session.setAttribute("cardErr", "*Card number must contain 16 digits" );
             } else{
                 session.setAttribute("cardErr", "");
             }
             //Validate expire error
             if(!expMonth.matches("^(0?[1-9]|1[012])$")){
                 session.setAttribute("monthErr", "*Must be an integer between 1 and 12");
             }else{
                 session.setAttribute("monthErr", "");
             }
             if(!expYear.matches("\\d{4}")){
                 session.setAttribute("yearErr", "*Must be an 4 digit number");
             }else{
                 session.setAttribute("yearErr", "");
             }
             if(!cvv.matches("\\d{3}")){
                 session.setAttribute("cvvErr", "*Must be a 3 digit number");
             }else{
                 session.setAttribute("cvvErr", "");
             }
        //Declare and Define order details 
            String name = fname +" " + lname;
            String fullAddress = address + "," +country + "," + city +","+ zip;
            
            
            //TODO: delete these debugging outputs
           System.out.println("[DEBUG]: name " + name);
           System.out.println("[DEBUG]: address " + fullAddress );
           System.out.println("[DEBUG]: mobile " + mobile);
           System.out.println("[DEBUG]: payment method " + payMethod);
           
           //go to index.jsp for now 
           request.getRequestDispatcher("checkout.jsp").include(request,response);
         try{
             //TODO: get order id
             // Put details into user order
             String updateQuery = "UPDATE MOVIEORDERS SET shipping_address=?, recepient_name=?, recepient_phone=?,"
                     + "payment_method=?, status=? WHERE orderID=?"; 
             Class.forName("org.apache.derby.jdbc.ClientDriver");
             Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/MSdb","ms","admin");
             PreparedStatement ps = conn.prepareStatement(updateQuery);
             
             ps.setString(1, fullAddress);
             ps.setString(2, name);
             ps.setString(3, mobile);
             ps.setString(4, payMethod);
             ps.setString(5, "Done");
             ps.setInt(6, 1); //FIXME: TODO: Get order id from the previous page
             
             //TODO: uncomment the line bellow me
             //ps.executeUpdate();
             
         } catch(Exception exe){
             //TODO: make a general error html instead of using the yearErr for a database Error
              request.setAttribute("yearErr", "Something went wrong in the database. Try again later.");
              request.getRequestDispatcher("checkout.jsp").include(request, response);
              exe.printStackTrace();
         }
    }
}
