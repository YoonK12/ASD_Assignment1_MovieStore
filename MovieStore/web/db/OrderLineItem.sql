/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  heeseong
 * Created: 2020. 9. 28
 */

CREATE TABLE ORDERLINEITEM
(
    orderLineID int GENERATED ALWAYS AS IDENTITY NOT NULL,
    movieID INT,
    orderID varchar(255),
    email varchar(255),
    orderQuantity INT not null,
    categoryID int default 0,
    PRIMARY KEY (orderLineID),
    CONSTRAINT FK_movieID FOREIGN KEY (movieID)
    REFERENCES MOVIE(movieID),
    CONSTRAINT FK_CATEGORY FOREIGN KEY (categoryID)
    REFERENCES CATEGORY(categoryID)
)