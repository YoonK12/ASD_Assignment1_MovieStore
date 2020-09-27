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
    private String image;
    float price;
    private String released_date;
    private String category;

    public Movie(int movieID, String title, String director, String description, String image, float price, String released_date, String category) {
        this.movieID = movieID;
        this.title = title;
        this.director = director;
        this.description = description;
        this.image = image;
        this.price = price;
        this.released_date = released_date;
        this.category = category;
    }

    public Movie(int movieID) {
        this.movieID = movieID;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getReleased_date() {
        return released_date;
    }

    public void setReleased_date(String released_date) {
        this.released_date = released_date;
    }

    public String getCategory() {
        return category;
    }

    public void setCategoryID(String category) {
        this.category = category;
    }
    
    
}
