/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.asd.model;
import java.util.UUID;
/**
 *
 * @author heeseong
 */
public class CartItem {
    UUID cartItemID;
    Movie movie;
    int quantity;
    float price;
    Cart cart;
    Order order;

    public CartItem(String cartItemID, Movie movie, Integer quantity, Cart cart){
        this.movie = movie;
        this.quantity = quantity;
        this.price =  movie.price * quantity;
        this.cart = cart;
        this.cartItemID = UUID.fromString(cartItemID);
    }
    
    
    // Constructor (for brand new)
    public CartItem(Movie movie, int quantity, Cart cart) {
        this(UUID.randomUUID().toString(), movie, quantity, cart);
    }
    
    
    
    // Functional Methods
    // get id
    public UUID getCartItemID() {
        return cartItemID;
    }

//    public void setCartItemID(UUID cartItemID) {
//        this.cartItemID = cartItemID;
//    }

    public Movie getMovie() {
        return movie;
    }

//    public void setMovie(Movie movie) {
//        this.movie = movie;
//    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
        price = quantity * movie.getPrice();
        cart.updatePrice();
    }
    
    // Gets the price of the cart item
    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public Order getOrder() {
        return order;
    }
    // Sets the order of the cart item
    public void setOrder(Order order) {
        this.order = order;
    }
    
    
    
    
}
