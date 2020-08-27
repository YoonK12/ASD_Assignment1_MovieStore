/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  yoonkoo
 * Created: 28/08/2020
 */

CREATE TABLE Customers (
cEmail VARCHAR(50) not null primary key, 
password VARCHAR(20) NOT NULL,
cusName VARCHAR(20) NOT NULL,
DOB date NOT NULL,
gender INT NOT NULL,
active boolean NOT NULL
);
