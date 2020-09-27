/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  yoonkoo
 * Created: 27/09/2020
 */

CREATE TABLE USERS (
userId              INTEGER NOT NULL PRIMARY KEY
                    GENERATED ALWAYS AS IDENTITY
                    (START WITH 1, INCREMENT BY 1), 
fName           VARCHAR(10),
lName           VARCHAR(10),
password        VARCHAR(20),
email           VARCHAR(50) NOT NULL,
mobileNum       VARCHAR(20),
usertype        VARCHAR(10),
active          BOOLEAN
);

CREATE TABLE MOVIE (
  movieID int GENERATED ALWAYS AS IDENTITY NOT NULL,
  title varchar(128) NOT NULL,
  director varchar(64) NOT NULL,
  description varchar(800) NOT NULL,
  image blob,
  price float NOT NULL,
  released_date varchar(50) NOT NULL,
  category varchar(50),
  PRIMARY KEY (movieID)
);


CREATE TABLE CATEGORY (
  category_id int(11) NOT NULL AUTO_INCREMENT,
   `name` varchar(30) NOT NULL,
  PRIMARY KEY (category_id)
);

create table Cart (
    cartID varchar(64) primary key,
    movieID int not null,
    orderID int not null,
    totalPrice float,
    quantity integer,
foreign key (movieID) references MOVIE(movieID),
foreign key (orderId) references ORDERS(orderId)
);