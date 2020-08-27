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
cEmail VARCHAR(30) not null primary key, 
password VARCHAR(18) NOT NULL,
cusName VARCHAR(20) NOT NULL,
DOB VARCHAR(10) NOT NULL,
gender INT NOT NULL,
active boolean NOT NULL
);
/*Insert values*/
INSERT INTO Customers(cEmail,password,cusName,DOB,gender,active)
    VALUES('jane.doe@uts.edu.au','BA99342bob','Jane Doe','01/02/1990',1,false)
,('helen.strokes@uts.edu.au','BA99342bob','Helen Strokes','11/12/1990',1,false)
,('jim.carry@uts.edu.au','BA99342bob','Jim Carry','25/08/2000',0,false)
,('steve.miller@uts.edu.au','BA99342bob','Steve Miller','03/11/1999',0,false)
,('john.smith@uts.edu.au','BA99342bob','John Smith','10/06/1988',0,false);
