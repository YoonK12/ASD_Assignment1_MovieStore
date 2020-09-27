/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uts.model.controller;

/**
 *
 * @author campf
 */

import java.io.Serializable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.regex.*;
import javax.servlet.http.HttpSession;

public class Validator implements Serializable {
   // generic, common patterns
   private String singleStringPattern = "?";
   private String singleIntPattern = "?";
   
   // online-user-access-specific management patterns
   private String emailPattern = "([a-zA-Z0-9]+)(([._-])([a-zA-Z0-9]+))*(@)([a-z]+)(.)([a-z]{3})((([.])[a-z]{0,2})*)";
   private String namePattern = "([A-Z][a-z]+[\\s])+[A-Z][a-z]*";
   private String passwordPattern = "^(?=.*\\d)(?=.*[a-zA-Z])(?!.*[\\W_\\x7B-\\xFF]).{6,15}$"; 
   private String phonePattern = "0([0-9]+)";

   
   private String orderIdPattern = "[0-9]+";
   private String orderDatePattern = "[0-9]{4}[-][0-9]{1,2}[-][0-9]{1,2}";   
   
   private String ShipmentNamePattern = "([A-Z][a-z]*";
   private String ShipmentMethodPattern = "([A-Z][a-z]*";
   private String ShipmentDatePattern = "([0-9]+[a-z])([A-Z][a-z])([0-9])*";
   private String ShipmentAddressPattern = "([0-9])([A-Z][a-z])([A-Z][a-z])";

   public Validator() {
   }
   
   public boolean validate(String pattern, String input) {
      Pattern regEx = Pattern.compile(pattern);
      Matcher match = regEx.matcher(input);
      return match.matches();
   }
   
   public boolean validateInteger(String pattern, int input) {
      Pattern regEx = Pattern.compile(pattern);
      Matcher match = regEx.matcher(input+"");
      return match.matches();
   }

   // commonly used validators

   // validator - needs to be a valid single string
   public boolean validateSingleString(String string) {
//      return validate(passwordPattern, string);
        return true; // testing purpose
   }

   // validator - needs to be valid single int
   public boolean validateSingleInt(String number) {
//      return validate(namePattern, number);
        return true; // testing purpose
   }


   // customer validator - needs to have @ sign
   public boolean validateEmail(String email) {
      return validate(emailPattern, email);
   }

   // customer validator - phone needs to start with 0
   public boolean validatePhone(String phoneNumber) {
//      return validate(passwordPattern, phoneNumber);
      return true; // testing purpose
   }

   public boolean validatePassword(String password) {
      return validate(passwordPattern, password);
   }


   public void clear(HttpSession session) {
      session.setAttribute("emailErr", "Enter email");
      session.setAttribute("passErr", "Enter password");
      session.setAttribute("existErr", "");
      session.setAttribute("nameErr", "Enter name");

        

   }
}
