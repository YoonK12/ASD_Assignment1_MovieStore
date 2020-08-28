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
/*Insert values*/
INSERT INTO Staffs(sEmail,password,staName,sRole,gender,active)
    VALUES('emily.doe@uts.edu.au','BA99342bob','Emily Doe','Manager',1,false)
,('jeremy.strokes@uts.edu.au','BA99342bob','Jeremy Strokes','Manager',1,false)
,('cameron.carry@uts.edu.au','BA99342bob','Cameron Carry','Manager',0,false)
,('jeff.miller@uts.edu.au','BA99342bob','Jeff Miller','Manager',0,false)
,('millie.smith@uts.edu.au','BA99342bob','Millie Smith','Admin',1,false);
