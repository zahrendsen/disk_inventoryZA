/**************************************************************************/
/*  date    	programmer			notes                                 */ 
/*                                                                        */ 
/*  10/3/19		Zach Ahrendsen		created database, readonly user,      */ 
/*  10/11/19	Zach Ahrendsen		inserted and modfied table data       */ 
/*                                                                        */ 
/**************************************************************************/

USE master;
GO
IF  DB_ID('disk_inventoryZA') IS NOT NULL
    DROP DATABASE disk_inventoryZA;
GO

CREATE DATABASE disk_inventoryZA;
GO

use disk_inventoryZA
GO

create table genre(
genre_id int not null identity primary key,
genre_desc nvarchar(255) not null
); 

create table disk_type(
disk_type_id int not null identity primary key,
disk_type_desc nvarchar(255) not null
); 

create table status(
status_id int not null identity primary key,
status_desc nvarchar(255) not null
); 

create table artist_type(
artist_type_id int not null identity primary key,
artist_type_desc nvarchar(255) not null
); 

create table borrower(
borrower_id int not null identity primary key,
fname nvarchar(100) not null,
lname nvarchar(100) not null,
phonenumber nvarchar(100) not null
); 

create table artist(
artist_id int not null identity primary key,
fname nvarchar(100) not null,
lname nvarchar(100) null,
artist_type_id int not null references artist_type(artist_type_id)
); 

create table disk(
disk_id int not null identity primary key,
disk_name  nvarchar(100) not null,
release_date date not null,
status_id int not null  references status(status_id),
disk_type_id int not null  references disk_type(disk_type_id),
genre_id int not null  references genre(genre_id)
);

create table borrower_trans(
transaction_id  int not null identity,
disk_id int not null references disk(disk_id),
borrower_id int not null references borrower(borrower_id),
borrowed_date smalldatetime not null,
returned_date smalldatetime null,
primary key (transaction_id, borrower_id, borrowed_date, disk_id)
);

create table artist_disk(
disk_id int not null references disk(disk_id),
artist_id int not null references artist(artist_id),
primary key (disk_id, artist_id)
);


if SUSER_ID('diskza') is null
 create login diskza WITH PASSWORD = 'Pa$$w0rd',
  DEFAULT_DATABASE = disk_inventoryZA;

 if USER_ID('diskza') is null
 create user diskza;

alter role db_datareader add member diskza;
go

-- 10/11/19 

--Inserting unique data into table

insert into status
values ('Borrowed'), ('In Stock');

--Inserting unique data into table
insert into disk_type
values ('CD'), ('DVD');

--Inserting unique data into table
insert into genre
values ('Electronic'), ('Rock'), ('Jazz'), ('Blues'), ('Country'), ('Indie'), ('Pop'), ('Comedy'), ('Easy Listening'), ('Flamenco'), 
	('Folk'), ('Hip Hop'), ('R&B'), ('Metal'), ('Punk'), ('Latin'), ('Avante-Garde'), ('World'), ('Classical'),('Instrumental'), ('Movie');

--Inserting unique data into table
insert into disk
values('Sgt. Pepper’s Lonely Hearts Club Band', '1967', 2, 1, 2),
	('The Wall', '1979', 2, 1, 2),
	('Bad', '1987', 2, 1, 7),
	('Let’s Talk About Love', '1997', 2, 1, 7),
	('Born in the U.S.A.', '1984', 2, 1, 2),
	('Supernatural', '1999', 2, 1, 16),
	('Metallica', '1991', 2, 1, 14),
	('Supernatural', '1999', 2, 1, 16),
	('Appetite for Destruction', '1987', 2, 1, 2),
	('Abbey Road', '1969', 2, 1, 2),
	('Help', '1965', 2, 1, 2),
	('The Godfather', '1972', 2, 2, 21),
	('The Dark Knight', '2008', 2, 2, 21),
	('Citizen Kane', '1941', 2, 2, 21),
	('Titanic', '1997', 2, 2, 21),
	('At Folsom Prison', '1968', 2, 1, 5),
	('Ropin the Wind', '1991', 2, 1, 5),
	('All Eyez on Me', '1996', 2, 1, 12),
	('Ready to Die', '1994', 2, 1, 12),
	('Oracular Spectacular', '2007', 2, 1, 6);

-- Updated genre_id for specific disk
update disk
set genre_id = 1
where disk_id = 22;


--Inserting unique data into table
insert into borrower 
values('Bart', 'Simpson', '555-555-1234'),
('Homer', 'Simpson', '555-555-1334'),
('Marge', 'Simpson', '555-555-1434'),
('Lisa', 'Simpson', '555-555-1534'),
('Abe', 'Simpson', '555-555-1634'),
('Maggie', 'Simpson', '555-555-1734'),
('Ned', 'Flanders', '555-555-1834'),
('Barney', 'Gumble', '555-555-1934'),
('Clancy', 'Wiggum', '555-555-1244'),
('Ralph', 'Wiggum', '555-555-1254'),
('Moe', 'Szyslak', '555-555-1264'),
('Seymour', 'Skinner', '555-555-1274'),
('Todd', 'Flanders', '555-555-1284'),
('Maude', 'Flanders', '555-555-1294'),
('Rod', 'Flanders', '555-555-1235'),
('Sarah', 'Wiggum', '555-555-1236'),
('Kirk', 'Van Houten', '555-555-1237'),
('Luann', 'Van Houten', '555-555-1238'),
('Milhouse', 'Van Houten', '555-555-1239'),
('Agnes', 'Skinner', '555-555-1230');

-- deleted specific borrower row by borrower id
delete borrower
where borrower_id = 15;

--Inserting unique data into table
insert into artist_type
values ('Solo Artist'), ('Group');


--Inserting unique data into table
insert into artist
values('The Beatles', '', 2),
	('Pink Floyd', '', 2),
	('Michael', 'Jackson', 1),
	('Celine', 'Dion', 1),
	('Bruce', 'Springstein', 1),
	('Santana', '', 2),
	('Metallica', '', 2),
	('Guns N Roses', '', 2),
	('Johnny', 'Cash', 1),
	('Garth', 'Brooks', 1),
	('Tupac', 'Shakur', 1),
	('The Notorious B.I.G.', '', 1),
	('MGMT', '', 2),
	('Blink-182','', 2),
	('Bright Eyes','', 2),
	('Cher','', 1),
	('The Doors','', 2),
	('Paul', 'McCartney', 1),
	('John', 'Lennon', 1),
	('Ringo', 'Star', 1);

--Inserting unique data into table

insert into borrower_trans
values(5, 10, '12/8/2017', '12/10/2017'),
	(5, 10, '03/8/2017', '05/8/2017'),
	(10, 10, '10/8/2019', '10/9/2019'),
	(19, 10, '10/9/2019', NULL),
	(17, 10, '07/8/2017', '07/21/2017'),
	(20, 10, '05/09/2016', '07/8/2016'),
	(20, 2, '12/8/2016', '12/12/2016'),
	(8, 10, '09/8/2019', NULL),
	(16, 1, '10/8/2017', '01/01/2018'),
	(16, 4, '01/20/2018', NULL),
	(5, 10, '08/8/2019', NULL),
	(3, 12, '02/01/2019', '02/22/2019'),
	(5, 8, '05/22/2017', '09/22/2017'),
	(5, 10, '01/22/2018', '06/05/2018'),
	(5, 10, '06/13/2019', '06/17/2019'),
	(15, 5, '12/8/2016', NULL),
	(7, 4, '06/13/2019', '06/17/2019'),
	(9, 3, '06/16/2019', '08/23/2019'),
	(4, 4, '07/13/2019', '09/17/2019'),
	(5, 2, '10/13/2019', NULL);

--Inserting unique data into table

insert into artist_disk
values(1,1), (2,2), (3,3), (4,4), (5,5), (6,6), (7,7), (8,6), (9,8), (10,1), (11,1),
	(16,9), (17,10), (18,11), (19,12), (20,13), (1,18), (1,19), (1,20),  (10,18), 
	(10,19), (10,20), (11,18), (11,19), (11,20);

-- Query to list the disks that are on loan and have not been returned
select *
from borrower_trans
where returned_date is null;