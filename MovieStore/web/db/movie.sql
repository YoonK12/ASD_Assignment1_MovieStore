CREATE TABLE MOVIE (
  movieID int GENERATED ALWAYS AS IDENTITY NOT NULL,
  title varchar(128) NOT NULL,
  director varchar(64) NOT NULL,
  description varchar(800) NOT NULL,
  image blob,
  price varchar(40) NOT NULL,
  released_date varchar(50) NOT NULL,
  category varchar(50),
  PRIMARY KEY (movieID)
)