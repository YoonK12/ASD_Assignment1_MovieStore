/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  heeseong
 * Created: 2020. 9. 27
 */

create table Cart (
    cartID varchar(64) primary key,
    movieID int not null,
    orderID int not null,
    totalPrice float,
    quantity integer,
foreign key (movieID) references MOVIE(movieID),
foreign key (orderId) references ORDERS(orderId)
);