/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  yoonkoo
 * Created: 28/08/2020
 */

CREATE TABLE Staffs (
sEmail VARCHAR(30) not null primary key, 
password VARCHAR(18) NOT NULL,
staName VARCHAR(20) NOT NULL,
sRole VARCHAR(10) NOT NULL,
gender INT NOT NULL,
active boolean NOT NULL
);
