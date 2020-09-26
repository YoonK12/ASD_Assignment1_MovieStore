/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.asd.model;

import java.util.LinkedList;
import java.util.UUID;
import uts.asd.dao.DBMovie;
/**
 *
 * @author heeseong
 */
public class Cart {
    // Private Fields
    LinkedList<CartItem> cartItems;
    User user;
    double totalPrice;
    Order order;
    
    // Constructor
    public Cart(User user){
        this.cartItems = new LinkedList<>();
        this.user = user;
        this.totalPrice = 0.00;
    }
    
    // Functional Methods
    // Add a cartItem to the cart
    public void addToCart(CartItem cartItem) {
        cartItems.add(cartItem);
        totalPrice += cartItem.price;
    }
    // Add a product directly to the cart
    public void addToCart(Movie movie, int quantity) {
        CartItem cartItem = new CartItem(movie, quantity, this);
        addToCart(cartItem);
    }
    
    // Remove a known cartItem from the cart
    public void removeFromCart(CartItem cartItem) {
        cartItems.remove(cartItem);
        totalPrice -= cartItem.price;
    }
    
    // Clear all contents from the cart
    public void clearCart() {
        cartItems = new LinkedList<CartItem>();
    }
    
    
    //////////////////////////////////////////////
    
    // Get the total price of the cart
    public double getPrice() {
        return totalPrice;
    }
    
    // Get Cart Items
    public LinkedList<CartItem> getCartItems() {
        return cartItems;
    }
    
    // Get CartItem based on ID
    public CartItem getCartItemFromID(UUID id) {
        for (CartItem cartItem : cartItems) {
            if (cartItem.getCartItemID().equals(id)) {
                return cartItem;
            }
        }
        return null;
    }
    
    // Update Price if changes made
    public void updatePrice(){
        totalPrice = 0.0;
        for (CartItem cartItem : cartItems) { 
            totalPrice += cartItem.getPrice();
        }
    }
    
    // Set Cart Order
    public void setOrder(Order order) {
        this.order = order;
        for (CartItem cartItem : cartItems) {
            cartItem.setOrder(order);
        }
    }

    public void addToCart(DBMovie movie, int i) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
