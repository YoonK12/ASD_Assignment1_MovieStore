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
public class Movie {
    private int movieID;
    private String title;
    private String director;
    private String description;
    private byte[] image;
    private String price;
    private String released_date;
    private int categoryID;

    public Movie(int movieID, String title, String director, String description, byte[] image, String price, String released_date, int categoryID) {
        this.movieID = movieID;
        this.title = title;
        this.director = director;
        this.description = description;
        this.image = image;
        this.price = price;
        this.released_date = released_date;
        this.categoryID = categoryID;
    }

    public int getMovieID() {
        return movieID;
    }

    public void setMovieID(int movieID) {
        this.movieID = movieID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getReleased_date() {
        return released_date;
    }

    public void setReleased_date(String released_date) {
        this.released_date = released_date;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }
    
    
}
