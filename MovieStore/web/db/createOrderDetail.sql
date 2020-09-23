/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  heeseong
 * Created: 2020. 9. 23
 */

CREATE TABLE ORDER_DETAIL (
  orderID int(11) DEFAULT NULL,
  movieID int(11) DEFAULT NULL,
  quantity int(11) NOT NULL,
  subtotal float NOT NULL,
  orderDate date not null,
  CONSTRAINT FK_MOVIE FOREIGN KEY (movieID) REFERENCES MOVIE (movieID), 
  CONSTRAINT FK_MOVIEORDERS FOREIGN KEY (orderID) REFERENCES MOVIEORDERS (orderID),
  CONSTRAINT FK_MOVIEORDERS_2 FOREIGN KEY (order_date) REFERENCES MOVIEORDERS (order_date)  
);