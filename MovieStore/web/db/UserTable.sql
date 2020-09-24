/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  yoonkoo
 * Created: 18/09/2020
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
/*
ADD Customers
*/
INSERT INTO USERS(fName,lName,password,email,mobileNum,usertype,active)
    VALUES('Jane','Doe','BA99342bob','jane.doe@uts.edu.au','01234567','Customer',false)
,('Helen','Strokes','BA99342bob', 'helen.strokes@uts.edu.au','01234567','Customer',false)
,('Jim','Carry','BA99342bob','jim.carry@uts.edu.au','01234567','Customer',false)
,('Steve','Miller','BA99342bob','steve.miller@uts.edu.au','01234567','Customer',false)
,('John','Smith','BA99342bob','john.smith@uts.edu.au','01234567','Customer',false)
,('Yoon','Koo','BA99342bob','yoon.koo@uts.edu.au','01234567','Customer',false)
,('Jasper','Park','BA99342bob', 'jasper.park@uts.edu.au','01234567','Customer',false)
,('Alex','Wu','BA99342bob','alex.wu@uts.edu.au','01234567','Customer',false)
,('Aaron','Lee','BA99342bob','aaron.lee@uts.edu.au','01234567','Customer',false)
,('Hugh','Jeon','BA99342bob','hugh.jeon@uts.edu.au','01234567','Customer',false)
,('Sasha','Kurt','BA99342bob','jane.doe@uts.edu.au','01234567','Customer',false)
,('Rob','Aubry','BA99342bob', 'helen.strokes@uts.edu.au','01234567','Customer',false)
,('Jenna','Dora','BA99342bob','jim.carry@uts.edu.au','01234567','Customer',false)
,('Peter','Tempel','BA99342bob','steve.miller@uts.edu.au','01234567','Customer',false)
,('Bobby','Hallock','BA99342bob','john.smith@uts.edu.au','01234567','Customer',false)
,('Andy','Ruckman','BA99342bob','yoon.koo@uts.edu.au','01234567','Customer',false)
,('Chris','Dease','BA99342bob', 'jasper.park@uts.edu.au','01234567','Customer',false)
,('Chen','Zhu','BA99342bob','alex.wu@uts.edu.au','01234567','Customer',false)
,('Sammy','Packett','BA99342bob','aaron.lee@uts.edu.au','01234567','Customer',false)
,('Elizabeth','Owen','BA99342bob','hugh.jeon@uts.edu.au','01234567','Customer',false);
/*
 ADD Staffs
*/

INSERT INTO USERS(fName,lName,password,email,mobileNum,usertype,active)
    VALUES('Emily','Doe','BA99342bob','emily.doe@uts.edu.au','01234567','Staff',false)
,('Jeremy','Strokes','BA99342bob', 'jeremy.strokes@uts.edu.au','01234567','Staff',false)
,('Cameron','Carry','BA99342bob','cameron.carry@uts.edu.au','01234567','Staff',false)
,('Jeff','Miller','BA99342bob','jeff.miller@uts.edu.au','01234567','Staff',false)
,('Millie','Smith','BA99342bob','millie@uts.edu.au','01234567','Staff',false)
,('Sarah','Davine','BA99342bob','sarah.davine@uts.edu.au','01234567','Staff',false)
,('Lara','Johns','BA99342bob', 'lara.johns@uts.edu.au','01234567','Staff',false)
,('Marba','Rob','BA99342bob','marba.rob@uts.edu.au','01234567','Staff',false)
,('Josh','Carrot','BA99342bob','josh.carrot@uts.edu.au','01234567','Staff',false)
,('Kate','Haskins','BA99342bob','kate.haskins@uts.edu.au','01234567','Staff',false);