/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  heeseong
 * Created: 2020. 9. 23
 */

CREATE TABLE ORDERS (
  orderID INT NOT NULL,
  order_date date NOT NULL,
  shipping_address varchar(256) NOT NULL,
  recipient_name varchar(30) NOT NULL,
  recipient_phone varchar(15) NOT NULL,
  payment_method varchar(20) NOT NULL,
  total float NOT NULL,
  status varchar(20) NOT NULL,
  PRIMARY KEY (orderID)
);