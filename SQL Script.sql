drop table school_club_t cascade constraints;

drop table student_run_t cascade constraints;

drop table undergrad_president_t cascade constraints;

drop table school_sponsored_club_t cascade constraints;

drop table faculty_t cascade constraints;

drop table department_t cascade constraints;

drop table meeting_time_t cascade constraints;

drop table building_t cascade constraints;

drop table event_t cascade constraints;

drop table equipment_use_t cascade constraints;

drop table equipment_t cascade constraints;

create table building_t
(build_id number not null,
build_name varchar (30),
build_address varchar (25),
no_of_rooms number,
constraint building_t_PK primary key(Build_ID));

create table department_t
(dept_id number not null,
dept_name varchar (30),
constraint department_t_PK primary key (Dept_ID));

create table school_club_t
(club_id number NOT NULL ,
club_name VARCHAR(30) ,
club_type varchar(30) ,
constraint school_club_PK primary key (club_id));

create table equipment_t
(equip_id number not null ,
description varchar(45) ,
constraint equipment_t_PK primary key (equip_id));

create table undergrad_president_t
(ugradpres_id number not null , 
ugradpres_name varchar(30) , 
date_of_birth date default sysdate,
constraint undergrad_pres_PK primary key (ugradpres_id));

create table student_run_t
(studentclub_id number not null ,
ugradpres_id number not null ,
founding_date date default sysdate , 
club_dues number , 
constraint student_run_PK primary key (studentclub_id),
constraint student_run_FK1 foreign key (studentclub_id) references school_club_t(club_id),
constraint student_run_FK2 foreign key (ugradpres_id) references undergrad_president_t(ugradpres_id));

create table event_t
(event_id number not null ,
build_id number ,
event_name varchar(45) , 
constraint event_PK primary key (event_id),
constraint event_FK1 foreign key (build_id) references building_t(build_id));

create table equipment_use_t
(equip_id number not null , 
event_id number not null , 
date_used date default sysdate ,
constraint equip_use_PK primary key (equip_id, event_id),
constraint equip_use_FK1 foreign key (equip_id) references equipment_t(equip_id),
constraint equip_use_FK2 foreign key (event_id) references event_t(event_id));

CREATE TABLE Faculty_T
(Fac_ID number NOT NULL,
Dept_ID number NOT NULL,
Faculty_Name VARCHAR (30),
DOB DATE DEFAULT SYSDATE ,
Address VARCHAR (30),
Phone Number,
CONSTRAINT Faculty_T_PK PRIMARY KEY (Fac_ID),
CONSTRAINT Faculty_T_FK1 FOREIGN KEY (Dept_ID) REFERENCEs Department_T(Dept_ID));

CREATE TABLE School_Sponsored_Club_T
(schoolClub_ID number NOT NULL,
Fac_ID number NOT NULL ,
Amount_Sponsored number,
Source_of_Sponsor VARCHAR (30),
CONSTRAINT School_Sponsored_Club_T_PK PRIMARY KEY (schoolclub_id),
CONSTRAINT School_Sponsored_club_T_FK1 FOREIGN KEY (schoolclub_id) REFERENCEs School_club_T(Club_ID),
CONSTRAINT School_Sponsored_club_T_FK2 FOREIGN KEY (Fac_ID) REFERENCEs Faculty_T(Fac_ID));

CREATE TABLE Meeting_time_T 
(Meeting_ID number NOT NULL,
Build_ID number NOT NULL,
Club_ID number NOT NULL ,
Meeting_date VARCHAR (25),
Meeting_time VARCHAR (25),
CONSTRAINT Meeting_time_t_PK PRIMARY KEY (Meeting_ID),
CONSTRAINT Meeting_time_T_FK1 FOREIGN KEY (Build_ID) REFERENCEs Building_T(Build_ID),
CONSTRAINT Meeting_time_T_FK2 FOREIGN KEY (Club_ID) REFERENCEs School_club_t(Club_ID));

INSERT into school_club_t (Club_ID, club_name, Club_type) values (01,'AITP', 'School Sponsored');
INSERT into school_club_t (Club_ID, club_name, Club_type) values (02,'Linux User Group', 'School Sponsored');
INSERT into school_club_t (Club_ID, club_name, Club_type) values (03,'MHL', 'School Sponsored');
INSERT into school_club_t (Club_ID, club_name, Club_type) values (04,'ISA', 'Student Run');
INSERT into school_club_t (Club_ID, club_name, Club_type) values (05,'Alpha Kappa Psi', 'Student Run');
INSERT into school_club_t (Club_ID, club_name, Club_type) values (06,'ICF', 'Student Run');
INSERT into school_club_t (Club_ID, club_name, Club_type) values (07,'American Marketing Association','School Sponsored');
INSERT into school_club_t (Club_ID, club_name, Club_type) values (08,'Financial Management','School Sponsored');
INSERT into school_club_t (Club_ID, club_name, Club_type) values (09,'Theta Tau','School Sponsored');
INSERT into school_club_t (Club_ID, club_name, Club_type) values (10,'Coloring Book Club','Student Run');
INSERT into school_club_t (Club_ID, club_name, Club_type) values (11,'Hyper Loop','Student Run');
INSERT into school_club_t (Club_ID, club_name, Club_type) values (12,'Active Minds','Student Run');
INSERT into school_club_t (Club_ID, club_name, Club_type) values (13,'Medical Student Government','School Sponsored');
INSERT into school_club_t (Club_ID, club_name, Club_type) values (14,'Engage','School Sponsored');
INSERT into school_club_t (Club_ID, club_name, Club_type) values (15,'Global Medical Training','School Sponsored');
INSERT into school_club_t (Club_ID, club_name, Club_type) values (16,'Mixed Martial Arts','Student Run');
INSERT into school_club_t (Club_ID, club_name, Club_type) values (17,'Fit University','Student Run');
INSERT into school_club_t (Club_ID, club_name, Club_type) values (18,'Chess Club','Student Run');
INSERT into school_club_t (Club_ID, club_name, Club_type) values (19,'Fencing Club','Student Run');
INSERT into school_club_t (Club_ID, club_name, Club_type) values (20,'Business Student Ambassadors','School Sponsored');

insert into department_t values (01, 'School Faculty');
insert into department_t values (02, 'Students Association');
insert into department_t values (03, 'Chemistry');
insert into department_t values (04, 'Mathematics');
insert into department_t values (05, 'Computer Science');
insert into department_t values (06, 'Information Systems');
insert into department_t values (07, 'Sociology');

insert into faculty_t values (001, 01, 'John Stemmings', '01/05/1990', '111 Cumberland Street', 1112223344);
insert into faculty_t values (002, 01, 'Kyle Worthington', '01/13/1980', '121 South Street', 1112224321);
insert into faculty_t values (003, 02, 'Paula Schrum', '02/05/1945', '222 Goshen Street', 1112224545);
insert into faculty_t values (004, 03, 'Charles Simmons', '03/05/1987', '333 Main Street', 1112226677);
insert into faculty_t values (005, 04, 'Ryan Householder', '04/05/1972', '444 Cary Street', 1112229090);
insert into faculty_t values (006, 05, 'James Miller', '05/05/1969', '555 Sherwood Street', 1112221234);
insert into faculty_t values (007, 06, 'Danielle Kearney', '06/05/1963', '666 Forest Street', 1112224321);
insert into faculty_t values (008, 07, 'Alex Oherst', '07/05/1963', '777 Rowland Street', 1112223221);
insert into faculty_t values (009, 01, 'Nicholas Dillon', '08/05/1962', '888 Temple Street', 1112223478);
insert into faculty_t values (010, 02, 'Paul Lambert', '09/05/1961', '999 Leigh Street', 1112228712);

insert into building_t values (01, 'Snead', '301 W Main Street', 80);
insert into building_t values (02, 'Temple', '901 W Main Street', 45);
insert into building_t values (03, 'Engineering West Hall', '601 W Main Street', 70);
insert into building_t values (04, 'James Cabell Library', '901 Park Avenue', 65);
insert into building_t values (05, 'Engineering East Hall', '401 W Main Street', 70);
insert into building_t values (06, 'Cary Street Gym', '101 S Linden Street', 40);
insert into building_t values (07, 'School Commons', '907 Floyd Avenue', 30);

insert into event_t values (01, 01, 'Career Fair');
insert into event_t values (02, 04, 'Club Meeting');
insert into event_t (Event_id, Event_name) values (03, 'Fundraising Event');
insert into event_t values (04, 02, 'Club Recruiting');
insert into event_t values (05, 05, 'Executives Meeting');
insert into event_t values (06, 03, 'Club Event Planning');
insert into event_t (Event_id, Event_name) values (07, 'Group Exercises');

insert into equipment_t values (01, 'Table');
insert into equipment_t values (02, 'Chair');
insert into equipment_t values (03, 'Projector');
insert into equipment_t values (04, 'Whiteboard');
insert into equipment_t values (05, 'Desk');
insert into equipment_t values (06, 'Computer');
insert into equipment_t values (07, 'Power Strip');

insert into equipment_use_t values (01, 01, '01.03.2017');
insert into equipment_use_t values (02, 02, '02.13.2016');
insert into equipment_use_t values (03, 03, '03.23.2017');
insert into equipment_use_t values (04, 04, '04.08.2018');
insert into equipment_use_t values (05, 04, '05.12.2017');
insert into equipment_use_t values (06, 06, '06.05.2017');
insert into equipment_use_t values (07, 01, '07.29.2016');

insert into undergrad_president_t values (01, 'John Stamos', '02/16/1934');
insert into undergrad_president_t values (02, 'Peter Jennings', '12/15/1967');
insert into undergrad_president_t values (03, 'Peter Stamos', '11/12/1990');
insert into undergrad_president_t values (04, 'Linda Wingfield', '05/01/1995');
insert into undergrad_president_t values (05, 'Casey Williamson', '06/09/1967');
insert into undergrad_president_t values (06, 'Kenny Ly', '07/27/1967');
insert into undergrad_president_t values (07, 'Rolphy Macwan', '08/03/1967');
insert into undergrad_president_t values (08, 'Colin Klimowski', '09/30/1967');
insert into undergrad_president_t values (09, 'Pablo Stevenson', '10/12/1967');
insert into undergrad_president_t values (10, 'Max Chillington', '01/25/1967');

insert into student_run_t values (04, 01, '12/01/2012', '10');
insert into student_run_t values (05, 02, '01/03/2015', '20');
insert into student_run_t values (06, 03, '02/05/2012', '30');
insert into student_run_t values (10, 04, '03/07/2017', '35');
insert into student_run_t values (11, 05, '04/09/2013', '45');
insert into student_run_t values (12, 06, '04/10/2013', '50');
insert into student_run_t values (16, 07, '05/13/2011', '5');
insert into student_run_t values (17, 08, '05/15/2010', '0');
insert into student_run_t values (18, 09, '06/25/2010', '40');
insert into student_run_t values (19, 10, '07/27/2012', '07');

insert into school_sponsored_club_t values (01, 01, 200, 'Personal');
insert into school_sponsored_club_t values (02, 02, 100, 'Grant');
insert into school_sponsored_club_t values (03, 03, 1000, 'Raffle');
insert into school_sponsored_club_t values (07, 04, 2000, 'Potluck');
insert into school_sponsored_club_t values (08, 05, 150, 'Bake Sale');
insert into school_sponsored_club_t values (09, 06, 20, 'Raffle');
insert into school_sponsored_club_t values (13, 07, 2000, 'Grant');
insert into school_sponsored_club_t values (14, 08, 2500, 'Grant');
insert into school_sponsored_club_t values (15, 09, 75, 'Grant');
insert into school_sponsored_club_t values (20, 10, 130, 'Personal');

INSERT into meeting_time_t (Meeting_id, Build_id, club_id, Meeting_date, Meeting_time) values (01, 01, 01, '01-AUG-2017',  '12:00 PM');
INSERT into meeting_time_t (Meeting_id, Build_id, club_id, Meeting_date, Meeting_time) values (02, 03, 02, '12-AUG-2017', '11:30 AM');
INSERT into meeting_time_t (Meeting_id, Build_id, club_id, Meeting_date, Meeting_time) values (03, 02, 03, '27-AUG-2017', '1:45 PM');
INSERT into meeting_time_t (Meeting_id, Build_id, club_id, Meeting_date, Meeting_time) values (04, 07, 04, '11-SEP-2017','10:15 AM');
INSERT into meeting_time_t (Meeting_id, Build_id, club_id, Meeting_date, Meeting_time) values (05, 04, 05, '15-SEP-2017','5:45 PM');
INSERT into meeting_time_t (Meeting_id, Build_id, club_id, Meeting_date, Meeting_time) values (06, 05, 06, '27-SEP-2017', '7:00 PM');
INSERT into meeting_time_t (Meeting_id, Build_id, club_id, Meeting_date, Meeting_time) values (07, 06, 07, '27-AUG-2017', '1:30 PM');
INSERT into meeting_time_t (Meeting_id, Build_id, club_id, Meeting_date, Meeting_time) values (08, 02, 08, '28-AUG-2017', '8:30 PM');
INSERT into meeting_time_t (Meeting_id, Build_id, club_id, Meeting_date, Meeting_time) values (09, 01, 09, '05-OCT-2017', '9:30 PM');
INSERT into meeting_time_t (Meeting_id, Build_id, club_id, Meeting_date, Meeting_time) values (10, 06, 10, '10-OCT-2017', '4:45 PM');
INSERT into meeting_time_t (Meeting_id, Build_id, club_id, Meeting_date, Meeting_time) values (11, 04, 11, '20-OCT-2017', '8:45 PM');
INSERT into meeting_time_t (Meeting_id, Build_id, club_id, Meeting_date, Meeting_time) values (12, 02, 12, '05-NOV-2017', '10:45 AM');
INSERT into meeting_time_t (Meeting_id, Build_id, club_id, Meeting_date, Meeting_time) values (13, 05, 13, '11-NOV-2017', '12:30 PM');
INSERT into meeting_time_t (Meeting_id, Build_id, club_id, Meeting_date, Meeting_time) values (14, 07, 14, '15-NOV-2017', '8:00 PM');
INSERT into meeting_time_t (Meeting_id, Build_id, club_id, Meeting_date, Meeting_time) values (15, 01, 15, '14-NOV-2017', '10:30 PM');
INSERT into meeting_time_t (Meeting_id, Build_id, club_id, Meeting_date, Meeting_time) values (16, 03, 16, '21-NOV-2017', '7:30 PM');
INSERT into meeting_time_t (Meeting_id, Build_id, club_id, Meeting_date, Meeting_time) values (17, 02, 17, '27-NOV-2017', '11:30 PM');
INSERT into meeting_time_t (Meeting_id, Build_id, club_id, Meeting_date, Meeting_time) values (18, 05, 18, '04-DEC-2017', '6:30 PM');
INSERT into meeting_time_t (Meeting_id, Build_id, club_id, Meeting_date, Meeting_time) values (19, 04, 19, '07-DEC-2017', '11:45 AM');
INSERT into meeting_time_t (Meeting_id, Build_id, club_id, Meeting_date, Meeting_time) values (20, 07, 20, '12-DEC-2017', '10:30 PM');
​