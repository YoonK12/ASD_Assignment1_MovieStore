CREATE TABLE "ACCESSLOGS"
(    
   "accessID" INT not null primary key
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),   
   "email" VARCHAR(255),     
   "dateTime" TIMESTAMP default CURRENT_TIMESTAMP
)