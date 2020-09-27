/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.asd.model;

/**
 *
 * @author heeseong
 */
public class OrderLineItem {
    private Integer orderLineID;
    private Integer movieID;
    private String orderID;
    private Integer categoryID;
    private Integer orderQuantity;
    private String title;
    private String price;
    private String email;
    public OrderLineItem() {
    }
    
    public OrderLineItem(Integer orderLineID, Integer movieID, String orderID, Integer categoryID, Integer orderQuantity) {
        this.orderLineID = orderLineID;
        this.movieID = movieID;
        this.orderID = orderID;
        this.categoryID = categoryID;
        this.orderQuantity = orderQuantity;
    }

    public Integer getOrderLineID() {
        return orderLineID;
    }

    public void setOrderLineID(Integer orderLineID) {
        this.orderLineID = orderLineID;
    }

    public Integer getMovieID() {
        return movieID;
    }

    public void setMovieID(Integer movieID) {
        this.movieID = movieID;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public Integer getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(Integer categoryID) {
        this.categoryID = categoryID;
    }

    public Integer getOrderQuantity() {
        return orderQuantity;
    }

    public void setOrderQuantity(Integer orderQuantity) {
        this.orderQuantity = orderQuantity;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    
}
