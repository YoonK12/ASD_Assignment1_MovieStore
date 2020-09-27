
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  yoonkoo
 * Created: 18/09/2020
 */

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

INSERT INTO USERS(fName,lName,password,email,mobileNum,usertype,active)
    VALUES('Emily','Doe','BA99342bob','amily.doe@uts.edu.au','01234567','Admin',false)
,('my','Strokes','BA99342bob', 'my.strokes@uts.edu.au','01234567','Admin',false)
,('ron','Carry','BA99342bob','ron.carry@uts.edu.au','01234567','Admin',false)
,('Jeff','Mil','BA99342bob','mil@uts.edu.au','01234567','Admin',false)
,('Mie','Smith','BA99342bob','mie@uts.edu.au','01234567','Admin',false)
,('Sara','Dave','BA99342bob','sara.davine@uts.edu.au','01234567','Admin',false)
,('Lara','Jo','BA99342bob', 'la.johns@uts.edu.au','01234567','Admin',false)
,('Maba','Ro','BA99342bob','maba.rob@uts.edu.au','01234567','Admin',false)
,('Jo','Carrot','BA99342bob','jo.carrot@uts.edu.au','01234567','Admin',false)
,('Kate','kins','BA99342bob','kate.@uts.edu.au','01234567','Admin',false);

/*
 INITIALISE Category
*/
INSERT into MS.CATEGORY (name) values
('THRILLER'),
('ROMANCE'),
('ACTION'),
('FANTASY'),
('COMEDY'),
('DRAMA'),
('MYSTERY'),
('HORROR');

/*
 ADD Values in Logs
*/

INSERT INTO LOGS(userId,timestamp,description)
    VALUES (1,'2020-02-01 12:03:23','Login'),
(2,'2018-02-17 10:23:43','Logout'),
(3,'2018-02-17 05:50:37','Logout'),
(4,'2019-12-30 20:28:59','Session Error'),
(5,'2020-04-22 00:00:37','Session Expired'),
(6,'2010-11-18 18:49:40','Login'),
(7,'2012-08-01 13:27:57','Logout'),
(8,'2020-06-19 23:43:20','Session Resumed'),
(9,'2020-03-12 10:27:36','Login'),
(10,'2019-10-25 16:10:32','Login'),
(11,'2019-03-05 10:33:03','Login'),
(12,'2019-03-05 15:33:03','Logout'),
(13,'2020-02-01 12:03:23','Login'),
(14,'2018-02-17 10:23:43','Logout'),
(15,'2018-02-17 05:50:37','Logout'),
(16,'2019-12-30 20:28:59','Session Error'),
(17,'2020-04-22 00:00:37','Session Expired'),
(18,'2010-11-18 18:49:40','Login'),
(19,'2012-08-01 13:27:57','Logout'),
(20,'2020-06-19 23:43:20','Session Resumed'),
(21,'2020-03-12 10:27:36','Login'),
(22,'2019-10-25 16:10:32','Login'),
(23,'2019-03-05 10:33:03','Login'),
(24,'2019-03-05 15:33:03','Logout');