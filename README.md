# Movie Store
## ASD Project (Assignment 2 - Release 1)
A prototype Java web application for a online streaming service.

## Database Setup (including sample data)
1. Open `MovieStore` project folder in [NetBeans IDE 8.2](https://netbeans.org/downloads/8.2/rc/)
2. Go to 'Services', create 'MSdb' database, put 'ms' in username and 'admin' in password field. 
3. In '`Web Pages` > `db`', run (in order):
    1. `createTables.sql`
    2. `initialValues.sql`

## Usage

### Method 1: Run from project

1. Open `MovieStore` project folder in [NetBeans IDE 8.2](https://netbeans.org/downloads/8.2/rc/)
2. Run project

### Method 2: Run from WAR file

1. Unzip `asd-moviestore-r1.war`
2. Create a subfolder named `web` inside the unzipped folder
3. Move all files in the unzipped folder into `web`
4. Open [NetBeans IDE 8.2](https://netbeans.org/downloads/8.2/rc/) > New Project > Java Web > Web Application with Existing Sources
5. Set the Location field to the unzipped folder
6. Use default values for all other fields
7. Run project

## Built with
JSP, Java, MySql
