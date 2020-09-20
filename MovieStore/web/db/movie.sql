CREATE TABLE MOVIE (
  movieID int GENERATED ALWAYS AS IDENTITY NOT NULL,
  title varchar(128) NOT NULL,
  director varchar(64) NOT NULL,
  description varchar(800) NOT NULL,
  image blob NOT NULL,
  price varchar(40) NOT NULL,
  released_date varchar(50) NOT NULL,
  categoryID INT,
  PRIMARY KEY (movieID),
  CONSTRAINT FK_movieCategory FOREIGN KEY (categoryID) 
REFERENCES Category(categoryID)
) 