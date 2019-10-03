/**************************************************************************/
/*  date    	programmer			notes                                 */ 
/*                                                                        */ 
/*  10/3/19		Zach Ahrendsen		created database, readonly user,      */ 
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






