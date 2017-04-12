ALTER TABLE Cars
drop CONSTRAINT Cars_fk0;
ALTER TABLE Cars
drop CONSTRAINT Cars_fk1;
ALTER TABLE Pictures
drop CONSTRAINT Pictures_fk0;
ALTER TABLE Feedback
drop CONSTRAINT Feedback_fk0;
ALTER TABLE Feedback
drop CONSTRAINT Feedback_fk1;
ALTER TABLE Favourite
drop CONSTRAINT Favourite_fk0;
ALTER TABLE Favourite
drop CONSTRAINT Favourite_fk1;
ALTER TABLE Comments
drop CONSTRAINT Comments_fk0;
ALTER TABLE Comments
drop CONSTRAINT Comments_fk1;
ALTER TABLE Preferences
drop CONSTRAINT Preferences_fk0;
ALTER TABLE Preferences
drop CONSTRAINT Preferences_fk1;

DROP TABLE Models;
Drop table Cars;
Drop table Pictures;
Drop TABLE Users;
Drop table Feedback;
Drop table Comments;
drop table Preferences;
drop table Favourite;

CREATE TABLE Models (
	ID NUMBER(9, 0),
	Make VARCHAR2(20),
	Model VARCHAR2(20),
	constraint MODELS_PK PRIMARY KEY (ID)
);
CREATE TABLE Cars (
	ID NUMBER(9, 0),
	title VARCHAR2(100),
	production_year number(9,0),
	profile_photo blob,
	price NUMBER(9, 0),
	model NUMBER(9, 0),
	fuel_type VARCHAR2(50),
	mileage NUMBER(9, 0),
	body_type NUMBER(9, 0),
	doors_number NUMBER(9, 0),
	color VARCHAR2(20),
	engine_capacity NUMBER(9, 0),
	user_id NUMBER(9, 0),
	constraint CARS_PK PRIMARY KEY (ID)

);
CREATE TABLE Pictures (
	car_id NUMBER(9, 0),
	photo blob
);

CREATE TABLE Users (
	ID NUMBER(9, 0),
	Name VARCHAR2(255),
	forename VARCHAR2(255),
	username VARCHAR2(255),
	email VARCHAR2(255),
	pass VARCHAR2(255),
	phone_number VARCHAR2(255),
	constraint USERS_PK PRIMARY KEY (ID)

);

CREATE TABLE Feedback (
	user_id NUMBER(9, 0),
	user_feedback_id NUMBER(9, 0),
	stars NUMBER(9, 0),
	feedback VARCHAR2(20),
	feedback_date DATE,
	offensive NUMBER(9, 0),
	reason varchar(20)
);
CREATE TABLE Favourite (
	user_id NUMBER(9, 0),
	car_id NUMBER(9, 0)
);

CREATE TABLE Comments (
	car_id NUMBER(9, 0),
	author_id NUMBER(9, 0),
	remarks VARCHAR2(20),
	comment_date DATE,
	offensive NUMBER(9, 0),
	reason varchar2(500)
);

CREATE TABLE Preferences (
	user_id NUMBER(9, 0),
	model_id NUMBER(9, 0),
	fuel_type varchar(20),
	min_price NUMBER(9, 0),
	max_price NUMBER(9, 0),
	engine_capacity NUMBER(9, 0),
	color VARCHAR2(20)
);

ALTER TABLE Cars ADD CONSTRAINT Cars_fk0 FOREIGN KEY (model) REFERENCES Models(ID);
ALTER TABLE Cars ADD CONSTRAINT Cars_fk1 FOREIGN KEY (user_id) REFERENCES Users(ID);

ALTER TABLE Pictures ADD CONSTRAINT Pictures_fk0 FOREIGN KEY (car_id) REFERENCES Cars(ID);

ALTER TABLE Feedback ADD CONSTRAINT Feedback_fk0 FOREIGN KEY (user_id) REFERENCES Users(ID);
ALTER TABLE Feedback ADD CONSTRAINT Feedback_fk1 FOREIGN KEY (user_feedback_id) REFERENCES Users(ID);

ALTER TABLE Favourite ADD CONSTRAINT Favourite_fk0 FOREIGN KEY (user_id) REFERENCES Users(ID);
ALTER TABLE Favourite ADD CONSTRAINT Favourite_fk1 FOREIGN KEY (car_id) REFERENCES Cars(ID);

ALTER TABLE Comments ADD CONSTRAINT Comments_fk0 FOREIGN KEY (car_id) REFERENCES Cars(ID);
ALTER TABLE Comments ADD CONSTRAINT Comments_fk1 FOREIGN KEY (author_id) REFERENCES Users(ID);

ALTER TABLE Preferences ADD CONSTRAINT Preferences_fk0 FOREIGN KEY (user_id) REFERENCES Users(ID);
ALTER TABLE Preferences ADD CONSTRAINT Preferences_fk1 FOREIGN KEY (model_id) REFERENCES Models(ID);
