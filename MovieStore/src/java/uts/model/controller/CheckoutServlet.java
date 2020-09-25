package uts.model.controller;

//Logger
import java.io.IOException;
import java.sql.SQLException;
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

/**
 *
 * @author jackw
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
         user.getId();
         System.out.println(user.getId());
        //Get form data
         String fname = request.getParameter("fname");
         String lname = request.getParameter("lname");
         String address = request.getParameter("address");
         String country = request.getParameter("country");
         String city = request.getParameter("city");
         String zip = request.getParameter("zip");
         String mobile = request.getParameter("fname");
         String payMethod = request.getParameter("pay-method");
         String cardNumber = request.getParameter("card-number");
         String expMonth = request.getParameter("expMonth");
         String expYear = request.getParameter("expYear");
         String cvv = request.getParameter("cvv");
         //Validate form data 
            //Check mobile number
                // check for 10 numbers
                
             if (!mobile.matches("[0-9]+") && mobile.length() != 10) {
                 session.setAttribute("mobileErr", "*Phone number must contain 10 digits");
             }
        //Declare and Define order details 
            String name = request.getParameter("fname") +" " + request.getParameter("lname");
            String fullAddress = request.getParameter("address") + "," +request.getParameter("country") + "," + request.getParameter("city") +","+ request.getParameter("zip");
            
            
            //TODO: delete these debugging outputs
           System.out.println("[DEBUG]: name " + name);
           System.out.println("[DEBUG]: address " + fullAddress );
           System.out.println("[DEBUG]: mobile " + mobile);
           System.out.println("[DEBUG]: payment method " + payMethod);
           
           //go to index.jsp for now 
           request.getRequestDispatcher("checkout.jsp").include(request,response);
         try{
             //Get Order
             // Put details into user order 
         } catch(NullPointerException ex){
             
         }
    }
}
