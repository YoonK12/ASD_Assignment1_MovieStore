



CREATE TABLE LOGS (
logId INT not null primary key
        GENERATED ALWAYS AS IDENTITY
        (START WITH 100, INCREMENT BY 1), 
userId INT,
timestamp Timestamp,
description VARCHAR(50)
);

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
