create database sweetha;

use sweetha;

CREATE TABLE members (

    username VARCHAR(100) NOT NULL,          
    email VARCHAR(100) NOT NULL UNIQUE,          
    password VARCHAR(255) NOT NULL,             
    gender ENUM('Male', 'Female', 'Other') NOT NULL,  
    college VARCHAR(100) NOT NULL,    
    branch VARCHAR(100) NOT NULL,               
    role ENUM('admin', 'client', 'participant') NOT NULL

);

SELECT * FROM MEMBERS;
SELECT password FROM members WHERE email = 'sweethapusarla@gmail.com';


CREATE TABLE event_registrations (
   username VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    college VARCHAR(100) NOT NULL,
    branch VARCHAR(100) NOT NULL,
    events varchar(100) NOT NULL 
);
SELECT * FROM  event_registrations;



CREATE TABLE song_selections (
    song_name VARCHAR(50) PRIMARY KEY,
    count INT DEFAULT 0
);

CREATE TABLE song_selections (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100),
    song VARCHAR(100)
);


SELECT   * from song_selections;

DROP TABLE song_selections;

CREATE TABLE dance_selections (
    id INT AUTO_INCREMENT PRIMARY KEY,
     username VARCHAR(255) NOT NULL,
    dance_name VARCHAR(255) NOT NULL
   
);

SELECT * FROM dance_selections;

