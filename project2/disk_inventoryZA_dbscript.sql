/**************************************************************************/
/*  date    	programmer			notes                                 */ 
/*                                                                        */ 
/*  10/3/19		Zach Ahrendsen		created database, readonly user,      */ 
/*  10/11/19	Zach Ahrendsen		inserted and modfied table data       */ 
/*  10/17/19	Zach Ahrendsen		added joins and views for data		  */ 
/*  10/24/19	Zach Ahrendsen		added stored procdurues for updating, */ 
/* 									inserting, and deleting				  */ 
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
values('Sgt. Pepper’s Lonely Hearts Club Band', '5/26/1967', 2, 1, 2),
	('The Wall', '11/30/1979', 2, 1, 2),
	('Bad', '8/31/1987', 2, 1, 7),
	('Let’s Talk About Love', '11/14/1997', 2, 1, 7),
	('Born in the U.S.A.', '6/4/1984', 2, 1, 2),
	('Supernatural', '6/15/1999', 2, 1, 16),
	('Metallica', '8/12/1991', 2, 1, 14),
	('Appetite for Destruction', '7/21/1987', 2, 1, 2),
	('Abbey Road', '9/26/1969', 2, 1, 2),
	('Help', '8/6/1965', 2, 1, 2),
	('The Godfather', '3/15/1972', 2, 2, 21),
	('The Dark Knight', '7/18/2008', 2, 2, 21),
	('Citizen Kane', '9/5/1941', 2, 2, 21),
	('Titanic', '12/19/1997', 2, 2, 21),
	('At Folsom Prison', '5/1/1968', 2, 1, 5),
	('Ropin the Wind', '9/2/1991', 2, 1, 5),
	('All Eyez on Me', '2/13/1996', 2, 1, 12),
	('Ready to Die', '9/13/1994', 2, 1, 12),
	('Oracular Spectacular', '10/2/2007', 2, 1, 6);

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
	(2, 10, '05/09/2016', '07/8/2016'),
	(1, 2, '12/8/2016', '12/12/2016'),
	(8, 10, '09/8/2019', NULL),
	(16, 1, '10/8/2017', '01/01/2018'),
	(16, 4, '01/20/2018', NULL),
	(5, 10, '08/8/2019', '08/9/2019'),
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
values(1,1), (2,2), (3,3), (4,4), (5,5), (6,6), (7,7), (8,8), (9,1), (10,1),
	(16,10), (17,11), (18,12), (19,13), (1,18), (1,19), (1,20),  (10,18), 
	(10,19), (10,20), (9,18), (9,19), (9,20);

-- Query to list the disks that are on loan and have not been returned
select *
from borrower_trans
where returned_date is null;

--Shows the disks in the database associated with Individual artists only.
select  disk_name as 'Disk Name', convert(varchar(10), release_date, 101) as 'Release Date', fname as 'First Name', lname as 'Last Names'
from disk
join artist_disk on disk.disk_id = artist_disk.disk_id
join artist on artist.artist_id = artist_disk.artist_id
where artist_type_id = 1
order by lname, fname, disk_name;
go

--View that shows individual artists names
drop view if exists View_Individual_Artist;
go
create view View_Individual_Artist as 
	select artist_id, fname, lname
	from artist
	where artist_type_id = 1 
go
select fname as 'First Name' , lname as 'Last Name'
from View_Individual_Artist

--Shows the disks in the database associated with group artists only.
select disk_name as 'Disk Name', convert(varchar(10), release_date, 101) as 'Release Date', fname as 'Group Name'
from disk
join artist_disk on disk.disk_id = artist_disk.disk_id
join artist on artist.artist_id = artist_disk.artist_id
where artist.artist_id not in 
 (select artist_id from View_Individual_Artist)
 order by fname, disk_name;

 --shows which disks have been borrowed and who has borrowed them.
 select fname as 'First Name', lname as 'Last Name', disk_name as 'Disk Name', 
	convert(varchar(10), borrowed_date, 120) as 'Borrowed Date',
	convert(varchar(10), returned_date, 120) as 'Return Date'
 from borrower
 join borrower_trans on borrower.borrower_id = borrower_trans.borrower_id
 join disk on disk.disk_id = borrower_trans.disk_id
 order by lname, fname, disk_name, borrowed_date, returned_date;

 --shows the number of times a specific disk has been borrowed
 select disk.disk_id as 'Disk ID', disk_name as 'Disk Name', count(*) as 'Times Borrowed'
 from disk
 join borrower_trans on disk.disk_id = borrower_trans.disk_id
 group by disk.disk_id, disk_name
 order by disk.disk_id;

 --shows disks currently being borrowed/on loan and who has them.
select disk_name as 'Disk Name', 
	convert(varchar(10), borrowed_date, 120) as 'Borrowed',
	convert(varchar(10), returned_date, 120) as 'Return',
	lname as 'Last Name' 
from disk
join borrower_trans on disk.disk_id = borrower_trans.disk_id
join borrower on borrower.borrower_id = borrower_trans.borrower_id
where returned_date is null
order by disk_name;

go

--created stored procedure to insert new artist
drop proc if exists sp_InsArtist;
go

create proc sp_InsArtist
	@fname nvarchar (100),
	@artist_type_id int,
	@lname nvarchar (100) = null

as
Begin try
INSERT INTO [dbo].[artist]
           ([fname]
           ,[lname]
           ,[artist_type_id])
     VALUES
           (@fname, @lname, @artist_type_id)
end try
	begin catch
		print 'An error occurred. Row was not inserted';
		print 'error number: '+
		convert(varchar(200), error_number());
		print 'error message: '+
		convert(varchar(200), error_message());
	end catch
GO

exec sp_InsArtist 'Prince', 1
--exec sp_InsArtist Null, 1
go


--created stored procedure to update artist row
drop proc if exists sp_UpdArtist;
go

create proc sp_UpdArtist
	@artist_id int,
	@fname nvarchar (100),
	@artist_type_id int,
	@lname nvarchar (100) = null

as
begin try
UPDATE [dbo].[artist]
   SET [fname] = @fname,
       [lname] = @lname,
       [artist_type_id] = @artist_type_id
WHERE artist_id = @artist_id
end try 
begin catch
	print 'An error occurred. Row was not updated';
	print 'error number: '+
	convert(varchar(200), error_number());
	print 'error message: '+
	convert(varchar(200), error_message());
end catch
go

exec sp_UpdArtist 22, 'Bruno', 1, 'Mars';
--exec sp_UpdArtist 22, Null, 1, 'Mars';
go

--created stored procedure to delete artist row
drop proc if exists sp_DelArtist;
go

create proc sp_DelArtist
	@artist_id int

as
begin try
	DELETE FROM [dbo].[artist]
		  WHERE artist_id = @artist_id
end try 
begin catch
	print 'An error occurred. Row was not updated';
	print 'error number: '+
	convert(varchar(200), error_number());
	print 'error message: '+
	convert(varchar(200), error_message());
end catch
go

exec sp_DelArtist 22;
go

--created stored procedure to insert new borrower
drop proc if exists sp_InsBorrower;
go

create proc sp_InsBorrower
	@fname nvarchar (100),
	@lname nvarchar (100),
	@phonenumber nvarchar (100) 

as
Begin try
INSERT INTO [dbo].[borrower]
           ([fname]
           ,[lname]
           ,[phonenumber])
     VALUES
           (@fname, @lname, @phonenumber)
end try
	begin catch
		print 'An error occurred. Row was not inserted';
		print 'error number: '+
		convert(varchar(200), error_number());
		print 'error message: '+
		convert(varchar(200), error_message());
	end catch
GO

exec sp_InsBorrower 'Zach', 'Ahrendsen', '208-555-5555'
--exec sp_InsBorrower Null, 1, 1
go

--created stored procedure to update borrower row
drop proc if exists sp_UpdBorrower;
go

create proc sp_UpdBorrower
	@borrower_id int,
	@fname nvarchar (100),
	@lname nvarchar (100),
	@phonenumber nvarchar (100)

as
begin try
UPDATE [dbo].[borrower]
   SET [fname] = @fname,
       [lname] = @lname,
	   [phonenumber] = @phonenumber
WHERE borrower_id = @borrower_id
end try 
begin catch
	print 'An error occurred. Row was not updated';
	print 'error number: '+
	convert(varchar(200), error_number());
	print 'error message: '+
	convert(varchar(200), error_message());
end catch
go

exec sp_UpdBorrower 21, 'Sam', 'Winchester';
--exec sp_UpdBorrower 21, Null, 'Mars';
go


--created stored procedure to delete borrower row
drop proc if exists sp_DelBorrower;
go

create proc sp_DelBorrower
	@borrower_id int

as
begin try
	DELETE FROM [dbo].[borrower]
		  WHERE borrower_id = @borrower_id
end try 
begin catch
	print 'An error occurred. Row was not updated';
	print 'error number: '+
	convert(varchar(200), error_number());
	print 'error message: '+
	convert(varchar(200), error_message());
end catch
go

exec sp_DelBorrower 21;
go

--created stored procedure to insert new disk
drop proc if exists sp_InsDisk;
go

create proc sp_InsDisk
	@disk_name nvarchar (100),
	@release_date date,
	@status_id int,
	@disk_type_id int,
	@genre_id int

as
Begin try
INSERT INTO [dbo].[disk]
           ([disk_name]
           ,[release_date]
           ,[status_id]
	   ,[disk_type_id]
           ,[genre_id])
     VALUES
           (@disk_name, @release_date, @status_id, @disk_type_id, @genre_id)
end try
	begin catch
		print 'An error occurred. Row was not inserted';
		print 'error number: '+
		convert(varchar(200), error_number());
		print 'error message: '+
		convert(varchar(200), error_message());
	end catch
GO

exec sp_InsDisk 'Jaws', '20 June 1975', 2, 2, 21
--exec sp_InsDisk Null, '20 June 1975', 2, 2, 21

--created stored procedure to update disk row
drop proc if exists sp_UpdDisk;
go

create proc sp_UpdDisk
	@disk_id int,
	@disk_name nvarchar (100),
	@release_date date,
	@status_id int,
	@disk_type_id int,
	@genre_id int
as
begin try
UPDATE [dbo].[disk]
   SET
   [disk_name] = @disk_name,
	 [release_date] = @release_date,
       [status_id] = @status_id,
       [disk_type_id] = @disk_type_id,
       [genre_id] = @genre_id
WHERE  disk_id = @disk_id
end try 
begin catch
	print 'An error occurred. Row was not updated';
	print 'error number: '+
	convert(varchar(200), error_number());
	print 'error message: '+
	convert(varchar(200), error_message());
end catch
go

exec sp_UpdDisk 20,  'November 7, 2013', 2, 2, 21
exec sp_UpdDisk 20, Null, 2, 2, 21
go



--created stored procedure to delete disk row
drop proc if exists sp_DelDisk;
go

create proc sp_DelDisk
	@disk_id int

as
begin try
	DELETE FROM [dbo].[disk]
		  WHERE disk_id = @disk_id
end try 
begin catch
	print 'An error occurred. Row was not updated';
	print 'error number: '+
	convert(varchar(200), error_number());
	print 'error message: '+
	convert(varchar(200), error_message());
end catch
go

exec sp_DelDisk 20;
go

select * from disk



-- grants sps for diskza
grant execute on sp_DelArtist
to diskza;
grant execute on sp_DelBorrower
to diskza;
grant execute on sp_DelDisk
to diskza;
grant execute on sp_InsArtist
to diskza;
grant execute on sp_InsBorrower
to diskza;
grant execute on sp_InsDisk
to diskza;
grant execute on sp_UpdArtist
to diskza;
grant execute on sp_UpdBorrower
to diskza;
grant execute on sp_UpdDisk
to diskza;


drop procedure if exists spCheckout
go

create procedure spCheckout
	@disk_id int,
	@borrower_id int,
	@borrowed_date smalldatetime
as
begin try
insert into borrower_trans
	( disk_id, borrower_id, borrowed_date)
	values ( @disk_id, @borrower_id, @borrowed_date)
update disk
set status_id = '1'
where disk_id = @disk_id
end try
Begin catch
print 'Message: ' + Convert(varchar(200), Error_Message())
End catch
go

grant execute on spCheckout to diskza
go
	